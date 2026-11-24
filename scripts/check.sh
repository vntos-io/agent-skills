#!/usr/bin/env bash
# Runs on every push (.github/workflows/check.yml). Fails when:
#  1. anything under skills/ isn't a Markdown file (skills stay plain text, nothing that runs)
#  2. a SKILL.md is missing its name or description
#  3. a skill in skills/ isn't listed in .claude-plugin/marketplace.json, or the other way round
#  4. a private path or internal name slipped into a public file
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0

bad=$(find skills -type f ! -name '*.md' | sort)
if [ -n "$bad" ]; then echo "Not Markdown (skills must be plain text):"; echo "$bad"; fail=1; fi
exe=$(find skills -type f -perm -u+x | sort)
if [ -n "$exe" ]; then echo "Executable files in skills/:"; echo "$exe"; fail=1; fi

for d in skills/*/; do
  s="${d%/}"; f="$s/SKILL.md"; n=$(basename "$s")
  [ -f "$f" ] || { echo "$s has no SKILL.md"; fail=1; continue; }
  head -1 "$f" | grep -q '^---$' || { echo "$f: no frontmatter"; fail=1; }
  grep -q "^name: $n$" "$f" || { echo "$f: name must be '$n'"; fail=1; }
  grep -q '^description: .\{40,\}' "$f" || { echo "$f: description missing or too short"; fail=1; }
  grep -q "\"./skills/$n\"" .claude-plugin/marketplace.json || { echo "$n is not in marketplace.json"; fail=1; }
done
for p in $(grep -o '"\./skills/[^"]*"' .claude-plugin/marketplace.json | tr -d '"'); do
  [ -d "$p" ] || { echo "marketplace.json lists $p, which doesn't exist"; fail=1; }
done

# private paths and internal names (studio tooling that never ships)
pat='/Users/|~/studio|studio-os|vntos-os|airtable|\brec[A-Za-z0-9]{14}\b|ANTHROPIC_API_KEY|sk-ant-|ghp_|BEGIN (RSA|OPENSSH) PRIVATE'
hits=$(grep -rInE "$pat" --exclude-dir=.git --exclude=check.sh . || true)
if [ -n "$hits" ]; then echo "Private paths or secrets:"; echo "$hits"; fail=1; fi

[ $fail -eq 0 ] && echo "check: ok ($(ls -d skills/*/ | wc -l | tr -d ' ') skills, all plain text)"
exit $fail

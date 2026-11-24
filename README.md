<p align="center"><img src="assets/banner.png" alt="VNTOS Claude skills" width="100%"></p>

# Claude skills, the ones I use every day

A skill is a set of instructions Claude follows for one job. These are the ones I run my own work on at [VNTOS](https://vntos.io), cleaned up so you can use them. They're free to use and change.

Every skill here is one plain file, `SKILL.md`, with no scripts and no code that runs on your computer. Read it before you add it. A check runs on every change to keep it that way ([what it checks](scripts/check.sh)).

## The skills

| Skill | What it does |
|---|---|
| [Meeting prep](skills/meeting-prep/SKILL.md) | Reads your last emails with the person and what's changed for them, then gives you a one-minute card: what you want, what they want, what you can give them, your questions and a 3-sentence opener. |

A follow-up tracker, meeting notes and a writing check are next. Each one gets a page on [vntos.io/resources/skills](https://vntos.io/resources/skills) with a sample of what you get.

## Add a skill to Claude

### In the Claude app

1. Download the zip from the skill's page on [vntos.io](https://vntos.io/resources/skills), or from the [latest release](https://github.com/vntos-io/claude-skills/releases/latest) here. Don't unzip it.
2. In Claude, go to Customize, then Skills.
3. Click +, then Create skill, then Upload a skill, and pick the zip.

If you don't see Skills, turn on code execution first under Settings, then Capabilities. It works on every plan, free included.

### In Claude Code

```bash
claude plugin marketplace add vntos-io/claude-skills
claude plugin install meeting-prep@vntos
```

Then start a new session, or run `/reload-plugins` in one that's already open. Type `/meeting-prep`, or just ask for prep.

## Updates

I keep changing these as I use them, and every change is written down in the [changelog](CHANGELOG.md). A skill keeps its name and its job. If one starts working noticeably differently, its version number jumps from 1.x to 2.0.

- In Claude Code, run `claude plugin update meeting-prep@vntos`, or turn on auto-update for the vntos marketplace under Marketplaces in `/plugin`.
- In the Claude app, download the zip again and upload it over the old one.
- To hear about it, click Watch at the top of this page, then Custom, then Releases. GitHub emails you when a new version is out.

## Questions and problems

Open an [issue](https://github.com/vntos-io/claude-skills/issues/new/choose) if something doesn't work or you have an idea for a skill. I don't take pull requests, since I test every change on my own work first, but ideas in an issue are welcome. For anything security related, see [SECURITY.md](SECURITY.md).

## Want help with more than a skill?

VNTOS builds software and AI tools for small and mid-size companies. If you want Claude set up for how your team works, [book a call](https://vntos.io/start).

## License

[MIT](LICENSE). Use them, change them and share them.

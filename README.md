# ai-configs

Personal Claude Code configuration — managed by AI.

Instead of brittle install scripts and symlinks that break across machines, this repo uses **Claude Code itself as the installer**. The `CLAUDE.md` file contains instructions that Claude Code reads and executes to set up or sync configuration on any device.

## Usage

Clone this repo, open Claude Code inside it, and say:

| Command | What it does |
|---------|-------------|
| **"set me up"** | Install all configs to `~/.claude/` and `~/.agents/` on this machine |
| **"sync back"** | Pull local config changes back into this repo |
| **"check status"** | Show what's different between local and repo (no changes) |

## What's Included

- **Global instructions** — `CLAUDE.md` and `RTK.md` loaded into every conversation
- **Settings** — hooks, status line, model preferences (path-templated for portability)
- **Hooks** — RTK command rewriting, prompt recording
- **Rules** — coding style, testing, security, git workflow (common + language-specific)
- **Skills** — 12 installed skills with source tracking

## Structure

```
claude/
├── global-instructions.md   # → ~/.claude/CLAUDE.md
├── RTK.md                   # → ~/.claude/RTK.md
├── settings.json            # → ~/.claude/settings.json ({{CLAUDE_HOME}} templated)
├── statusline-command.sh    # → ~/.claude/statusline-command.sh
├── hooks/                   # → ~/.claude/hooks/
├── rules/                   # → ~/.claude/rules/
└── skills/                  # → ~/.agents/skills/ (symlinked from ~/.claude/skills/)
    └── skills.json          # Skill manifest (source repos + versions)
```

See `CLAUDE.md` for detailed installation logic and `dependencies.md` for required tools.

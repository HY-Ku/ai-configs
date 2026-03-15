# ai-configs

This repo is the source of truth for Claude Code configuration. It is designed to be read and executed by Claude Code on any machine.

## Commands

The user will ask you to do one of these:

### "set me up" — Install configs to this machine

1. **Detect environment**
   - Resolve `CLAUDE_HOME` = `~/.claude` (expand to absolute path)
   - Resolve `AGENTS_HOME` = `~/.agents` (expand to absolute path)
   - Check OS (macOS / Linux)
   - Check required dependencies (see `dependencies.md`)

2. **Install configuration files**
   - Copy `claude/global-instructions.md` → `$CLAUDE_HOME/CLAUDE.md`
   - Copy `claude/RTK.md` → `$CLAUDE_HOME/RTK.md`
   - Copy `claude/statusline-command.sh` → `$CLAUDE_HOME/statusline-command.sh`
   - Make it executable: `chmod +x $CLAUDE_HOME/statusline-command.sh`

3. **Install settings.json**
   - Read `claude/settings.json` (contains `{{CLAUDE_HOME}}` placeholders)
   - Replace all `{{CLAUDE_HOME}}` with the resolved absolute path
   - If `$CLAUDE_HOME/settings.json` already exists, show a diff and ask before overwriting
   - Write the resolved file to `$CLAUDE_HOME/settings.json`

4. **Install hooks**
   - Create `$CLAUDE_HOME/hooks/` if it doesn't exist
   - Copy all files from `claude/hooks/` → `$CLAUDE_HOME/hooks/`
   - Make them executable: `chmod +x $CLAUDE_HOME/hooks/*`

5. **Install rules**
   - Copy `claude/rules/` → `$CLAUDE_HOME/rules/` (recursive, overwrite)

6. **Install skills**
   - Create `$AGENTS_HOME/skills/` and `$CLAUDE_HOME/skills/` if they don't exist
   - For each directory in `claude/skills/` (skip `skills.json`):
     - Copy the skill directory → `$AGENTS_HOME/skills/<skill-name>/`
     - Create symlink: `$CLAUDE_HOME/skills/<skill-name>` → `$AGENTS_HOME/skills/<skill-name>`
   - Copy `claude/skills/skills.json` → `$AGENTS_HOME/.skill-lock.json`

7. **Verify installation**
   - List all installed files
   - Confirm hooks are executable
   - Confirm skill symlinks resolve correctly
   - Run dependency checks from `dependencies.md`

### "sync back" — Update this repo from local configs

1. **Diff local vs repo** for each config area:
   - `$CLAUDE_HOME/CLAUDE.md` vs `claude/global-instructions.md`
   - `$CLAUDE_HOME/RTK.md` vs `claude/RTK.md`
   - `$CLAUDE_HOME/settings.json` vs `claude/settings.json` (reverse-template: replace absolute `$CLAUDE_HOME` path back to `{{CLAUDE_HOME}}`)
   - `$CLAUDE_HOME/statusline-command.sh` vs `claude/statusline-command.sh`
   - `$CLAUDE_HOME/hooks/*` vs `claude/hooks/*`
   - `$CLAUDE_HOME/rules/` vs `claude/rules/`
   - `$AGENTS_HOME/skills/` vs `claude/skills/` (each skill directory)
   - `$AGENTS_HOME/.skill-lock.json` vs `claude/skills/skills.json`

2. **Show changes** — present a summary of what's different and ask for confirmation

3. **Apply changes** — copy updated files into the repo

4. **Do NOT sync**: session data, caches, telemetry, backups, project memories, plugins — these are machine-specific

### "check status" — Show what's different without changing anything

Run the same diff as "sync back" but only report, don't modify.

## File Layout

```
claude/
├── global-instructions.md   # → ~/.claude/CLAUDE.md
├── RTK.md                   # → ~/.claude/RTK.md (referenced by global-instructions.md)
├── settings.json            # → ~/.claude/settings.json ({{CLAUDE_HOME}} templated)
├── statusline-command.sh    # → ~/.claude/statusline-command.sh
├── hooks/                   # → ~/.claude/hooks/
├── rules/                   # → ~/.claude/rules/
└── skills/                  # → ~/.agents/skills/ (symlinked from ~/.claude/skills/)
    └── skills.json          # → ~/.agents/.skill-lock.json
```

## Templating

`settings.json` uses `{{CLAUDE_HOME}}` as a placeholder for the absolute path to `~/.claude/`. On install, replace with the actual path. On sync back, reverse-replace.

## Important Notes

- Always ask before overwriting existing files that have local changes
- Skills are stored in `~/.agents/skills/` and symlinked from `~/.claude/skills/` (this is how Claude Code expects them)
- The `skills.json` in this repo maps to `~/.agents/.skill-lock.json` on the machine
- Never sync session data, caches, project memories, or telemetry

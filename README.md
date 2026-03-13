# ai-configs

Personal AI tool configurations — skills, hooks, permissions, and instructions.

## Structure

```
claude/
├── CLAUDE.md               # Global instructions loaded by Claude Code
├── RTK.md                  # RTK (Rust Token Killer) docs and usage
├── settings.json           # Hooks + statusLine configuration
├── statusline-command.sh   # Status line script: model, context window bar, usage %
├── hooks/
│   ├── rtk-rewrite.sh      # PreToolUse hook: rewrites bash commands through RTK for token savings
│   └── record-prompts.sh   # UserPromptSubmit hook: logs prompts to daily markdown file on Desktop
└── rules/
    ├── README.md            # Rules system documentation
    ├── common/              # Language-agnostic principles (coding style, git, testing, security, etc.)
    ├── typescript/          # TypeScript/JavaScript specific rules
    ├── python/              # Python specific rules
    ├── golang/              # Go specific rules
    └── swift/               # Swift specific rules
```

## Setup

### Claude Code

Copy files to `~/.claude/`:

```bash
cp claude/CLAUDE.md ~/.claude/CLAUDE.md
cp claude/RTK.md ~/.claude/RTK.md
cp claude/settings.json ~/.claude/settings.json
cp claude/hooks/*.sh ~/.claude/hooks/
cp claude/statusline-command.sh ~/.claude/statusline-command.sh
cp -r claude/rules ~/.claude/rules
chmod +x ~/.claude/hooks/*.sh ~/.claude/statusline-command.sh
```

### Dependencies

- [RTK](https://github.com/rtk-ai/rtk) >= 0.23.0 — token-optimized CLI proxy
- `jq` — required by rtk-rewrite hook

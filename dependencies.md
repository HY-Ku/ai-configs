# Dependencies

Required tools for full functionality. Install before running "set me up".

## RTK (Rust Token Killer)

Token-optimized CLI proxy for Claude Code. Required by `rtk-rewrite.sh` hook.

- **Version**: >= 0.23.0
- **Install**: `cargo install rtk` or see https://github.com/rtk-ai/rtk
- **Verify**: `rtk --version`

## jq

JSON processor. Required by the RTK hook for parsing tool input.

- **Install (macOS)**: `brew install jq`
- **Install (Linux)**: `sudo apt install jq` or `sudo dnf install jq`
- **Verify**: `jq --version`

# Claude Code Global Configuration

## Developer Profile
Read ~/Library/Mobile Documents/com~apple~CloudDocs/claude/dev-profile.md

## Style Guide
Read ~/Library/Mobile Documents/com~apple~CloudDocs/claude/dev-style.md

## General Principles

- **Don't over-engineer** - If the simplest approach works, stop there
- **Verify, don't trust** - Treat LLM-generated analysis (including your own) with skepticism. Always verify with code before trusting observations
- **Ask when in doubt** - If uncertain about whether something is worth doing, ask rather than doing it speculatively
- **Be direct and concise** - Skip basic concepts, focus on trade-offs and non-obvious implications

## Working with Me

**Decision-making:**
- Present options but don't act until told
- When exploring tradeoffs, explicitly say "don't act" and wait for direction
- Prefer migrating to shared utilities over fixing local code that's about to be replaced
- Tidy-ups that follow naturally from a change belong in the same PR, not a follow-up

**When writing commits:**
- Use "Prior to this change... This change..." format for non-trivial commits
- Follow commit discipline from style guide (one thing per commit, xfail pattern for bugs)
- Include function names, edge cases, and business context
- Document limitations and future work when relevant
- Never add "Assistant-model: Claude Code" or any other AI attribution to commit messages

**When creating pull requests:**
- Always create PRs as drafts using `--draft` flag

## Work Context

If the current directory is under `~/projects` or `~/work`, read the last 7 days of entries from `~/Library/Mobile Documents/com~apple~CloudDocs/claude/diary.md` to understand ongoing work, open threads, and project context.

## Skills

Skills are located in `~/.claude/skills/`. Each skill has its own directory with a SKILL.md file.

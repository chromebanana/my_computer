---
name: review-permissions
description: Scan the current conversation's transcript for Bash commands that aren't already in the allow/ask lists, and suggest adding them to settings.local.json.
---

## Step 1 — Find settings.local.json

Run `git rev-parse --git-common-dir` to get the repo root (this handles bare repos with
worktrees correctly). The settings file is at `<git-common-dir>/.claude/settings.local.json`.
Read it to get the existing `permissions.allow` and `permissions.ask` lists.

## Step 2 — Find the transcript

Derive the project slug from the current working directory: replace `/` with `-`, prefix
with `-` (e.g. `/Users/x/projects/foo` → `-Users-x-projects-foo`).

List `~/.claude/projects/<project-slug>/` and read all `.jsonl` files. From each, collect
every `tool_use` entry where `name == "Bash"` and extract the `command` field.

## Step 3 — Filter

Skip any command already covered by a rule in either `permissions.allow` or
`permissions.ask` (exact match or glob).

Skip obvious one-offs: commands containing a specific commit SHA, UUID, or hardcoded
absolute file path that is unlikely to generalise.

## Step 4 — Group and suggest

Group the remaining commands by pattern and propose a generalised glob rule for each
group (replace specific file paths, test names, flags with `*` where sensible). Show:
- The proposed rule
- The raw command(s) it covers

## Step 5 — Ask the user

For each proposed rule, offer three options:
- **Allow** — add to `permissions.allow` (auto-approved in future)
- **Always ask** — add to `permissions.ask` (always prompts, won't appear in future skill runs)
- **Skip** — do nothing

Then write the chosen rules back to the settings file.

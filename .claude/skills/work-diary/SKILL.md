# work-diary

Log daily work to a persistent diary for context continuity and appraisal tracking.

## Usage

```
/work-diary
```

## What it does

1. **Infers work from session:** Reviews the current conversation to understand what you worked on
2. **Prompts for additions:** Asks "Anything else to add to today's entry?"
3. **Appends to diary:** Writes entry to `~/Library/Mobile Documents/com~apple~CloudDocs/claude/diary.md`
4. **Flags achievements:** If you mention marking something as an achievement, adds `[ACHIEVEMENT]` tag

## Entry format

```
YYYY-MM-DD:
<What you worked on, in first person, clinical precision>
<Open threads or next steps>
```

**Style:**
- First person observations ("Discovered X", "Fixed Y", "Investigated Z")
- Clinical precision (function names, specific technical details)
- Factual and specific (no filler, no casual language)
- Include abandoned approaches and failed explorations

## Example

```
2026-03-20:
Fixed passive preference bug in meterpoints registration. Discovered
_update_payment_preference had set_payment_preference inside else block,
so passive schedules weren't persisted. Migrated to
implicit_preferences.set_preference_for_schedule. Next: consolidate
remaining callsites in scheduling code.
```

## Instructions for Claude

When `/work-diary` is invoked:

1. **Review the session:** Analyze the current conversation to extract:
   - What work was completed (bugs fixed, features built, code written)
   - Decisions made
   - Failed explorations or abandoned approaches
   - Open threads or next steps mentioned

2. **Draft the entry:** Write a diary entry following the format and style above. Include:
   - Specific technical details (function names, modules, call sites)
   - Both successful and failed work
   - Next steps or open threads

3. **Prompt for additions:** Show the draft and ask:
   ```
   Here's what I captured from our session:

   [draft entry]

   Anything else to add to today's entry?
   ```

4. **Handle user response:**
   - If user adds context, incorporate it
   - If user says "mark X as achievement", add `[ACHIEVEMENT]` tag to that work
   - If user says "nothing" or similar, proceed

5. **Append to diary:**
   - Create `~/Library/Mobile Documents/com~apple~CloudDocs/claude/diary.md` if it doesn't exist
   - Append the entry under today's date
   - If today already has an entry, append to it on a new line (accumulate under same date)

6. **Confirm:** Show brief confirmation of what was logged

## Edge cases

- If the diary file doesn't exist, create it with a simple header:
  ```
  # Work Diary

  ```
- If multiple entries happen same day, accumulate them under the same date heading
- If session had no meaningful work (just questions/discussion), say "No work to log from this session. Want to manually add an entry?"

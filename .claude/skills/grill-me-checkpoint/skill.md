---
name: grill-me-checkpoint
description: Save a structured checkpoint of the current grill-me session that can be used to resume later. Use when user wants to pause a planning session, switch context, or end a session mid-grill.
---

Produce a structured checkpoint of our current grill-me session in the following format:

## Checkpoint: [plan/design name]
**Date:** [today's date]

### Decisions Made
List every decision we've reached shared understanding on, with a one-line summary of the reasoning.

### Pending Decisions
List every open question and unresolved branch of the decision tree, in the order we should tackle them.

### Current Position
Which branch of the decision tree were we on when we paused? What was the last question we were resolving?

### Key Constraints
Any constraints, requirements or non-negotiables that were established and should frame all future decisions.

### Next Steps
The exact first question to ask when resuming this session.

---
Save this checkpoint to a file named `grill-me-checkpoint-[plan-name]-[date].md` in the current project directory unless instructed otherwise.

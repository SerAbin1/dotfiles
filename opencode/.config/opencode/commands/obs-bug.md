---
description: Persist a bug investigation to Obsidian vault
---
projectName: $1

### Objective
Document the bug from this conversation into the Obsidian file for the current project. 

### Steps
1. Tell the user and stop immediately if projectName is not given.
2. Run `echo "=== Experience ===" && ls ~/Desktop/Documents/Obsidian/Software_Development/Experience/ && echo "=== Projects ===" && ls ~/Desktop/Documents/Obsidian/Software_Development/Projects/` and match against the projectName. If not found, tell the user and stop.
3. Review the conversation to extract: root cause, the fix, and the lesson.
4. Verify all file paths, symbol names, and technical claims by reading the relevant parts of the codebase. Correct anything in the conversation summary that doesn't match reality.
5. Write the formatted section to a variable, then append to the file using `>>`. Do not read the file. Never overwrite existing content.

### Template
# {Bug Title}
## Root Cause
{Exact cause, referencing verified file paths and symbols.}
## Why It Happened
{The assumption or gap that allowed this bug to exist.}
## Fix
{What was changed and why it resolves the root cause.}
## Lesson
{What this reveals about the codebase, architecture, or process — if anything.}

### Constraints
- Verify all technical claims against the codebase before writing.
- Base content on the conversation and codebase only — do not speculate.
- Keep language direct and dense. No filler.

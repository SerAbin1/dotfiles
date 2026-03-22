---
description: Document a bug to Obsidian vault
---
### Objective
Document this bug in the Obsidian file for the current project.

### Steps
1. Identify the current project name from the codebase/current directory (ask user if in doubt).
2. Run `ls ~/desktop/documents/Obsidian/Software_Development/Experience/ && ls ~/desktop/documents/Obsidian/Software_Development/Projects/` to list files, then match against the project name. If not found, tell user.
3. Write the formatted section to a variable, then append it to the end of the file using a shell append operation (`>>`). Do not read the file.

### Template

# {Bug Title}

## Root Cause
{Exact cause, referencing concrete file paths and symbols.}

## Why It Happened
{The assumption or gap that allowed this bug to exist.}

## Fix
{What was changed and why it resolves the root cause.}

## Lesson
{What this reveals about the codebase, architecture, or process — if anything.}

### Constraints
- Never overwrite existing content.
- Base all content strictly on the conversation and codebase — do not speculate.
- Keep language direct and dense, like typical documentation. No filler.

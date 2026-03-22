---
description: Document design decisions and findings to Obsidian vault
---
Topic: $1
Type: $2

### Objective
Document this topic in the Obsidian file for the current project.

### Steps
1. Identify the current project name from the codebase/current directory (ask user if in doubt).
2. Search in ~/Desktop/Documents/Obsidian/Software_Development/ across both Experience/ and Projects/ subdirectories for a file matching or related to the project name. If not found, tell user and ask whether to create the file or abort.
3. Find a top-level heading `# {Topic Title}` that matches this topic — if it doesn't exist, create it at the end of the file and inform user.
4. Write or update content inside that section based on Type (infer type from context; only ask user if genuinely ambiguous).

### Section structure by Type

**feature** — a feature being designed or implemented:

# {Feature Name}
**Date:** DD-MM-YYYY

## Decision
{What approach was chosen and why, any assumptions worth documenting.}

## Alternatives Rejected
| Alternative | Reason Rejected |
|-------------|-----------------|
| ...         | ...             |

## Implementation Notes
{Anything worth knowing about how it was built — non-obvious choices, constraints, tradeoffs made mid-implementation.}

## Issues Encountered
{Bugs or unexpected problems hit during implementation. Append new entries as they occur — do not overwrite.}

### {Short Issue Title}
**Date:** DD-MM-YYYY
{Description and resolution.}

**bug** — a standalone bug:

# {Bug Title}
**Date:** DD-MM-YYYY

## Root Cause
{Exact cause, referencing concrete file paths and symbols.}

## Why It Happened
{The assumption or gap that allowed this bug to exist.}

## Fix
{What was changed and why it resolves the root cause.}

## Lesson
{What this reveals about the codebase, architecture, or process — if anything.}

### Constraints
- Never overwrite existing content without explicit permission from user. Only append to existing sections (e.g. Issues Encountered).
- Base all content strictly on the conversation and codebase — do not speculate.
- $2 must be either `feature` or `bug`. If omitted or unclear, infer from context.
- Keep language direct and dense, like typical documentation. No filler.

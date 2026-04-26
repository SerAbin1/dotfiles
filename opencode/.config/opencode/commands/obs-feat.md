---
description: Persist a feature design or implementation to Obsidian vault
---
### Arguments
- filename = $1
- sectionName = $2

### Objective
Document or update a feature section in the Obsidian file for the current project, drawing from this conversation.

### Steps
1. If `filename` was not provided, tell the user it is required and stop.
1. Run `echo "=== Experience ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/Experience/ && echo "=== Projects ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/Projects/ echo "=== OSS ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/OSS/` and match against the fileName. If not found, tell the user and stop.
3. Review the conversation to extract: the decision made, alternatives rejected, implementation notes, and any issues encountered.
4. Verify all file paths, symbol names, and technical claims by reading the relevant parts of the codebase. Correct anything that doesn't match reality.
5. Build the formatted section in a variable (see Template).
6. Write to file:
   - If `sectionName` was provided and that heading exists: READ and UPDATE only that section.
   - Otherwise: append using `>>`. Do not read the file.

### Template
# {Feature Name}
{What approach was chosen and why. Key assumptions worth preserving.}
## Alternatives Rejected
| Alternative | Reason Rejected |
|-------------|-----------------|
| ...         | ...             |
## Implementation Notes
{Non-obvious choices, constraints, tradeoffs made mid-implementation.}
## Issues Encountered
{Append issues encountered in the order that they occured in.}
### {Short Issue Title}
{Description and resolution.}

### Constraints
- Verify all technical claims against the codebase before writing.
- Never modify content outside the targeted section.
- Base content on the conversation and codebase only. No filler.

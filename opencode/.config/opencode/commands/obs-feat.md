---
description: Document a feature to Obsidian vault
---
### Objective
Document or update a feature section in the Obsidian file for the current project.

### Arguments
- filename = $1
- sectionName = $2

### Steps
1. If `filename` was not provided, tell the user it is required and stop.
2. Run `ls ~/desktop/documents/Obsidian/Software_Development/Experience/ && ls ~/desktop/documents/Obsidian/Software_Development/Projects/` and match `filename` against the results. If no match is found, tell the user and stop.
3. Build the formatted section in a variable (see Template).
4. Write to file:
   - If `sectionName` was provided and a section with that heading exists in the file: read and modify only that section. Do not read the rest of the file.
   - Otherwise: append the section to the end of the file using `>>`. Do not read the file.

### Template
# {Feature Name}
## Decision
{What approach was chosen and why, any assumptions worth documenting.}
## Alternatives Rejected
| Alternative | Reason Rejected |
|-------------|-----------------|
| ...         | ...             |
## Implementation Notes
{Anything worth knowing about how it was built — non-obvious choices, constraints, tradeoffs made mid-implementation.}
## Issues Encountered
{Append new entries as they occur — do not overwrite.}
### {Short Issue Title}
{Description and resolution.}

### Constraints
- Never overwrite or modify content outside the targeted section.
- Base all content strictly on the conversation and codebase — do not speculate.
- Keep language direct and dense. No filler.

---
description: Investigate, answer, fix, and document a bug
---

fileName: $1
sectionName: $2

# Objective
Use the Obsidian section as the source of truth to understand the bug, answer all questions, then (after approval) fix the issue and update the documentation.

1. Run `echo "=== Experience ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/Experience/ && echo "=== Projects ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/Projects/ echo "=== OSS ===" && ls /home/sonu007/Documents/Obsidian/Software_Development/OSS/` and match against the fileName. If not found, tell the user and stop.
2. Read section: "# {sectionName}".
3. Add questions, in addition to any the user may have posed, that could reveal the source of bug and will otherwise be instructive to have answered.
4. Analyze codebase.
5. Answer all questions (explicit + implicit).
6. Identify gaps or incorrect assumptions.
7. Present:
   - Understanding
   - Answers
   - Gaps
   - Proposed Fix
8. WAIT for user approval.
9. Write tests reproducing the bug if applicable.
10. Implement the fix in codebase.
11. Validate correctness via tests or manual.
12. Rewrite section "# {sectionName}" as follows:
   # The name of the section shall match the commit message.
     {Provide bug description}
   ## Fix
      {the implemented fix, add reference to commit hash}
   # Notes
     {any suprises encountered during implementation}

# Constraints
- Do not modify code before approval.
- All claims must be verified against code.
- The section must fully answer the original questions.
- Keep writing dense and technical.

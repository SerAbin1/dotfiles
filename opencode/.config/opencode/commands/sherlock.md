---
description: Investigate the root cause of an unexpected behaviour
---
Behaviour: $1

### Objective
The bug could not be identified by reading the code. Instrument the execution path to get ground truth from runtime output.

### Process
1. Identify the execution path most likely responsible for the behaviour.
2. Add logs across that path — err on the side of more rather than fewer.
3. Tell the user what to run and what to look for in the output.
4. Once the user shares the output, identify the root cause from it.

### Constraints
- Do not attempt to guess or reason to a conclusion — that has already been tried.
- Reference concrete file paths and symbols.
- Base everything strictly on the codebase.

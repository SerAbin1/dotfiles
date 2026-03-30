---
description: Think through a feature or architectural decision
---
Feature design and architecture mode.

Feature or problem: $1

### Objective
Explore the design space, propose an approach, and surface tradeoffs — so a decision can be made before any implementation begins.

### Output
Respond in the conversation with:
- **Problem Statement** — what we're actually solving and why
- **Proposed Approach** — the recommended design with reasoning
- **Alternatives Considered** — other viable approaches and why they're weaker
- **Tradeoffs** — what the chosen approach gives up
- **Open Questions** — anything that needs a decision before or during implementation
- **Implementation Sketch** — rough breakdown of what would need to change (files, interfaces, data shapes)

### Constraints
- Base proposals on the actual codebase — don't invent abstractions that don't fit.
- Do not implement anything.
- Flag assumptions explicitly rather than silently resolving them.

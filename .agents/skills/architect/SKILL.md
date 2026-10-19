---
name: architect
description: Plan the implementation of a feature or change before writing code, applying the coding guidelines. Use after familiarising with the repository and before implementing.
---

# Architect

Produce an implementation plan that fits the existing codebase. Do not write the implementation here. Keep the plan concise.

## Steps

1. Restate what must be built and the constraints, using the familiarisation summary if one exists.
2. Check the premise: is the requirement sound, and is it already solved by something that exists? If not sound or already solved, say so before designing.
3. Decide where the change belongs: which files, modules, and interfaces are added or modified, and which existing code is reused.
4. Define the design: components, their responsibilities, the data flow between them, and the public interfaces.
5. Check the design against the `principle-coding-guidelines` skill and revise where it falls short.
6. Break the work into small, ordered steps that can each be verified, and note how the result will be tested.
7. Record risks, open questions, and assumptions.
8. Save the plan to `.audit/architecture/<feature-name>.md`, following the `audit` skill.

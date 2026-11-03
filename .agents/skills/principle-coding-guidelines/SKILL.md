---
name: principle-coding-guidelines
description: Principles for designing and writing code that is simple, consistent, readable, and maintainable. Use when planning, writing, changing, or reviewing code, such as designing or implementing a feature or fixing a bug.
---

# Coding guidelines

- Reuse what exists before writing new code. Extend it rather than adding a parallel version.
- Keep scope tight. Change only what the task needs, and don't build for needs that don't exist yet.
- Write the simplest code that meets the requirement.
- Match the surrounding code's naming, structure, error handling, and idioms.
- Give each function, class, and module one responsibility and one reason to change. Keep functions small.
- Define small, explicit interfaces. Hide internals and keep coupling low.
- Depend on abstractions and pass dependencies in rather than creating them inside.
- Handle errors and edge cases explicitly. Never swallow failures.
- Isolate side effects so logic can be tested without them.
- Use clear names so the code explains itself. Comment only the why.
- Don't repeat logic, but don't abstract before a pattern is clear.
- Don't leave dead code, debug output, or unrelated changes in the diff.
- Use guard clauses and early returns so the main logic stays at the top indentation level. Avoid more than two levels of nesting and `else` after a branch that exits.
- Give a complex condition or magic value a name, such as `is_expired` or `MAX_RETRIES`, so the reader doesn't have to decode it. If a compact line needs a comment to explain it, spell out the logic in plain steps.
- Split a function body into blocks of related lines separated by blank lines (for example validate, compute, act, return) instead of one unbroken run. Keep a variable's assignment next to its first use.
- Put the main function first and the helpers it calls below it. If the language requires definition before use, place each helper right before its caller.

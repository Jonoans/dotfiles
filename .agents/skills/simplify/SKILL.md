---
name: simplify
description: Review changed code for reuse, simplicity, and efficiency, then apply the fixes. Quality only, not bug hunting. Use after implementing and before review.
---

# Simplify

## Steps

1. Get the changes: the working tree diff, or the diff against the base branch if everything is committed.
2. For each changed area, check:
   - **Reuse:** does the repository already have a function, utility, or pattern that does this?
   - **Duplication:** is the same logic repeated in the change?
   - **Complexity:** can it be shorter, flatter, or clearer without changing behaviour? Remove dead code, needless abstraction, and unused parameters.
   - **Efficiency:** are there obvious waste points, such as repeated work in loops or redundant calls?
   - **Consistency:** do names, structure, and comments match the surrounding code?
3. Apply the fixes. Keep behaviour identical and the diff small.
4. Re-run the tests and lint to confirm nothing changed.
5. Report what you changed and why.

## Notes

- Do not hunt for bugs here. Use `code-review` for that.
- Do not touch code outside the change.

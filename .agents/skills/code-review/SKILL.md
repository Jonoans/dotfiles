---
name: code-review
description: Review a diff, PR, branch, or path for correctness bugs and report the findings. Use after implementing and simplifying, before delivering.
---

# Code review

## Steps

1. Determine the target: the working tree diff by default, or the PR, branch, or path you were given. Read the changed files in full, not only the hunks.
2. Understand the intent from the task, commit messages, or PR description.
3. Look for correctness bugs:
   - Logic errors, off-by-one errors, wrong conditions, and unhandled cases.
   - Missing or swallowed error handling.
   - Null, empty, and boundary inputs.
   - Concurrency, ordering, and state problems.
   - Broken callers, changed contracts, and missing updates elsewhere.
   - Tests that do not test the behaviour they claim to.
4. Verify each suspected bug by tracing the code or running it. Drop anything you cannot support.
5. Report the findings, most severe first. For each, give the `file:line`, the defect, and a concrete failing scenario.
6. Fix the findings if asked, or if the task is to deliver working code, then re-verify.

## Notes

- Report only issues you are confident about. Do not pad the review with style nitpicks.
- If you find nothing, say so.

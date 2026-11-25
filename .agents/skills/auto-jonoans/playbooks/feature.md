# Feature playbook

For tasks that write a new feature.

## Steps

Log a row with `log-your-work` where a step says to.

1. Familiarise with the task and the repository using the `familiarise` skill. For a large or unfamiliar repository, start a subagent and pass it the task context. Otherwise do it yourself. Log what will be reused.
2. Use the `architect` skill to plan the implementation, building on the familiarisation summary. For a small change, a short plan in your reply is enough. Log the plan.
3. Implement the plan in its ordered steps, matching the surrounding code.
4. Write or update tests covering the new behaviour and its edge cases. If you write none, say why in the report.
5. Verify the feature. Run the tests, lint, and build, and use the `run` skill to confirm it works in the real app. If the app cannot run, follow the fallback in `run`. Log the result.
6. Run the `unslop` skill on the comments, docs, descriptions, and messages you added.
7. Run the `simplify` skill on the changes.
8. Run the `code-review` skill on the diff. Also run `security-review` if the feature touches auth, input handling, secrets, or the network. Fix the findings and re-verify. Log each fix.
9. Report what was built, what was verified, anything skipped or failing, and where the audit artifacts are. List skipped steps and why. Do not commit or push unless asked.

## Core Principles

- Verify before claiming done, and report failures as they are.
- Act on sensible defaults and ask only when blocked.
- A small change may use lighter versions of steps 1 and 2. Report anything skipped.
- If two or more fixes for the same problem have not resolved it, use the `principle-challenge-premise` skill.

## Coding guidelines

Follow the `principle-coding-guidelines` skill when implementing.

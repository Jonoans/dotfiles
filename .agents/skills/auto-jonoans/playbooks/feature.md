# Feature playbook

For tasks that write a new feature.

## Steps

1. Start a subagent to invoke the `familiarise` skill first. Pass it the task context (feature, requirements) so it is directed in its objectives.
2. Use the `architect` skill to plan the implementation of the feature, building on the subagent's summary.
3. Implement the plan in its ordered steps, matching the surrounding code.
4. Write or update tests covering the new behaviour and its edge cases.
5. Verify the feature. Run the tests, lint, and build, and use the `run` skill to confirm it works in the real app.
6. Run the `simplify` skill on the changes.
7. Run the `code-review` skill on the diff. Also run `security-review` if the feature touches auth, input handling, secrets, or the network. Fix the findings and re-verify.
8. Report what was built, what was verified, anything skipped or failing, and where the audit artifacts are. Do not commit or push unless asked.

## Core Principles

- Verify before claiming done, and report failures as they are.
- Act on sensible defaults and ask only when blocked.
- If two or more fixes for the same problem have not resolved it, use the `principle-challenge-premise` skill.

## Coding guidelines

Follow the `principle-coding-guidelines` skill when implementing.

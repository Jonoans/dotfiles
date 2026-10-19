---
name: log-your-work
description: Log decision points and checkpoints to a TSV log while working. Use throughout a task to record major decisions, completed verifications, pivots, reverts, blockers, and gates or issues fixed.
---

# Log your work

Record a row in the log each time one of these happens:

- A major decision is made.
- A verification completes.
- You pivot or revert.
- You hit a blocker.
- A gate or issue is fixed.

## Setup

The log is `.audit/decisions/log.tsv` in the project's working directory, as laid out by the `audit` skill. There is nothing to set up by hand. The first call to the script creates the directory, writes the header from `template.tsv`, and adds `.audit` to `.gitignore` if the project is git tracked. Set `LOG_FILE` to use a different path.

## Logging

```bash
scripts/log.sh <phase> <decision> <reason> <reference> <result>
```

Run it from the project's working directory, using the path to this skill's `scripts/log.sh`. Quote every argument. Tabs and newlines are replaced with spaces.

## Columns

| Column | Content |
|---|---|
| timestamp | ISO 8601 UTC, filled in by the script |
| phase | The stage of work, such as `familiarise`, `plan`, `implement`, `verify`, `review`, or `deliver` |
| decision | The decision or action taken |
| reason | Why it was taken |
| reference | What supports the reason: a commit SHA, a `file:line`, an artifact path, or a screenshot path. Not a description. |
| result | What happened as a result of the decision or action |

## Examples

| timestamp | phase | decision | reason | reference | result |
|---|---|---|---|---|---|
| 2026-10-18T14:02:11Z | familiarise | Reuse the existing retry helper instead of writing one | Helper already handles backoff and is used by the other clients | src/http/retry.ts:24 | Plan extends the helper |
| 2026-10-18T14:20:45Z | plan | Add a queue module and keep the API unchanged | Callers depend on the current signature | .audit/architecture/queue-plan.md | Plan approved, 4 steps |
| 2026-10-18T15:03:30Z | implement | Revert to the polling approach | Websocket client drops messages under load | 9f3c2ab | Reverted, tests pass again |
| 2026-10-18T15:41:09Z | implement | Stop and flag the missing API key | Integration tests cannot reach the service | tests/integration/setup.ts:12 | Blocked, key requested |
| 2026-10-18T16:10:52Z | verify | Fix the failing lint gate | Unused import left from the refactor | src/queue/worker.ts:3 | Lint passes |
| 2026-10-18T16:25:03Z | verify | Accept the new layout | Matches the design at all three breakpoints | .audit/screenshots/dashboard-mobile.png | Verification complete |

Example calls:

```bash
scripts/log.sh implement "Revert to the polling approach" "Websocket client drops messages under load" 9f3c2ab "Reverted, tests pass again"
scripts/log.sh verify "Fix the failing lint gate" "Unused import left from the refactor" src/queue/worker.ts:3 "Lint passes"
```

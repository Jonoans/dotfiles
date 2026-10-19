---
name: auto-jonoans
description: Jonoans' working style, preferences, and principles to adhere to when carrying out tasks, plus a catalog mapping task types to playbooks so work can be carried out and completed autonomously. Use at the start of any non-trivial task, or when unsure which skill applies.
---

# Principles

These apply to every task, whatever its type. Principles specific to a kind of work, such as coding, live in the playbook for it.

## Autonomy

- Carry the task through to completion. Act on sensible defaults and ask only when blocked on a decision that is genuinely the user's to make.
- Resolve ambiguity from the request and the code first.
- Do not commit, push, or take other outward-facing actions unless asked.

## Rigour

- Understand the task and what already exists before changing anything, so work is reused rather than duplicated.
- Verify before claiming done, by checking the result against the actual goal.
- Report outcomes as they are. State failures, skipped steps, and unverified claims plainly, and state what is done and verified without hedging.
- If two or more attempts at the same problem have not resolved it, stop and use the `principle-challenge-premise` skill.

## Writing

- Keep prose, comments, and reports plain and concise. Use the `unslop` skill on prose before finalising it.
- Lead reports with the outcome: what was done, what was verified, and what is left.

# Playbooks

Playbooks live in the `playbooks/` subdirectory of this skill and are markdown (`.md`) files. They contain a steps section which should be followed for a given task.

- When a task requires writing a new feature, read `feature`.
- When a new feature idea is being prototyped or experimented with, and is being explored but not yet implemented, read `prototype`.

# Subagents

All subagents spawned while using the playbooks must be spawned with the subagent type set to `jonoans-agent`.

# Logging

You must follow the `log-your-work` skill throughout every task.

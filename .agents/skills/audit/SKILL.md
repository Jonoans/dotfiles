---
name: audit
description: Where and how to write audit artifacts that record agent activity. Use when a task calls for producing artifacts to audit what the agent did, such as architecture plans or logged decisions.
---

# Audit

If artifacts need to be produced for auditing agent activity, write them to the `.audit` directory in the project's working directory. Create it if it doesn't exist.

If the project is git tracked, add a new entry in `.gitignore` to ignore the `.audit` directory. If no `.gitignore` exists, create one.

## Layout

- `.audit/architecture/`: artifacts from the `architect` skill, such as implementation plans.
- `.audit/decisions/`: decisions made during the task, logged one per file.

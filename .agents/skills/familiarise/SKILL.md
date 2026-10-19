---
name: familiarise
description: Familiarise yourself with a task and the existing repository before starting work, so that existing features are not duplicated. Use before beginning any task that adds or changes code.
---

# Familiarise

Before starting work, understand the task and what already exists in the repository. Do not write or change anything during this step.

## 1. Understand the task

- Restate the task and its requirements in your own words.
- Identify the expected outcome, the constraints, and anything ambiguous. Resolve ambiguity from the request and the code first; ask only if still blocked.

## 2. Investigate the repository

- Get the layout: top-level structure, README and docs, agent instruction files (e.g. `AGENTS.md`, `CLAUDE.md`), and build/config files.
- Search for existing code related to the task: relevant keywords, synonyms, function and file names, and similar features.
- Read the matches in full, along with their callers, tests, and configuration, to see how they work and what conventions they follow.
- Check recent history (`git log`, `git log -S <term>`) for related or reverted work.

## 3. Check for duplication

- Decide whether the task is already fully or partly implemented.
- Identify existing code, utilities, and patterns to reuse or extend instead of writing new ones.
- Where the task overlaps with something that exists, plan to modify or build on it rather than add a parallel version.

## 4. Summarise

Before starting the task, note briefly:

- What the task requires.
- What already exists that is relevant (with file paths).
- What genuinely needs to be added or changed, and what will be reused.

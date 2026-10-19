---
name: run
description: Launch the project's app and confirm a change works in the real app, not just in tests. Use when asked to run or screenshot the app, or to verify a feature end to end.
---

# Run

## Steps

1. Find how the project is launched: README, docs, `AGENTS.md`, `CLAUDE.md`, package scripts, Makefile, or compose files. Use an existing project skill for launching the app if there is one.
2. Install dependencies and set up configuration only as far as the docs require. Never invent secrets.
3. Start the app in the background and wait until it is ready, for example a log line or a responding port.
4. Exercise the changed behaviour the way a user would: call the endpoint, run the CLI command, or drive the UI with a browser skill. Check the output against what was requested.
5. Capture evidence, such as output or a screenshot, and save it under `.audit/` if the task asks for audit artifacts.
6. Stop the processes you started.
7. Report what you ran, what you observed, and anything that did not work.

## Notes

- Test the changed behaviour and the edge cases next to it, not only the happy path.
- If the app cannot be run, say why. Do not claim it works.

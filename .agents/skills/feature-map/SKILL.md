---
name: feature-map
description: Build and maintain a concise `.audit/feature-map.md` that records which directory or file implements each part of the program. Use during familiarisation so the whole repository does not need to be re-explored every task.
---

# Feature map

A short index of where functionality lives, so familiarisation can jump to the right place instead of scanning the whole program. It points to code and does not explain it. The file is `.audit/feature-map.md`, as laid out by the `audit` skill, and paths are relative to the repository root.

## When to use

- **Map exists:** read it first and go to the entries relevant to the task. Check that the paths you rely on still exist, and read the code before trusting an entry.
- **Map missing:** build it once, then use it. Skip it if you can survey the repository in a few commands.
- **After the task:** if you added, moved, renamed, or removed a feature, update its entry and leave the others alone.

## Staleness

The header records the commit the map was last checked against, or the date if there is no version control. With version control, run `git diff --name-only <commit>..HEAD`, re-check only the entries on those paths, and update the header.

## Building it

1. Survey the top-level layout, entry points, and manifest and config files.
2. Group code by feature or responsibility (auth, billing, CLI parsing, storage), not by file type.
3. Record where each feature lives. Point to a directory where possible and name individual files only when they are the key ones.
4. Record where a new feature must be registered, such as a router or a list of siblings.
5. Stop at the level that answers "where would I look for X?". Names, entry points, and a quick grep are enough.

For a monorepo, give each package its own `Features` list under a heading with its path.

## Format

Aim for about 60 lines with one line per entry and no prose. For a large repository, record only top-level areas.

```markdown
# Feature map

Checked against: <commit hash or YYYY-MM-DD>

## Entry points
- <what>: `path`

## Features
- <feature>: `path/` (key files: `a.ts`, `b.ts`), <few words on role>

## Registration points
- <what is registered there>: `path`

## Cross-cutting
- <config, shared utilities, types, test helpers>: `path`

## Commands
- build / test / lint: `<command>`
```

## Rules

- Only record paths you have seen.
- If an entry needs more than one line, it is too detailed.
- Skip generated code, vendored dependencies, and build output. They change often and nobody needs to find them.
- Remove entries for code that no longer exists. An accurate map beats a complete one.

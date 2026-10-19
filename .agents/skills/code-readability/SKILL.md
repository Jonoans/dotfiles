---
name: code-readability
description: Rules for making code easy to read, such as avoiding deep nesting with early returns. Use when writing, changing, or reviewing code, especially functions with nested conditionals or loops.
---

# Code readability

Prefer the shape that lets a reader follow the code top to bottom without holding context.

## Nesting

- Use guard clauses: handle invalid cases first and `return`, `continue`, or `raise` early, so the main logic stays at the top indentation level.
- Aim for at most two levels of indentation. Past that, invert a condition or extract a function.

## Conditions

- No `else` after a branch that returns, raises, or continues.
- Name complex booleans (`is_expired = ...`). Prefer positive conditions over double negatives.
- Replace long `if/elif` chains on one value with a lookup table or `match`. Avoid nested ternaries.

## Functions

- One level of abstraction per function. Keep them short.
- Limit parameters. Avoid boolean flag parameters. Use keyword arguments when a value's meaning isn't obvious.
- Return early instead of accumulating into a result variable.
- Don't mutate arguments.

## Names and data

- Use clear names, not `data`, `tmp`, or abbreviations. Replace magic values with named constants or enums.
- Return a named structure, not a positional tuple. Don't make `None` carry meaning.
- Annotate types on public interfaces.

## Intent

- Name intermediate steps instead of long call chains.
- Use comprehensions and built-ins (`any`, `all`, `sum`) for simple transforms, and a plain loop once they stop fitting on a line or two.
- Compute a value first, then act on it.
- Put cleanup next to the acquire (context managers, `finally`).
- Prefer explicit over clever. If it needs a comment to decode, rewrite it.

## Errors

- Validate inputs at the top, then trust them.
- Raise specific errors that say what failed and with which value.
- Keep `try` blocks narrow. Don't hide failures behind defaults.

## Layout

- Put high-level functions before their helpers, and keep related code together.
- Separate groups of lines with a blank line.
- Comment only the why.
- Match the surrounding file's style.

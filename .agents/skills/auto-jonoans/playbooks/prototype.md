# Prototype playbook

For tasks that explore or experiment with a new feature idea without implementing it yet. The deliverable is what was learned and a recommendation, not production code.

## Steps

1. Start a subagent to invoke the `familiarise` skill first. Pass it the idea and what is unknown about it so it is directed in its objectives.
2. State the question the prototype must answer, such as feasibility, fit with the existing code, performance, or user experience. Define what result would count as success and what would rule the idea out. Log it with `log-your-work`.
3. Scope the smallest experiment that answers the question. Skip anything that does not help answer it, such as polish, full error handling, and broad edge cases.
4. Build the prototype in isolation from the production code, such as a scratch directory, a separate branch, or behind a flag. Reuse existing code where it helps, but do not change existing behaviour.
5. Run the experiment and record the evidence: outputs, measurements, screenshots (use the `run` skill for anything with a UI), and anything that failed or surprised you.
6. Write the findings to `.audit/architecture/` as laid out by the `audit` skill. Cover the question, what was tried, the evidence, what was learned, the risks and open questions, and a recommendation of proceed, change course, or drop. If proceeding, outline what an implementation would involve.
7. Report the answer and recommendation, where the prototype and findings are, and anything left unverified. Do not merge the prototype into production code, and do not commit or push unless asked. Implementing the feature is a separate task that follows the `feature` playbook.

## Core Principles

- Optimise for learning speed, not code quality. The prototype is disposable.
- Answer one question at a time. Stop when the question is answered.
- Keep prototype code out of production paths and clearly marked as a prototype.
- Report negative and inconclusive results as plainly as positive ones.
- Don't present a prototype as finished work, and don't claim something works without having run it.
- If two or more attempts at the same approach have not worked, use the `principle-challenge-premise` skill.

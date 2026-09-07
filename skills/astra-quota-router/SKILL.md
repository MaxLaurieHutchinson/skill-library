---
name: astra-quota-router
description: Preserve scarce Astra/Codex frontier-model quota by routing only high-leverage architecture, hard judgement, security, concurrency, cross-cutting reasoning, and final acceptance to Astra while delegating bounded investigation, implementation, tests, benchmarks, documentation, and mechanical work to cheaper models such as Luna, Terra, or Sol. Use when the user asks to conserve Astra, avoid Codex quota exhaustion, split work across model tiers, orchestrate a Luna team, create work packs, or run an efficient plan-build-review loop.
---

# Astra Quota Router

Use Astra as a scarce senior engineering resource, not as the default worker.

The core operating rule is:

> Keep architecture and acceptance expensive; make execution cheap and bounded.

Read `references/source-notes.md` only when provenance or the originating community workflow matters.

## Workflow

1. Classify the task before doing expensive work.
2. Keep only the decisions that genuinely need frontier judgement with Astra.
3. Decompose the remaining work into bounded execution packs.
4. Delegate those packs to the cheapest model likely to succeed.
5. Require concrete evidence back: diffs, files changed, tests, benchmark results, errors, and unresolved risks.
6. Let Astra review the actual evidence and make the final acceptance decision.
7. Escalate execution only when evidence shows the cheaper tier is insufficient.

Do not repeatedly feed Astra the full repository or full conversation after durable work packs or evidence summaries exist.

## 1. Classify Work by Decision Risk

### Keep with Astra

Reserve Astra for work where a wrong decision would create broad rework or hidden risk:

- architecture and system boundaries;
- cross-cutting invariants;
- concurrency, cache invalidation, consistency, ordering, or distributed-state reasoning;
- security and trust-boundary decisions;
- ambiguous root-cause diagnosis after cheaper investigation stalls;
- migration strategy with high blast radius;
- trade-offs spanning multiple subsystems;
- acceptance criteria for consequential changes;
- final review of evidence and changed code.

Astra should normally decide **what must be true** and **what evidence proves it**, not perform every mechanical step itself.

### Delegate by default

Delegate work that can be expressed with a bounded goal and deterministic evidence:

- repository reconnaissance for named questions;
- locating relevant files, symbols, tests, and call paths;
- routine implementation;
- focused refactors;
- test creation and execution;
- benchmark execution;
- lint/type-check fixes;
- documentation updates;
- formatting and repetitive edits;
- data gathering;
- mechanical validation.

Prefer Luna High for ordinary bounded execution. Use the lowest effort that can reliably complete the pack.

### Use an intermediate tier

Use Terra or Sol when:

- Luna has returned incomplete or contradictory evidence;
- the execution requires broader synthesis but not root-architect judgement;
- the task is too coupled for a small bounded worker yet still does not justify Astra;
- an independent review is useful before Astra acceptance.

Do not escalate merely because a cheaper model made one correctable mistake.

## 2. Build Bounded Work Packs

Every delegated pack must contain enough context to work independently without inheriting the whole parent conversation.

Use this structure:

```markdown
## Goal
One concrete outcome.

## Scope
Allowed files/directories/components.

## Constraints
Invariants, interfaces, behaviours, and things that must not change.

## Evidence required
Exact tests, commands, benchmarks, diffs, or artefacts to return.

## Stop conditions
Conditions that require escalation instead of guessing.

## Return
Files changed, commands run, results, unresolved risks, and concise rationale.
```

Keep packs narrow. Split independent work into parallel packs when the runtime supports safe parallel execution.

For writes, avoid having multiple agents edit the same files concurrently unless the environment provides isolated worktrees and an explicit merge owner.

## 3. Delegate Aggressively, Not Blindly

When subagents/model delegation is available:

- give workers a bounded outcome rather than a vague role;
- pass only relevant context;
- require the worker to verify its own change;
- require explicit reporting of uncertainty and blocked conditions;
- keep dependent writes sequential;
- use isolated worktrees for independent parallel writers where available.

When direct model delegation is unavailable, produce the work packs as hand-off prompts for the user to run in Luna/Terra/Sol, then resume with the returned evidence.

Do not simulate delegation by having Astra perform the worker task itself after writing the pack.

## 4. Evidence Return Contract

Worker summaries are not sufficient for final acceptance.

Require, when applicable:

- exact files changed;
- diff or patch summary tied to those files;
- tests run and pass/fail output;
- type/lint/build results;
- benchmark method and result;
- screenshots or runtime evidence for UI behaviour;
- assumptions introduced;
- unresolved failures;
- scope deviations.

Astra must inspect the real diff/evidence for material changes before approving.

If the worker cannot produce the agreed evidence, classify the pack as incomplete rather than successful.

## 5. Context Hygiene

Treat context as quota-bearing infrastructure.

- Read broad source material once when possible.
- Convert broad discovery into durable artefacts: architecture notes, requirement maps, work packs, claim ledgers, or scoped file lists.
- Reuse those artefacts instead of repeatedly reloading raw history.
- Keep worker context local to its pack.
- Return compressed evidence rather than a transcript of the worker's reasoning.
- Reload raw sources only when a claim or decision fails traceability.
- Start a fresh worker context for independent tasks when stale history would add noise.

Do not compress away invariants, acceptance criteria, or evidence needed for final review.

## 6. Escalation Ladder

Use evidence-driven escalation:

1. **Luna** — default bounded investigation and implementation.
2. **Terra/Sol** — broader synthesis, harder implementation, or independent review when Luna is insufficient.
3. **Astra** — architecture, high-risk judgement, unresolved hard diagnosis, and final acceptance.

Escalate when one or more are true:

- the cheaper model cannot explain conflicting evidence;
- the task crosses important system boundaries unexpectedly;
- a security/concurrency/integrity invariant becomes uncertain;
- repeated attempts fail the same acceptance criterion;
- the worker proposes a design change outside its authority;
- the evidence is insufficient to determine correctness.

Do not escalate based only on model prestige or task size.

## 7. Astra Acceptance Pass

When execution returns, Astra should review only the information required to make the acceptance decision:

1. Restate the invariant or acceptance criteria.
2. Inspect the actual diff/evidence.
3. Check cross-cutting consequences the worker may have missed.
4. Verify tests/benchmarks actually prove the intended behaviour.
5. Identify unsupported assumptions.
6. Return one verdict:
   - `ACCEPT`
   - `REVISE`
   - `ESCALATE`

For `REVISE`, issue a new bounded work pack rather than taking over routine implementation.

## 8. Prompt Pattern

When the user wants a concise orchestration instruction, adapt this pattern to the runtime rather than copying it mechanically:

```text
Act as root architect and final acceptance authority. Keep architecture, correctness, cross-cutting invariants, concurrency/security judgement, and final review. Delegate bounded investigation, implementation, tests, and benchmarks to the cheapest capable model. Require actual diff/evidence back. Review that evidence yourself before accepting. Escalate model tier only when the returned evidence shows it is necessary.
```

If the runtime supports explicit model selection, name the intended worker tier in each work pack.

## 9. Failure Modes

Avoid these patterns:

### Astra does everything
A single open-ended prompt asks Astra to discover, design, implement, test, browse, benchmark, and review.

**Correction:** separate architecture/acceptance from bounded execution.

### Delegation without boundaries
A worker gets "implement this feature" with full repository scope and no evidence contract.

**Correction:** define goal, scope, constraints, evidence, and stop conditions.

### Summary-only review
Astra accepts a worker's prose summary without seeing the changed files or verification output.

**Correction:** require real evidence.

### Premature escalation
A routine worker task is moved to Astra because the first cheaper attempt was imperfect.

**Correction:** refine the pack or move one tier up first.

### Re-reading everything
Every pass reloads the same repository history and documents.

**Correction:** persist durable intermediate artefacts and read raw inputs only on traceability failure.

### Parallel edit collisions
Multiple workers change the same source files concurrently.

**Correction:** isolate worktrees or serialize dependent writes.

## 10. Output for a New Task

When this skill is triggered on a substantial task, return or create:

1. **Routing decision** — what Astra keeps and what is delegated.
2. **Work packs** — one per independent execution task.
3. **Evidence contract** — what each worker must return.
4. **Escalation conditions** — what justifies a higher tier.
5. **Acceptance pass** — final Astra review against evidence.

For trivial tasks that do not need Astra, say so and route them entirely to a cheaper model.

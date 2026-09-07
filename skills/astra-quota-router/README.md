# Astra Quota Router

A compact Agent Skill for using scarce frontier-model quota as architecture and acceptance capacity instead of spending it on every coding step.

The workflow was distilled from a community pattern shared in r/codex: keep Astra responsible for high-leverage judgement and final review, delegate bounded investigation/implementation/tests/benchmarks to cheaper models, then require concrete evidence back before acceptance.

## Core loop

1. Classify work by decision risk.
2. Keep architecture, cross-cutting correctness, security/concurrency judgement and acceptance with Astra.
3. Turn execution into narrow work packs.
4. Route those packs to the cheapest capable model, usually Luna for routine bounded work.
5. Require diffs, tests, benchmarks and unresolved risks back.
6. Escalate only when evidence shows the cheaper tier is insufficient.
7. Let Astra review the actual evidence and return `ACCEPT`, `REVISE` or `ESCALATE`.

## Source

Primary discussion supplied by Max Hutchinson:

https://www.reddit.com/r/codex/comments/1w9ksnt/how_i_plus_user_dont_run_out_of_astra/

See `references/source-notes.md` for provenance and design notes.

## Files

- `SKILL.md` — runtime control plane
- `agents/openai.yaml` — ChatGPT UI metadata
- `references/source-notes.md` — origin and distilled principles

## Status

Validated with OpenAI's Skill Creator packaging validator.

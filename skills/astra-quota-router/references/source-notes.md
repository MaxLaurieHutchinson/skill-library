# Source Notes

## Origin

Primary user-supplied Reddit thread:

https://www.reddit.com/r/codex/comments/1w9ksnt/how_i_plus_user_dont_run_out_of_astra/

The core community pattern is to treat Astra as a scarce architect / acceptance authority and use cheaper Codex models for bounded execution.

Related indexed r/codex discussion from September 2026 independently describes two closely related approaches:

- use Terra as an orchestrator, call Astra for planning and harsh review, and use Luna for most execution;
- use Astra itself as root architect / final authority while delegating bounded source work, implementation, tests, and benchmarks to Luna, then have Astra review the actual diff/evidence.

The useful abstraction is not a fixed model-name recipe. It is a three-tier control pattern:

1. scarce frontier judgement;
2. cheaper bounded execution;
3. frontier acceptance over concrete evidence.

## Why the Skill Does Not Hard-code Quota Numbers

Quota prices, model availability, reasoning tiers, and subscription limits can change quickly. The skill therefore routes by task risk and evidence quality rather than assuming a fixed numerical multiplier.

## Distilled Principles

- Do not spend frontier quota on mechanical work.
- Keep architecture, cross-cutting correctness, and final acceptance with the strongest model.
- Delegate narrow work aggressively.
- Make the worker prove completion with artefacts and tests.
- Review actual evidence rather than trusting summaries.
- Escalate based on failed evidence, not prestige.
- Preserve durable intermediate artefacts so expensive models do not repeatedly rediscover context.

## Attribution

This skill is an independent operationalisation of a community workflow shared in r/codex. It is not an OpenAI-authored quota policy and does not guarantee a particular amount of quota savings.

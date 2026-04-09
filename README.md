# Skill Library

A curated collection of AI agent skills for OpenClaw and compatible platforms.

## Overview

This repository serves as a central registry for skills developed for AI agents. Each skill is maintained in its own repository for independent versioning and release cycles.

## Philosophy

- **Skills are educational, not speculative** — No tokens, no "earn" mechanics, just learning
- **Open and auditable** — All skills are open source with clear documentation
- **Composable** — Skills can be combined and built upon
- **Ethical by design** — No manipulation, no dark patterns

## Available Skills

| Skill | Description | Status | Repository |
|-------|-------------|--------|------------|
| **storyteller** | Narrative construction and fiction writing | Private dev | [skill-storyteller](https://github.com/MaxLaurieHutchinson/skill-storyteller) |
| **mental-models** | Charlie Munger's latticework thinking | Private dev | [skill-mental-models](https://github.com/MaxLaurieHutchinson/skill-mental-models) |
| **academic-search** | Systematic research methodology | Private dev | [skill-academic-search](https://github.com/MaxLaurieHutchinson/skill-academic-search) |
| **copywriter** | Persuasive writing and conversion | Private dev | [skill-copywriter](https://github.com/MaxLaurieHutchinson/skill-copywriter) |
| **content-engine** | Strategic content creation | Private dev | [skill-content-engine](https://github.com/MaxLaurieHutchinson/skill-content-engine) |
| **code-gen** | Code generation and software design | Private dev | [skill-code-gen](https://github.com/MaxLaurieHutchinson/skill-code-gen) |
| **local-inference-subagent** | Unified local inference across LM Studio, Ollama, OpenAI-compatible, and Anthropic-compatible APIs | Private dev | [skill-local-inference-subagent](https://github.com/MaxLaurieHutchinson/skill-local-inference-subagent) |

## Quick Install

Install all skills at once:

```bash
# Clone the library
git clone https://github.com/MaxLaurieHutchinson/skill-library.git

# Install all skills
./install.sh
```

Or install individual skills:

```bash
# Storyteller
git clone https://github.com/MaxLaurieHutchinson/skill-storyteller.git ~/.openclaw/workspace/skills/storyteller

# Mental Models
git clone https://github.com/MaxLaurieHutchinson/skill-mental-models.git ~/.openclaw/workspace/skills/mental-models

# Academic Search
git clone https://github.com/MaxLaurieHutchinson/skill-academic-search.git ~/.openclaw/workspace/skills/academic-search

# Copywriter
git clone https://github.com/MaxLaurieHutchinson/skill-copywriter.git ~/.openclaw/workspace/skills/copywriter

# Content Engine
git clone https://github.com/MaxLaurieHutchinson/skill-content-engine.git ~/.openclaw/workspace/skills/content-engine

# Code Gen
git clone https://github.com/MaxLaurieHutchinson/skill-code-gen.git ~/.openclaw/workspace/skills/code-gen

# Local Inference Subagent
git clone https://github.com/MaxLaurieHutchinson/skill-local-inference-subagent.git ~/.openclaw/workspace/skills/local-inference-subagent
```

## Skill Format

All skills follow the SKILL.md standard format:

```yaml
---
name: skill-name
role: Skill Role Description
version: 1.0.0
triggers:
  - "trigger phrase"
  - "another trigger"
---

# Role
Description of what the skill does.

# Capabilities
1. Specific capability
2. Another capability

# Constraints
1. Important constraint
2. Another constraint

# Activation
WHEN the user requests...
```

## Skill Structure

Each skill repository contains:

```
skill-name/
├── README.md           # Skill overview and usage
├── SKILL.md           # Core skill definition
├── manifest.json      # Machine-readable metadata
├── package.json       # Package configuration
├── knowledge/         # Domain knowledge files
│   ├── domain.md
│   ├── best-practices.md
│   └── anti-patterns.md
├── strategies/        # Execution strategies
│   └── main.md
└── tests/            # Validation tests
    ├── smoke.json
    └── benchmark.json
```

## Development Status

All skills are currently in **development**.

**Roadmap:**
- [ ] Internal testing and refinement
- [ ] Documentation completion
- [ ] Community review
- [ ] Public release 

## Creating New Skills

To create a new skill:

1. Use the template in `templates/skill-template/`
2. Define your SKILL.md with clear capabilities and constraints
3. Add knowledge files for domain expertise
4. Create tests for validation
5. Submit for review

## Contributing

During private development, contributions are by invitation only.

For future public release:
- Follow the SKILL.md format
- Include comprehensive documentation
- Add validation tests
- Ensure ethical constraints are documented

## Registry

See `registry.json` for machine-readable skill metadata.

## Versioning

Skills follow semantic versioning (MAJOR.MINOR.PATCH):
- MAJOR: Breaking changes to skill behavior
- MINOR: New capabilities added
- PATCH: Bug fixes and refinements

## License

All skills are released under MIT license unless otherwise noted.

## Author

Max Hutchinson

## Acknowledgments

These skills were developed based on established frameworks and best practices from multiple disciplines. They represent a curated approach to AI agent education — structured, tested, and ethical.

## Related Projects

- [OpenClaw](https://openclaw.ai) — The AI agent platform these skills are designed for
- [SKILL.md Standard](https://github.com/skills-md/spec) — The open standard for skill definition

## Contact

For questions about the skill library, contact: [Max Hutchinson](https://www.linkedin.com/in/maxlauriehutchinson/)

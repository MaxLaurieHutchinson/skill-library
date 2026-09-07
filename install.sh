#!/bin/bash

# Skill Library Installation Script
# Installs all skills to OpenClaw workspace

set -e

SKILLS_DIR="${HOME}/.openclaw/workspace/skills"
REPOS_BASE="https://github.com/MaxLaurieHutchinson"

SKILLS=(
    "storyteller"
    "mental-models"
    "academic-search"
    "copywriter"
    "content-engine"
    "code-gen"
    "local-inference-subagent"
    "astra-quota-router"
)

echo "🎯 Installing Skill Library to OpenClaw..."
echo ""

# Create skills directory if it doesn't exist
mkdir -p "$SKILLS_DIR"

# Install each skill
for skill in "${SKILLS[@]}"; do
    skill_dir="$SKILLS_DIR/$skill"
    repo_url="$REPOS_BASE/skill-$skill"
    
    if [ -d "$skill_dir/.git" ]; then
        echo "📦 Updating skill: $skill"
        cd "$skill_dir" && git pull
    else
        echo "📦 Installing skill: $skill"
        git clone "$repo_url.git" "$skill_dir"
    fi
    echo "   ✓ $skill installed"
done

echo ""
echo "✅ All skills installed successfully!"
echo ""
echo "Installed skills:"
for skill in "${SKILLS[@]}"; do
    echo "  • $skill"
done
echo ""
echo "Your AI agent can now use these skills. Try asking:"
echo "  'Help me write a story' (storyteller)"
echo "  'What mental model applies here?' (mental-models)"
echo "  'Find papers on...' (academic-search)"
echo "  'Run this task on local inference with Ollama' (local-inference-subagent)"
echo "  'Conserve Astra and route this task across cheaper models' (astra-quota-router)"

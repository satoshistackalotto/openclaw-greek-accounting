#!/bin/bash
# run-evals.sh
# Lists EVALS.json status for all skills and optionally runs evals for a specific skill.
# Run from the repository root: ./scripts/run-evals.sh [skill-name]

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"

echo "=== OpenClaw Greek Accounting — EVALS Status ==="
echo ""

TOTAL=0
HAS_EVALS=0
MISSING_EVALS=()

for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name=$(basename "$skill_dir")
  
  # Skip canonical-data-map (reference doc, no evals needed)
  if [ "$skill_name" = "canonical-data-map" ]; then
    continue
  fi
  
  TOTAL=$((TOTAL + 1))
  
  if [ -f "$skill_dir/EVALS.json" ]; then
    eval_count=$(jq 'length' "$skill_dir/EVALS.json" 2>/dev/null || echo "?")
    echo "  ✅ $skill_name — $eval_count test cases"
    HAS_EVALS=$((HAS_EVALS + 1))
  else
    echo "  ❌ $skill_name — EVALS.json missing"
    MISSING_EVALS+=("$skill_name")
  fi
done

echo ""
echo "Coverage: $HAS_EVALS / $TOTAL skills have EVALS.json"

if [ ${#MISSING_EVALS[@]} -gt 0 ]; then
  echo ""
  echo "Missing EVALS for:"
  for missing in "${MISSING_EVALS[@]}"; do
    echo "  - $missing"
  done
fi

# If a specific skill name was passed, show its evals
if [ -n "${1:-}" ]; then
  SKILL_EVALS="$SKILLS_DIR/$1/EVALS.json"
  if [ -f "$SKILL_EVALS" ]; then
    echo ""
    echo "=== EVALS for $1 ==="
    jq '.[].prompt' "$SKILL_EVALS"
  else
    echo ""
    echo "No EVALS.json found for skill: $1"
  fi
fi

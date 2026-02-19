#!/bin/bash
# validate-paths.sh
# Checks all SKILL.md files for deprecated paths that don't match the canonical data map.
# Run from the repository root: ./scripts/validate-paths.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$REPO_ROOT/skills"
ERRORS=0

# Deprecated paths from the canonical data map (Skill 00)
DEPRECATED_PATHS=(
  "/data/alpha-bank/"
  "/data/nbg-statements/"
  "/data/eurobank/"
  "/data/piraeus-bank/"
  "/data/bank-imports/"
  "/data/scanned-documents/"
  "/data/email-attachments"
  "/data/email-imports/"
  "/data/aade-downloads/"
  "/data/aade-outputs/"
  "/data/aade-processing/"
  "/data/compliance-updates/"
  "/data/processed/invoices/"
  "/data/processed/receipts/"
  "/data/processing/extraction"
  "/data/processing/validation"
  "/data/export/accounting-software"
  "/data/payroll/monthly"
  "/data/reports/monthly-expenses"
)

# Also check for non-canonical client path patterns
BAD_PATTERNS=(
  "{client_vat}"
  "{vat_number}"
  "{tax_id}"
)

echo "=== OpenClaw Greek Accounting — Path Validation ==="
echo "Checking all SKILL.md files against canonical data map..."
echo ""

for skill_dir in "$SKILLS_DIR"/*/; do
  skill_file="$skill_dir/SKILL.md"
  if [ ! -f "$skill_file" ]; then
    continue
  fi
  
  skill_name=$(basename "$skill_dir")
  
  # Skip canonical-data-map — it legitimately lists deprecated paths in its migration table
  if [ "$skill_name" = "canonical-data-map" ]; then
    continue
  fi
  
  for deprecated in "${DEPRECATED_PATHS[@]}"; do
    matches=$(grep -n "$deprecated" "$skill_file" 2>/dev/null || true)
    if [ -n "$matches" ]; then
      echo "❌ $skill_name: deprecated path '$deprecated'"
      echo "   $matches"
      ERRORS=$((ERRORS + 1))
    fi
  done
  
  for pattern in "${BAD_PATTERNS[@]}"; do
    matches=$(grep -n "$pattern" "$skill_file" 2>/dev/null || true)
    if [ -n "$matches" ]; then
      echo "❌ $skill_name: non-canonical identifier pattern '$pattern' (use {AFM})"
      echo "   $matches"
      ERRORS=$((ERRORS + 1))
    fi
  done
done

echo ""
if [ $ERRORS -eq 0 ]; then
  echo "✅ All skills pass path validation."
  exit 0
else
  echo "❌ Found $ERRORS path issues. Fix before publishing."
  exit 1
fi

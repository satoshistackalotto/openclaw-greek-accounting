#!/bin/bash
# ClawHub Bulk Publish Script for OpenClaw Greek Accounting
# Run from the repository root: ./scripts/publish-clawhub.sh
#
# Prerequisites:
#   1. Install ClawHub CLI: npm install -g clawhub
#   2. Login: clawhub login
#   3. Your GitHub account must be at least 1 week old
#
# Usage:
#   ./scripts/publish-clawhub.sh           # Publish all skills
#   ./scripts/publish-clawhub.sh --dry-run # Show what would be published

set -euo pipefail

VERSION="1.0.0"
DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "=== DRY RUN — no skills will be published ==="
    echo ""
fi

SKILLS_DIR="./skills"
TOTAL=0
SUCCESS=0
FAILED=0

echo "╔══════════════════════════════════════════════════╗"
echo "║  OpenClaw Greek Accounting — ClawHub Publisher   ║"
echo "║  Version: $VERSION                               ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Publish order matters — canonical data map first, then meta-skill last
PUBLISH_ORDER=(
    "canonical-data-map"
    "accounting-workflows"
    "greek-compliance-aade"
    "cli-deadline-monitor"
    "greek-email-processor"
    "greek-individual-taxes"
    "aade-api-monitor"
    "greek-banking-integration"
    "greek-document-ocr"
    "efka-api-integration"
    "dashboard-greek-accounting"
    "client-data-management"
    "user-authentication-system"
    "conversational-ai-assistant"
    "greek-financial-statements"
    "client-communication-engine"
    "system-integrity-and-backup"
    "analytics-and-advisory-intelligence"
    "memory-feedback"
    "system-health-check"
    "openclaw-greek-accounting-meta"
)

for skill in "${PUBLISH_ORDER[@]}"; do
    SKILL_PATH="$SKILLS_DIR/$skill"
    TOTAL=$((TOTAL + 1))
    
    if [[ ! -f "$SKILL_PATH/SKILL.md" ]]; then
        echo "  ❌ $skill — SKILL.md not found"
        FAILED=$((FAILED + 1))
        continue
    fi

    # Extract name from frontmatter
    SLUG=$(grep -m1 "^name:" "$SKILL_PATH/SKILL.md" | sed 's/name: *//')
    
    if $DRY_RUN; then
        echo "  📦 Would publish: $skill (slug: $SLUG)"
    else
        echo -n "  Publishing $skill..."
        if clawhub publish "$SKILL_PATH" \
            --slug "$SLUG" \
            --version "$VERSION" \
            --tags "latest,greek,accounting" \
            --changelog "Initial release — OpenClaw Greek Accounting System v${VERSION}" \
            2>/dev/null; then
            echo " ✅"
            SUCCESS=$((SUCCESS + 1))
        else
            echo " ❌ FAILED"
            FAILED=$((FAILED + 1))
        fi
    fi
done

echo ""
echo "═══════════════════════════════════════════════════"
if $DRY_RUN; then
    echo "  DRY RUN: $TOTAL skills would be published"
else
    echo "  Published: $SUCCESS / $TOTAL"
    [[ $FAILED -gt 0 ]] && echo "  Failed: $FAILED"
fi
echo "═══════════════════════════════════════════════════"

if ! $DRY_RUN && [[ $SUCCESS -eq $TOTAL ]]; then
    echo ""
    echo "All skills published! Users can install with:"
    echo "  clawhub install canonical-data-map"
    echo "  clawhub install accounting-workflows"
    echo "  clawhub install greek-compliance-aade"
    echo "  ... (see README.md for full list)"
    echo "  clawhub install openclaw-greek-accounting-meta"
fi

# OpenClaw Greek Accounting — Installation Guide

## Repository Structure

All skills live in the `skills/` directory, each in its own folder:

```
skills/
├── canonical-data-map/          SKILL.md
├── accounting-workflows/        SKILL.md + EVALS.json
├── greek-compliance-aade/       SKILL.md + EVALS.json
├── cli-deadline-monitor/        SKILL.md + EVALS.json
├── greek-email-processor/       SKILL.md + EVALS.json
├── greek-individual-taxes/      SKILL.md + EVALS.json
├── openclaw-greek-accounting-meta/  SKILL.md + EVALS.json
├── aade-api-monitor/            SKILL.md + EVALS.json
├── greek-banking-integration/   SKILL.md + EVALS.json
├── greek-document-ocr/          SKILL.md + EVALS.json
├── efka-api-integration/        SKILL.md + EVALS.json
├── dashboard-greek-accounting/  SKILL.md + EVALS.json
├── client-data-management/      SKILL.md + EVALS.json
├── user-authentication-system/  SKILL.md + EVALS.json
├── conversational-ai-assistant/ SKILL.md + EVALS.json
├── greek-financial-statements/  SKILL.md + EVALS.json
├── client-communication-engine/ SKILL.md + EVALS.json
├── system-integrity-and-backup/ SKILL.md + EVALS.json
├── analytics-and-advisory-intelligence/ SKILL.md + EVALS.json
├── memory-feedback/             SKILL.md + EVALS.json
└── system-health-check/         SKILL.md + EVALS.json
```

## Installation Options

### Option 1: Full System (recommended)

Clone the entire repository and copy all skills into your OpenClaw instance:

```bash
git clone https://github.com/satoshistackalotto/openclaw-greek-accounting.git
cp -r openclaw-greek-accounting/skills/* /path/to/openclaw/skills/
cp openclaw-greek-accounting/SOUL.md /path/to/openclaw/SOUL.md
```

### Option 2: Individual Skills

Download individual skill folders from GitHub. Each skill is self-contained — the SKILL.md is the only required file. EVALS.json is optional but recommended for testing.

Minimum viable installation order:

1. `canonical-data-map` — Install first (path reference for all other skills)
2. `accounting-workflows` — Core document processing
3. `greek-compliance-aade` — Tax compliance
4. `openclaw-greek-accounting-meta` — Orchestration layer
5. Add remaining skills as needed

### Option 3: From ClawHub (when published)

```bash
clawhub install greek-accounting-system --all
```

## Post-Installation

### 1. Set environment variable
```bash
export OPENCLAW_DATA_DIR=/data/
```

### 2. Initialize directory structure
```bash
openclaw greek setup --initialize-directories --verify-structure
```

### 3. Run health check
```bash
openclaw health-check --all
```

### 4. Onboard first client
```bash
openclaw client onboard --afm EL123456789 --name "COMPANY NAME AE" --entity-type AE
```

## System Requirements

- OpenClaw v1.0+
- Linux (Ubuntu 22.04+ recommended)
- `jq` and `curl` installed
- ~10GB storage for multi-client firm
- Optional: `openssl` for backup encryption, `gh` for memory-feedback GitHub integration

## Full Documentation

- **Deployment guide**: `docs/DEPLOYMENT.md`
- **Security architecture**: `docs/SECURITY.md`
- **Contributing**: `docs/CONTRIBUTING.md`
- **Changelog**: `docs/CHANGELOG.md`
- **Technical audit**: `docs/AUDIT.md`

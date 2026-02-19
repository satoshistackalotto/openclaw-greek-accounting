# OpenClaw Greek Accounting System

A comprehensive AI agent system built on [OpenClaw](https://openclaw.ai) for automating Greek accounting firm operations. Provides 19 specialized skills covering document processing, government compliance, banking integration, client management, and financial reporting — all designed for English-speaking accounting assistants processing Greek business data.

## Overview

Greek accounting firms face unique regulatory complexity: AADE tax compliance, EFKA social security, myDATA real-time invoicing, ENFIA property taxes, and coordination across four major banks. This system automates the repetitive, error-prone parts of that work while keeping humans in the loop for professional judgment and government submissions.

**Key design principles:**
- English interface, Greek data processing, bilingual output
- Human confirmation gates for all government submissions
- File-based architecture optimized for OpenClaw's processing model
- Completeness gates prevent partial or incorrect filings
- Full audit trail for regulatory inspection readiness

## Skills

| # | Skill | Phase | Description |
|---|-------|-------|-------------|
| 00 | `canonical-data-map` | Foundation | Single source of truth for all file paths, naming conventions, and data formats |
| 01 | `accounting-workflows` | 1 - Core | Document processing, OCR pipeline, data extraction, and workflow management |
| 02 | `greek-compliance-aade` | 1 - Core | VAT returns, payroll tax, AADE/TAXIS integration, myDATA submissions |
| 03 | `cli-deadline-monitor` | 1 - Core | Deadline tracking for AADE, EFKA, municipal, and client obligations |
| 04 | `greek-email-processor` | 1 - Core | Automated email monitoring, Greek document detection, and classification |
| 05 | `greek-individual-taxes` | 1 - Core | Individual tax returns (E1 forms), ENFIA, rental income, investment income |
| 06 | `openclaw-greek-accounting-meta` | 1 - Core | Meta-skill orchestrating all other skills with business-level commands |
| 07 | `aade-api-monitor` | 2 - Integration | Real-time AADE government system monitoring and change detection |
| 08 | `greek-banking-integration` | 2 - Integration | Statement processing for Alpha Bank, NBG, Eurobank, Piraeus |
| 09 | `greek-document-ocr` | 2 - Integration | Enhanced Greek-language OCR with business document specialization |
| 10 | `efka-api-integration` | 2 - Integration | EFKA social security declarations, employee management, AMA tracking |
| 11 | `dashboard-greek-accounting` | 3A - Infrastructure | Real-time portfolio dashboard with compliance scoring and alerts |
| 12 | `client-data-management` | 3A - Infrastructure | Client onboarding, GDPR compliance, data lifecycle management |
| 13 | `user-authentication-system` | 3A - Infrastructure | Role-based access control, 2FA, session management, audit logging |
| 14 | `conversational-ai-assistant` | 3A - Infrastructure | Natural language interface for accounting queries and task execution |
| 15 | `greek-financial-statements` | 3B - Outputs | P&L, balance sheet, ΕΓΛΣ integration, amendment tracking |
| 16 | `client-communication-engine` | 3B - Outputs | Bilingual client correspondence, templates, delivery tracking |
| 17 | `system-integrity-and-backup` | 3B - Outputs | Encrypted backups, hash verification, disaster recovery |
| 18 | `analytics-and-advisory-intelligence` | 3B - Outputs | Trend analysis, benchmarking, tax optimization, advisory insights |
| 19 | `memory-feedback` | 4 - Learning | Episodic memory, failure logging, pattern detection, GitHub PR workflows |
| 20 | `system-health-check` | Operational | System validation, directory checks, backup freshness, dependency verification |

## Quick Start

### Installation

1. Install each skill in your OpenClaw instance:
```bash
# From ClawHub (when published)
clawhub install greek-accounting-workflows
clawhub install greek-compliance-aade
# ... etc

# Or manually: copy each skill's SKILL.md into your OpenClaw skills directory
```

2. Set the data directory environment variable:
```bash
export OPENCLAW_DATA_DIR=/data/
```

3. Initialize the data directory structure:
```bash
openclaw greek setup --initialize-directories --verify-structure
```

4. Onboard your first client:
```bash
openclaw client onboard --afm EL123456789 --name "COMPANY NAME AE" --entity-type AE
```

### Daily Usage

```bash
# Morning briefing
openclaw dashboard morning-briefing

# Process incoming documents
openclaw accounting process-incoming --auto-classify --route-to-skills

# Check deadlines
openclaw greek deadline-check --urgent --days 7

# Monthly VAT processing
openclaw greek monthly-process --client EL123456789 --period 2026-02

# End-of-day summary
openclaw dashboard eod-summary
```

## Repository Structure

```
openclaw-greek-accounting/
├── README.md
├── LICENSE
├── SOUL.md
├── skills/
│   ├── canonical-data-map/
│   │   └── SKILL.md
│   ├── accounting-workflows/
│   │   ├── SKILL.md
│   │   └── EVALS.json
│   ├── greek-compliance-aade/
│   │   ├── SKILL.md
│   │   └── EVALS.json
│   ... (one folder per skill)
│   └── memory-feedback/
│       └── SKILL.md
├── docs/
│   ├── AUDIT.md
│   ├── DEPLOYMENT.md
│   ├── SECURITY.md
│   └── CHANGELOG.md
├── scripts/
│   ├── validate-paths.sh
│   └── run-evals.sh
└── .github/
    └── workflows/
        └── skill-validation.yml
```

## Greek Regulatory Coverage

- **AADE / TAXIS**: VAT returns (F2), income tax, myDATA real-time invoicing
- **EFKA**: Social security declarations (ΑΠΔ), employee registration, AMA tracking
- **ENFIA**: Property tax calculation and payment scheduling
- **ΕΓΛΣ**: Greek Chart of Accounts integration for financial statements
- **Municipal taxes**: TAP, waste/lighting, professional tax coordination
- **Stamp duty**: Contract and commercial paper stamp duty calculation

## Security

- Role-based access control with 4-tier hierarchy (admin → senior_accountant → accountant → assistant)
- bcrypt password hashing, TOTP 2FA, session management
- Human confirmation gates for all government submissions
- Encrypted backups with AES-256
- GDPR-compliant data handling with right-to-erasure support
- Complete audit trail for all system actions

## Contributing

See [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines on submitting improvements via pull request.

## License

MIT License — see [LICENSE](LICENSE) for details.

## Acknowledgments

Built with [OpenClaw](https://openclaw.ai) — the open-source AI agent platform.

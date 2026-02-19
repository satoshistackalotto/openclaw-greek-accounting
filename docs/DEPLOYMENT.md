# Deployment Guide

## Prerequisites

- OpenClaw instance (v1.0+)
- Linux environment (Ubuntu 22.04+ recommended)
- `jq` and `curl` installed
- Sufficient storage for `/data/` directory tree (~10GB recommended for multi-client firm)

## Environment Setup

### Required Environment Variables

```bash
export OPENCLAW_DATA_DIR=/data/            # Root data directory
export OPENCLAW_TZ=Europe/Athens           # Timezone for deadline calculations
export OPENCLAW_LANG=en                    # Interface language (en for staff)
```

### Optional Environment Variables

```bash
export AADE_API_KEY=<your-key>             # AADE API access (Skill 07)
export EFKA_API_KEY=<your-key>             # EFKA API access (Skill 10)
export SMTP_HOST=<your-smtp-server>        # Email sending (Skill 16)
export BACKUP_ENCRYPTION_KEY=<your-key>    # Backup encryption (Skill 17)
```

## Installation

### Option 1: From ClawHub

```bash
# Install all skills
clawhub install greek-accounting-system --all

# Or install individually
clawhub install greek-canonical-data-map
clawhub install greek-accounting-workflows
clawhub install greek-compliance-aade
# ... etc
```

### Option 2: Manual Installation

1. Clone this repository:
```bash
git clone https://github.com/<your-org>/openclaw-greek-accounting.git
```

2. Copy skill folders into your OpenClaw skills directory:
```bash
cp -r openclaw-greek-accounting/skills/* /path/to/openclaw/skills/
```

3. Copy SOUL.md to your OpenClaw workspace:
```bash
cp openclaw-greek-accounting/SOUL.md /path/to/openclaw/SOUL.md
```

## Directory Initialization

The canonical data map (Skill 00) defines the complete directory structure. Initialize it:

```bash
openclaw greek setup --initialize-directories --verify-structure
```

This creates the full `/data/` tree as specified in `skills/canonical-data-map/SKILL.md`.

## Post-Installation Verification

```bash
# Verify all skills are loaded
openclaw skills list --filter greek

# Verify directory structure
openclaw greek verify-paths --against-canonical-map

# Run health check
openclaw greek health-check --all-skills
```

## Client Onboarding

```bash
# Onboard a new client
openclaw client onboard \
  --afm EL123456789 \
  --name "COMPANY NAME AE" \
  --entity-type AE \
  --vat-regime normal \
  --fiscal-year calendar

# Verify client setup
openclaw client verify --afm EL123456789 --check-all-directories
```

## Security Configuration

1. **Set up authentication** (Skill 13):
```bash
openclaw auth setup --create-admin --enable-2fa --set-session-timeout 480
```

2. **Configure file permissions**:
```bash
chmod 600 /data/auth/users/*/credentials.json
chmod 700 /data/auth/
chmod 700 /data/clients/
```

3. **Initialize backup encryption** (Skill 17):
```bash
openclaw backup init --generate-key --verify-encryption
```

## Production Readiness Checklist

- [ ] All 19 skills installed and verified
- [ ] Directory structure initialized per canonical data map
- [ ] Admin user created with 2FA enabled
- [ ] File permissions hardened on `/data/auth/` and `/data/clients/`
- [ ] Backup encryption configured and tested
- [ ] At least one test client onboarded and verified
- [ ] Cron jobs configured for deadline monitoring and AADE checks
- [ ] Email integration configured for document processing
- [ ] Bank statement import paths configured for active banks

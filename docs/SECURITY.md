# Security Architecture

## Overview

The OpenClaw Greek Accounting System handles sensitive financial data subject to Greek tax law (5-20 year retention), EU GDPR (Law 4624/2019), and professional accounting standards. This document describes the security measures implemented across all skills.

## Authentication (Skill 13)

### Role Hierarchy

| Role | Access Level | Typical User |
|------|-------------|-------------|
| `admin` | Full system access, user management, configuration | Firm owner / IT |
| `senior_accountant` | All client data, can approve government submissions | Licensed accountant |
| `accountant` | Assigned clients, can prepare but not submit filings | Staff accountant |
| `assistant` | Read-only on assigned clients, document upload only | Junior staff |

### Password Security
- bcrypt hashing with configurable work factor
- Minimum complexity requirements enforced
- Account lockout after 5 failed attempts (escalating cooldown)

### Two-Factor Authentication
- TOTP-based (RFC 6238)
- Algorithm: SHA256 (recommended over SHA1)
- Required for `admin` and `senior_accountant` roles
- Optional but recommended for all roles

### Session Management
- Bearer token authentication
- Session tokens stored as salted hashes (never plaintext)
- Configurable idle timeout (default: 480 minutes / 8 hours)
- Automatic session termination on security events

## Data Protection

### Data Classification

All data in the system should be treated according to these classification levels:

| Classification | Description | Examples |
|---------------|-------------|---------|
| `restricted` | Credentials, encryption keys | `/data/auth/` |
| `confidential` | Client financial data, PII | `/data/clients/`, AFMs, IBANs |
| `internal` | Operational data, compliance records | `/data/compliance/`, `/data/processing/` |
| `public` | Non-sensitive system configuration | Skill documentation |

### Encryption

- **Backups**: AES-256 encryption for all backup archives (Skill 17)
- **Data at rest**: Recommended for `/data/clients/` and `/data/auth/` directories
- **File permissions**: `/data/auth/` directories should be chmod 700, credential files chmod 600

### GDPR Compliance

- Client data isolated by AFM directory — no cross-client data leakage
- GDPR subject access request exports via `/data/gdpr-exports/`
- Right-to-erasure workflow in Skill 12 (Client Data Management)
- Data retention policies aligned with Greek tax law requirements
- Consent tracking for employee data processing

## Government Submission Security

### Human Confirmation Gates

All government submissions require explicit human approval:

```
Agent prepares filing → Human reviews → Human confirms → Agent submits
```

This applies to:
- VAT returns (AADE/TAXIS)
- EFKA social security declarations
- myDATA invoice submissions
- E1 individual tax returns
- Corporate tax filings

### Four-Eyes Principle

For high-value submissions, the system supports a two-person approval workflow:
- `accountant` role prepares the filing
- `senior_accountant` role reviews and approves
- System logs both preparers and approver for audit trail

## Audit Trail

All system actions are logged with:
- Timestamp (UTC, displayed in Europe/Athens)
- User identity and role
- Action performed
- Affected client (AFM)
- Before/after data state (for modifications)
- IP address (when available)

Audit logs are stored in `/data/system/logs/` and are included in system backups.

## Vulnerability Reporting

If you discover a security vulnerability in this system, please report it responsibly by contacting the repository maintainers directly rather than opening a public issue.

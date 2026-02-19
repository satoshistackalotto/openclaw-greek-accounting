# Changelog

All notable changes to the OpenClaw Greek Accounting System will be documented in this file.

## [1.0.0] - 2026-02-19

### Added
- **Phase 1 — Core Infrastructure**: Skills 01–06
  - Accounting workflows with document processing pipeline
  - Greek compliance and AADE integration (VAT, payroll, myDATA)
  - CLI deadline monitor for all Greek regulatory obligations
  - Greek email processor with document classification
  - Greek individual taxes (E1 forms, ENFIA, rental income)
  - Meta-skill orchestrating all skills with business-level commands

- **Phase 2 — Advanced Integration**: Skills 07–10
  - AADE API monitor for government system changes
  - Greek banking integration (Alpha, NBG, Eurobank, Piraeus)
  - Greek document OCR with business document specialization
  - EFKA API integration for social security compliance

- **Phase 3A — Essential Infrastructure**: Skills 11–14
  - Dashboard with real-time compliance scoring and alerts
  - Client data management with GDPR compliance
  - User authentication with RBAC, 2FA, and audit logging
  - Conversational AI assistant for natural language queries

- **Phase 3B — Client-Visible Outputs**: Skills 15–18
  - Greek financial statements with ΕΓΛΣ integration
  - Client communication engine with bilingual templates
  - System integrity, backup, and disaster recovery
  - Analytics and advisory intelligence

- **Phase 4 — Learning Loop**: Skill 19
  - Memory and feedback system with episodic memory
  - GitHub PR-based skill improvement workflow

- **Foundation**
  - Canonical data map (Skill 00) — single source of truth for all paths
  - SOUL.md for agent personality and behavioral guidelines
  - GitHub repository structure for ClawHub publishing
  - EVALS.json test suites for 12 of 19 skills

### Security
- Role-based access control with 4-tier hierarchy
- Human confirmation gates for all government submissions
- Encrypted backup architecture with AES-256
- GDPR-compliant data handling

### Known Issues
- Skill 15 (Greek Financial Statements) SKILL.md needs to be recreated
- 7 skills still need EVALS.json files (06, 11, 13, 14, 16, 17, 19)

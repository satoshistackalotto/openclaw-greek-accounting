# Synthetic Test Dataset

Three fictional Greek companies for end-to-end testing of the OpenClaw Greek Accounting system. All data is synthetic — no real businesses or individuals.

## Test Companies

### 1. ΑΛΦΑ ΕΜΠΟΡΙΚΗ ΑΕ (Alpha Trading AE)
- **AFM**: EL100200300
- **Type**: ΑΕ (Société Anonyme) — medium trading company
- **Bank**: Alpha Bank
- **Employees**: 5
- **Scenario**: **Complete data.** All source data available. Should pass completeness gate and generate full financial statements.

### 2. ΒΗΤΑ ΥΠΗΡΕΣΙΕΣ ΟΕ (Beta Services OE)
- **AFM**: EL400500600
- **Type**: ΟΕ (General Partnership) — small IT services firm
- **Bank**: NBG
- **Employees**: 2
- **Scenario**: **Incomplete data.** Missing bank reconciliation, 2 pending OCR items. Should FAIL the completeness gate with specific blockers.

### 3. ΓΑΜΜΑ ΚΑΤΑΣΚΕΥΕΣ ΕΠΕ (Gamma Constructions EPE)
- **AFM**: EL700800900
- **Type**: ΕΠΕ (Limited Liability) — construction company
- **Bank**: Alpha Bank + Piraeus Bank
- **Employees**: 8
- **Scenario**: **Amendment required.** January 2026 statements already issued (v1). A late supplier invoice for EUR 3,600 was discovered that needs a v2 amendment.

## Test Period

January 2026 (2026-01) for all three companies.

## Setup

```bash
# Copy test data into your OpenClaw data directory
cp -r test-data/* $OPENCLAW_DATA_DIR/
```

## Test Sequence

```bash
# 1. Health check
openclaw health-check --directories

# 2. Client 1 — should succeed end-to-end
openclaw statements readiness --afm EL100200300 --period 2026-01
openclaw statements generate --afm EL100200300 --period 2026-01

# 3. Client 2 — should fail completeness gate
openclaw statements readiness --afm EL400500600 --period 2026-01
# Expected: BLOCKED (no bank reconciliation, 2 OCR items pending)

# 4. Client 3 — amendment workflow
openclaw statements amend --afm EL700800900 --period 2026-01 \
  --reason "Late supplier invoice INV-2026-0047 for EUR 3,600"

# 5. Orchestration
openclaw greek morning-briefing
openclaw greek monthly-process --client EL100200300 --period 2026-01

# 6. Banking
openclaw banking import-statements --bank alpha --file banking/imports/alpha/alpha_EL100200300_202601.csv

# 7. Deadline check
openclaw greek deadline-check --urgent --days 7
```

## What Each Scenario Tests

| Scenario | Skills Exercised |
|----------|-----------------|
| Client 1 (complete) | 00, 01, 02, 06, 08, 10, 15, 16, 17 |
| Client 2 (blocked) | 00, 06, 09, 12, 15 (gate failure) |
| Client 3 (amendment) | 00, 06, 15 (versioning), 16 (comms) |
| Morning briefing | 03, 06, 07, 11, 14 |
| Banking import | 08 (Greek CSV parsing) |

## Data Classification

All files include `data_classification: confidential` where applicable, matching the canonical data map encryption-at-rest specification.

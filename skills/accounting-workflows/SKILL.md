---
name: accounting-workflows
description: Comprehensive accounting automation skill for OpenClaw. Handles document processing (OCR of invoices, receipts, statements), data extraction, email monitoring, accounting software integration, and workflow management. Designed for professional accounting practices with audit trails and compliance features.
version: 1.0.0
author: openclaw-greek-accounting
tags: ["greek", "accounting", "document-processing", "ocr", "invoices"]
metadata: {"openclaw": {"requires": {"bins": ["jq"], "env": ["OPENCLAW_DATA_DIR"]}}}
---

# Accounting Workflows

This skill transforms OpenClaw into a powerful accounting assistant that automates document processing, data extraction, and routine accounting tasks while maintaining accuracy and compliance.

## Core Philosophy

- **Accuracy First**: Every extraction includes confidence scoring and validation
- **Audit Trail**: All automated actions are logged with timestamps and sources
- **Human Oversight**: Flag uncertain items for manual review rather than guessing
- **Security Conscious**: Handle sensitive financial data with appropriate safeguards
- **Workflow Efficiency**: Reduce manual data entry from hours to minutes

## Key Capabilities

### 1. Document Processing & OCR
- **Invoice Processing**: Extract vendor, date, amount, line items, tax details
- **Receipt Management**: Capture merchant, total, category, payment method
- **Bank Statement Analysis**: Parse transactions, balances, fees
- **Tax Document Handling**: W2s, 1099s, receipts for deductions
- **Contract Processing**: Extract key terms, dates, amounts

### 2. Email & Communication Automation
- **Inbox Monitoring**: Scan for financial documents and categorize
- **Auto-forwarding**: Route documents to appropriate processing pipelines  
- **Client Communication**: Send payment reminders and status updates
- **Document Requests**: Follow up on missing paperwork
- **Report Distribution**: Automated delivery of financial summaries

### 3. Data Entry & System Integration
- **Accounting Software**: Direct integration with QuickBooks, Xero, Sage, etc.
- **Spreadsheet Automation**: Update tracking sheets and reconciliation files
- **Bank Reconciliation**: Match transactions across systems
- **Tax Software**: Prepare data for tax preparation applications
- **CRM Integration**: Update client records with financial activity

### 4. Workflow Management
- **Deadline Tracking**: Monitor tax filings, payment due dates, renewals
- **Task Automation**: Create recurring workflows for monthly/quarterly tasks
- **Exception Handling**: Flag discrepancies and route for manual review
- **Compliance Monitoring**: Ensure adherence to accounting standards
- **Progress Reporting**: Daily/weekly summaries of work completed

### 5. Greek Regulatory Compliance (AADE Integration)
- **VAT Registration Monitoring**: Track business VAT registration status and renewal dates
- **TAXIS System Integration**: Prepare data for Greek tax authority submissions
- **E-Books Compliance**: Maintain digital accounting records per Greek law
- **Stamp Duty Calculations**: Apply correct stamp duty rates for contracts and documents
- **Social Security Filings**: Track IKA, EFKA, and other social contributions deadlines
- **Municipal Tax Tracking**: Monitor property taxes and local authority requirements
- **GDPR Compliance**: Ensure data handling meets EU privacy regulations for Greek operations

## Implementation Guidelines

### Document Processing Workflow

#### Phase 1: Document Intake
1. **Source Identification**: Email attachments, scanned files, cloud storage
2. **Format Recognition**: PDF, image, spreadsheet, email body text
3. **Document Classification**: Invoice, receipt, statement, contract, etc.
4. **Quality Assessment**: Image clarity, text legibility, format standardization

#### Phase 2: OCR & Extraction
1. **Pre-processing**: Image enhancement, rotation correction, noise reduction
2. **OCR Processing**: Text extraction with confidence scoring
3. **Field Identification**: Use templates for common document types
4. **Data Validation**: Cross-check extracted values for consistency
5. **Confidence Flagging**: Mark uncertain extractions for human review

#### Phase 3: Data Integration
1. **Format Standardization**: Convert to consistent data structures
2. **Duplicate Detection**: Check against existing records
3. **Business Rule Validation**: Verify against client-specific rules
4. **System Integration**: Push to accounting software or staging area
5. **Reconciliation**: Match with existing transactions and POs

### Email Processing Workflow

#### Automated Monitoring
```yaml
Email Rules:
  - Subject contains: "Invoice", "Receipt", "Statement", "Billing"
  - From domains: Client domains, vendor domains, banks
  - Attachment types: PDF, Excel, CSV, images
  - Keywords: Payment, Due, Overdue, Reconciliation
```

#### Processing Actions
1. **Attachment Extraction**: Download and queue for OCR processing
2. **Sender Classification**: Client, vendor, bank, government agency
3. **Priority Assignment**: Urgent (overdue), high (due soon), normal
4. **Auto-responses**: Confirm receipt, request missing information
5. **Task Creation**: Generate follow-up actions and deadlines

### Data Entry Automation

#### Browser-based Integration
- **Form Recognition**: Identify fields in accounting software
- **Data Mapping**: Match extracted data to appropriate form fields
- **Validation Rules**: Ensure data integrity before submission
- **Error Handling**: Retry logic for temporary failures
- **Confirmation Screenshots**: Capture proof of successful entries

#### API Integration
- **Direct Connection**: Use accounting software APIs when available  
- **Batch Processing**: Queue multiple transactions for efficiency
- **Real-time Sync**: Immediate updates for time-sensitive data
- **Error Logging**: Detailed failure information for troubleshooting

## Workflow Templates

### Daily Accounting Assistant Routine

#### Morning Startup (Automated at 8:00 AM)
```markdown
1. **Email Scan**: Process overnight emails for financial documents
2. **Document Queue**: Review pending OCR items from yesterday
3. **Priority Assessment**: Identify urgent items needing immediate attention
4. **Daily Summary**: Generate report of pending tasks and deadlines
5. **Client Alerts**: Send overdue payment reminders if configured
```

#### Continuous Processing (Throughout Day)
```markdown
1. **Real-time Email Monitoring**: Process new financial emails as they arrive
2. **OCR Pipeline**: Process scanned documents within 5 minutes of receipt
3. **Data Validation**: Cross-check extractions against business rules
4. **Exception Flagging**: Alert for items requiring human review
5. **Progress Updates**: Log all completed tasks with timestamps
```

#### End of Day Reconciliation (5:00 PM)
```markdown
1. **Transaction Matching**: Reconcile day's entries across systems
2. **Discrepancy Report**: Flag unmatched items for tomorrow's review
3. **Backup Verification**: Ensure all processed documents are archived
4. **Tomorrow's Preview**: Identify upcoming deadlines and tasks
5. **Daily Summary**: Email report to user with day's accomplishments
```

### Monthly Workflow Automation

#### Month-End Processing
```markdown
1. **Client Billing**: Generate and send monthly invoices
2. **Expense Categorization**: Review and categorize all monthly expenses
3. **Bank Reconciliation**: Match all transactions with bank statements
4. **Financial Reports**: Generate P&L, balance sheet, cash flow
5. **Tax Preparation**: Update quarterly tax calculation worksheets
```

#### Quarterly Tasks
```markdown
1. **Tax Filing Preparation**: Compile all necessary documents
2. **Client Reviews**: Schedule and prepare materials for client meetings
3. **Compliance Checks**: Verify adherence to regulations and standards
4. **System Backups**: Full backup of all financial data and documents
5. **Performance Analysis**: Review automation accuracy and efficiency
```

## Document Type Specifications

### Invoice Processing
```yaml
Required Fields:
  - vendor_name: Company issuing the invoice
  - invoice_number: Unique identifier from vendor
  - invoice_date: Date invoice was issued
  - due_date: Payment due date
  - total_amount: Final amount due
  - tax_amount: Sales tax or VAT if applicable
  - line_items: Individual products/services with quantities and rates
  
Validation Rules:
  - total_amount = sum(line_items) + tax_amount
  - invoice_date <= due_date
  - vendor_name must exist in approved vendor list
  - duplicate invoice_number from same vendor flags for review
```

### Receipt Processing  
```yaml
Required Fields:
  - merchant_name: Business name where purchase was made
  - transaction_date: Date of purchase
  - total_amount: Total paid
  - payment_method: Cash, credit card, check, etc.
  - category: Business expense category
  - tax_amount: If separately shown
  
Validation Rules:
  - transaction_date <= current_date
  - category must be valid business expense type
  - amounts must be positive numbers
  - payment_method affects cash flow tracking
```

### Bank Statement Processing
```yaml
Required Fields:
  - account_number: Bank account identifier
  - statement_date: Statement period end date
  - beginning_balance: Balance at start of period
  - ending_balance: Balance at end of period
  - transactions: List of all debits and credits
  
Transaction Fields:
  - date: Transaction date
  - description: Bank's description of transaction
  - amount: Positive for deposits, negative for withdrawals
  - type: Deposit, withdrawal, fee, interest, etc.
  
Validation Rules:
  - ending_balance = beginning_balance + sum(all_transactions)
  - transaction dates must be within statement period
  - reconcile against accounting system transactions
```

## Security & Compliance Features

### Data Protection
- **Encryption**: All processed documents encrypted at rest
- **Access Control**: Role-based permissions for sensitive data
- **Audit Logging**: Complete trail of all automated actions
- **Secure Transmission**: Encrypted connections to accounting systems
- **Data Retention**: Automatic archiving per legal requirements

### Compliance Monitoring
- **Standards Adherence**: Monitor compliance with GAAP, tax regulations
- **Deadline Tracking**: Ensure timely filing of required documents  
- **Document Retention**: Maintain required records per legal timelines
- **Change Tracking**: Log all modifications to financial records
- **Approval Workflows**: Route significant transactions for authorization

### Greek Regulatory Compliance (AADE & Local Requirements)
- **VAT Registration Status**: Monitor business VAT registration renewal dates with AADE
- **TAXIS Platform Integration**: Prepare formatted data for Greek tax authority digital submissions
- **E-Books Legal Requirements**: Maintain certified digital accounting records per Greek Law 4308/2014
- **Stamp Duty Compliance**: Calculate and apply correct stamp duty (π¡αρπžςσημο) for contracts and legal documents
- **Social Security Deadlines**: Track IKA, EFKA, OAEE contribution filing and payment deadlines
- **Municipal Tax Monitoring**: Property taxes, waste collection fees, and local authority requirements
- **Greek VAT Rates**: Apply correct VAT rates (24% standard, 13% reduced, 6% super-reduced)
- **GDPR-Greece Compliance**: EU privacy law implementation with Greek DPA requirements
- **Greek Chart of Accounts**: Use standardized Greek accounting plan per ELSYN requirements
- **Withholding Tax Rules**: Apply correct withholding rates for Greek tax residents and non-residents

### Error Prevention & Recovery
- **Confidence Thresholds**: Minimum accuracy levels for automated processing
- **Double-Entry Verification**: Cross-check critical financial data
- **Rollback Capabilities**: Undo automation errors if detected
- **Exception Handling**: Clear escalation paths for unusual situations
- **Backup Systems**: Multiple redundant copies of all processed data

## Integration Requirements

### Required OpenClaw Skills
```bash
# Core document processing
npx openclaw skills add deepread        # OCR and text extraction
npx openclaw skills add pdf-tools       # PDF manipulation
npx openclaw skills add doc-converter   # Document format conversion

# Optional email attachment ingestion
npx openclaw skills add gmail           # Pull attachments into /data/incoming/
npx openclaw skills add outlook         # Pull attachments into /data/incoming/

# Greek accounting skills (install in order)
npx openclaw skills add greek-compliance-aade      # VAT and AADE filings
npx openclaw skills add greek-banking-integration  # Bank statement import
npx openclaw skills add efka-api-integration       # Social security
npx openclaw skills add client-data-management     # Client records
```

### OpenClaw File-Based Output
All processed data is written to the OpenClaw file system — no external accounting software required for core operation. Export commands produce standard formats for optional import into third-party tools:

```bash
# Export to common accounting formats
openclaw accounting export-transactions --client EL123456789 --format csv --period 2026-02
openclaw accounting export-transactions --client EL123456789 --format json --period 2026-02

# Optional: push exports to accounting software if integration configured
openclaw accounting export-transactions --client EL123456789 --target quickbooks --period 2026-02
openclaw accounting export-transactions --client EL123456789 --target xero --period 2026-02
```

## Performance Metrics

### Accuracy Targets
- **OCR Accuracy**: >95% for standard business documents
- **Data Extraction**: >98% for invoice total amounts
- **Vendor Matching**: >90% automatic vendor identification
- **Duplicate Detection**: >99% prevention of duplicate entries
- **Reconciliation**: >95% automatic transaction matching

### Efficiency Improvements  
- **Document Processing**: Reduce from 5 minutes to 30 seconds per document
- **Data Entry**: Eliminate 80% of manual typing
- **Email Processing**: Automatic categorization and routing
- **Month-end Close**: Reduce time by 60% through automation
- **Client Communications**: Automate 70% of routine correspondence

### User Experience
- **Daily Time Savings**: 2-4 hours of manual work automated
- **Error Reduction**: 90% fewer data entry mistakes
- **Deadline Compliance**: 100% on-time filing through automated reminders
- **Client Satisfaction**: Faster response times and more accurate reporting
- **Work-Life Balance**: Reduce overtime and weekend work

## Usage Examples

### Example 1: Invoice Processing
```markdown
Command: openclaw accounting process-invoices --input-dir /data/incoming/invoices --greek-format
System Response:
1. Scans /data/incoming/invoices for new PDF files
2. Extracts: ABC Corp, Invoice #12345, €1,247.50, Due: 2026-03-15
3. Validates: Vendor AFM format, amount consistency, date logic
4. Confidence: 95% — flags VAT calculation for review (87% confidence)
5. Writes structured JSON to /data/ocr/output/accounting-ready/
6. Output: "3 invoices processed. 1 flagged for review: inv_12345.pdf (VAT amount uncertain)"
```

### Example 2: Receipt Organisation
```markdown
Command: openclaw accounting extract-receipts --source /data/incoming/receipts --auto-classify
System Response:
1. Scans receipt files in input folder
2. OCR: "Mario's Restaurant, €45.67, Business Lunch, 2026-02-15"
3. Classifies: Business meal (50% deductible under Greek tax rules)
4. Archives processed image to /data/ocr/output/accounting-ready/ with searchable filename
5. Appends entry to /data/clients/{AFM}/compliance/monthly-expenses.json
6. Output: "Receipt processed: marios_20260215.pdf → meals/business (50% deductible)"
```

### Example 3: Bank Reconciliation
```markdown
Command: openclaw accounting reconcile --client EL123456789 --period 2026-02 --bank-file /data/incoming/statements/nbg_feb2026.csv
System Response:
1. Loads bank statement from provided file
2. Matches against /data/clients/EL123456789/processed/transactions_2026-02.json
3. Auto-matches 15 of 19 transactions (85% match rate)
4. Flags 4 unmatched items to /data/processing/reconciliation/flagged_2026-02.json
5. Writes reconciliation report to /data/reports/reconciliation_EL123456789_2026-02.pdf
6. Output: "15 matched, 4 need review. Report: reconciliation_EL123456789_2026-02.pdf"
```

## Troubleshooting & Maintenance

### Common Issues
1. **OCR Accuracy Problems**: Adjust image preprocessing, retrain templates
2. **System Integration Failures**: Check API credentials, network connectivity
3. **Duplicate Detection**: Review matching rules, update vendor databases
4. **Performance Slowdowns**: Archive old data, optimize processing queues
5. **Compliance Violations**: Update rules, review audit logs

### Regular Maintenance
- **Weekly**: Review flagged items, update vendor lists, check error logs
- **Monthly**: Performance analysis, backup verification, system updates
- **Quarterly**: Full accuracy audit, compliance review, user training
- **Annually**: Complete system review, upgrade planning, disaster recovery testing

## OpenClaw Integration & Commands

### Required OpenClaw Skills
```bash
# Core document processing skills
npx openclaw skills add deepread        # OCR and text extraction
npx openclaw skills add pdf-tools       # PDF manipulation
npx openclaw skills add doc-converter   # Document format conversion
npx openclaw skills add file-processor  # File organization and batch processing

# Optional enhancements
npx openclaw skills add gmail           # Email integration (if available)
npx openclaw skills add browser-control # Web scraping capabilities
```

### OpenClaw Command Structure
```bash
# Primary workflow commands
openclaw accounting process-invoices --input-dir /data/incoming/invoices/ --greek-format
openclaw accounting extract-receipts --input-dir /data/incoming/receipts/ --auto-classify
openclaw accounting validate-documents --vat-check --greek-standards
openclaw accounting export-transactions --client EL123456789 --format csv --period 2026-02

# File processing workflows
openclaw accounting batch-process --type invoices --output-format json
openclaw accounting scan-folder /data/incoming/ --auto-sort --greek-language
openclaw accounting generate-report --period monthly --include-compliance
```

### File System Organization
```yaml
OpenClaw_File_Structure:
  input_folders:                           # Raw documents arriving into system
    - /data/incoming/invoices/
    - /data/incoming/receipts/
    - /data/incoming/statements/
    - /data/incoming/government/           # AADE/EFKA letters and notifications
    
  processing_folders:                      # Ephemeral working space
    - /data/processing/ocr/validated/
    - /data/processing/classification/
    - /data/processing/reconciliation/
    
  output_folders:                          # Final canonical locations
    - /data/clients/{AFM}/documents/       # Processed documents registered per client
    - /data/clients/{AFM}/compliance/      # Filing records
    - /data/reports/                       # Generated reports
    - /data/exports/                       # Data exports
```

### Error Handling & Recovery
```bash
# Error handling commands
openclaw accounting retry-failed --batch-id {id} --fix-errors
openclaw accounting manual-review --flagged-documents --greek-support
openclaw accounting backup-restore --date yesterday --verify-integrity

# Monitoring and logging
openclaw accounting status --show-queue --show-errors
openclaw accounting logs --filter errors --last 24h
openclaw accounting health-check --test-integrations
```

A successful accounting workflow automation should achieve:
- ✅ 95%+ accuracy in document processing
- ✅ 80%+ reduction in manual data entry time  
- ✅ 100% compliance with filing deadlines
- ✅ Complete audit trail for all automated actions
- ✅ User confidence in automated processes
- ✅ Client satisfaction with faster, more accurate service

## Safety & Ethics Guidelines

### Financial Data Responsibility
- Never modify financial records without explicit business rules
- Always maintain original source documents
- Provide clear audit trails for all automated actions
- Flag suspicious transactions for human review
- Respect client confidentiality and data privacy

### Professional Standards
- Adhere to accounting principles and regulations
- Maintain separation between different clients' data
- Provide accurate, timely financial information
- Support, don't replace, professional judgment
- Enable better service through automation, not cost-cutting shortcuts

Remember: The goal is to eliminate tedious manual work while enhancing accuracy and compliance, allowing accounting professionals to focus on analysis, advisory services, and client relationships rather than data entry and document processing.
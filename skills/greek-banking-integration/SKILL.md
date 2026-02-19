---
name: greek-banking-integration
description: OpenClaw-optimized integration with all major Greek banks for automated statement processing, transaction reconciliation, and payment tracking. Built for real Greek bank statement formats (Alpha Bank, NBG, Eurobank, Piraeus, etc.) with practical file-based processing suitable for production deployment and testing in Greece.
version: 1.0.0
author: openclaw-greek-accounting
tags: ["greek", "accounting", "banking", "alpha-bank", "nbg", "eurobank", "piraeus"]
metadata: {"openclaw": {"requires": {"bins": ["jq"], "env": ["OPENCLAW_DATA_DIR"]}}}
---

# Greek Banking Integration

This skill provides comprehensive integration with the Greek banking system through practical file processing of bank statements, transaction data, and payment confirmations from all major Greek financial institutions.

## Core Philosophy

- **Real Greek Bank Focus**: Built for actual Greek bank statement formats and business practices
- **File-Based Processing**: Process exported bank data files, not complex banking APIs
- **OpenClaw Native**: Designed specifically for OpenClaw's file processing strengths
- **Production Testing Ready**: Suitable for VM testing and real Greek company deployment
- **All Major Banks**: Alpha Bank, National Bank, Eurobank, Piraeus, and regional banks

## OpenClaw Commands

### Core Banking Operations
```bash
# Primary bank statement processing
openclaw banking import-statements --bank-type greek --auto-detect-format
openclaw banking process-batch --input-dir /data/banking/imports/ --reconcile-auto
openclaw banking categorize-transactions --greek-business-rules --vat-detection
openclaw banking export-reconciliation --format csv --greek-chart-accounts

# Individual bank processing (canonical import paths)
openclaw banking process-alpha --statements-dir /data/banking/imports/alpha/
openclaw banking process-nbg --statements-dir /data/banking/imports/nbg/
openclaw banking process-eurobank --statements-dir /data/banking/imports/eurobank/
openclaw banking process-piraeus --statements-dir /data/banking/imports/piraeus/

# Transaction analysis and reconciliation
openclaw banking match-invoices --outstanding-receivables --confidence-threshold 0.9
openclaw banking detect-duplicates --cross-account --mark-suspicious
openclaw banking categorize-expenses --greek-expense-categories --vat-rates
openclaw banking generate-reconciliation --period monthly --include-variance-analysis
```

### Payment Processing & Tracking
```bash
# Payment confirmation processing
openclaw banking track-payments --pending-invoices --match-references
openclaw banking confirm-receipts --client-payments --auto-update-accounting
openclaw banking process-sepa --incoming-payments --outgoing-transfers

# Cash flow and analysis
openclaw banking cashflow-analysis --period quarterly --predict-trends
openclaw banking currency-conversion --foreign-transactions --ecb-rates
openclaw banking fee-analysis --bank-charges --optimization-suggestions
```

### Integration & Export Commands
```bash
# Integration with accounting systems
openclaw banking sync-quickbooks --greek-locale --match-existing-transactions
openclaw banking export-xero --greek-vat-codes --multi-currency
openclaw banking integrate-sage --greek-nominal-codes --reconciliation-reports

# Integration with other OpenClaw skills
openclaw banking integrate-compliance --vat-calculations --deadline-tracking
openclaw banking sync-individual-taxes --personal-account-data --expense-tracking
openclaw banking coordinate-meta --enable-orchestration --business-commands
```

## Greek Bank Support Architecture

### Major Greek Banks Integration
```yaml
Supported_Greek_Banks:
  alpha_bank:
    bank_code: "014"
    iban_prefix: "GR01"
    statement_formats: ["PDF", "Excel", "CSV", "MT940"]
    online_banking: "Alpha Web Banking"
    business_banking: "Alpha Business Banking"
    common_export_formats:
      - excel: "Alpha_Statement_YYYYMMDD.xlsx"
      - csv: "account_movements_YYYYMMDD.csv"
      - pdf: "Monthly_Statement_YYYYMM.pdf"
    
  national_bank:
    bank_code: "011"
    iban_prefix: "GR07"
    statement_formats: ["PDF", "Excel", "CSV", "QIF"]
    online_banking: "NBG i-bank"
    business_banking: "NBG Business i-bank"
    common_export_formats:
      - excel: "NBG_Transactions_YYYYMMDD.xls"
      - csv: "account_statement_YYYYMM.csv"
      - pdf: "NBG_Statement_YYYYMM.pdf"
    
  eurobank:
    bank_code: "026"
    iban_prefix: "GR02"
    statement_formats: ["PDF", "Excel", "CSV", "OFX"]
    online_banking: "Eurobank e-banking"  
    business_banking: "Eurobank Business e-banking"
    common_export_formats:
      - excel: "Eurobank_Statement_YYYYMMDD.xlsx"
      - csv: "movements_YYYYMMDD.csv"
      - pdf: "Account_Statement_YYYYMM.pdf"
      
  piraeus_bank:
    bank_code: "017"
    iban_prefix: "GR58"
    statement_formats: ["PDF", "Excel", "CSV", "MT942"]
    online_banking: "Piraeus winbank"
    business_banking: "Piraeus winbank Business"
    common_export_formats:
      - excel: "Piraeus_Movements_YYYYMMDD.xlsx"
      - csv: "account_history_YYYYMM.csv"
      - pdf: "Piraeus_Statement_YYYYMM.pdf"

  attica_bank:
    bank_code: "025"
    iban_prefix: "GR16"
    statement_formats: ["PDF", "Excel", "CSV"]
    focus: "Regional Greek bank"
    
  cretan_bank:
    bank_code: "045"
    iban_prefix: "GR62"
    statement_formats: ["PDF", "CSV"]
    focus: "Crete regional banking"
```

### Greek Bank Statement Formats
```yaml
Statement_Format_Recognition:
  alpha_bank_excel:
    headers_greek: ["ÃŽâ€”ÃŽÂ¼ÃŽÂµÃÂÃŽÂ¿ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¯ÃŽÂ±", "ÃŽÂ ÃŽÂµÃÂÃŽÂ¹ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ®", "ÃŽÂ ÃŽÂ¿ÃÆ’ÃÅ’", "ÃŽÂ¥Ãâ‚¬ÃÅ’ÃŽÂ»ÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¿"]
    headers_english: ["Date", "Description", "Amount", "Balance"]
    date_format: "dd/MM/yyyy"
    amount_format: "1.234,56"
    encoding: "Windows-1253, UTF-8"
    
  nbg_csv:
    headers: ["ÃŽâ€”ÃŽÅ“ÃŽâ€¢ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽÂÃŽâ„¢ÃŽâ€˜", "ÃŽâ€˜ÃŽâ„¢ÃŽÂ¤ÃŽâ„¢ÃŽÅ¸ÃŽâ€ºÃŽÅ¸ÃŽâ€œÃŽâ„¢ÃŽâ€˜", "ÃŽÂ§ÃŽÂ¡ÃŽâ€¢ÃŽÂ©ÃŽÂ£ÃŽâ€”", "ÃŽÂ ÃŽâ„¢ÃŽÂ£ÃŽÂ¤ÃŽÂ©ÃŽÂ£ÃŽâ€”", "ÃŽÂ¥ÃŽÂ ÃŽÅ¸ÃŽâ€ºÃŽÅ¸ÃŽâ„¢ÃŽÂ ÃŽÅ¸"]
    separator: ";"
    decimal_separator: ","
    date_format: "dd/MM/yyyy"
    
  eurobank_excel:
    headers: ["ÃŽâ€”ÃŽÂ¼/ÃŽÂ½ÃŽÂ¯ÃŽÂ±", "ÃŽÅ¡Ãâ€°ÃŽÂ´.ÃŽÂ£Ãâ€¦ÃŽÂ½ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ®Ãâ€š", "ÃŽÂ ÃŽÂµÃÂÃŽÂ¹ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ®", "ÃŽÂ ÃŽÂ¿ÃÆ’ÃÅ’", "ÃŽÂ¥Ãâ‚¬ÃÅ’ÃŽÂ»ÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¿"]
    currency_column: "ÃŽÂÃÅ’ÃŽÂ¼ÃŽÂ¹ÃÆ’ÃŽÂ¼ÃŽÂ±"
    reference_column: "ÃŽâ€˜ÃÂ.ÃŽÂ ÃŽÂ±ÃÂÃŽÂ±ÃÆ’Ãâ€žÃŽÂ±Ãâ€žÃŽÂ¹ÃŽÂºÃŽÂ¿ÃÂ"
    
  piraeus_csv:
    headers: ["ÃŽâ€”ÃŽÂ¼ÃŽÂµÃÂÃŽÂ¿ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¯ÃŽÂ± ÃŽÂ£Ãâ€¦ÃŽÂ½ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ®Ãâ€š", "ÃŽÂ ÃŽÂµÃÂÃŽÂ¹ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ®", "ÃŽÂ ÃŽÂ¿ÃÆ’ÃÅ’", "ÃŽÂ¥Ãâ‚¬ÃÅ’ÃŽÂ»ÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¿ ÃŽÅ“ÃŽÂµÃâ€žÃŽÂ¬"]
    special_fields: ["ÃŽÅ¡Ãâ€°ÃŽÂ´ÃŽÂ¹ÃŽÂºÃÅ’Ãâ€š ÃŽÂ£Ãâ€¦ÃŽÂ½ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ®Ãâ€š", "ÃŽâ€˜ÃÂ. ÃŽâ€˜ÃŽÂ½ÃŽÂ±Ãâ€ ÃŽÂ¿ÃÂÃŽÂ¬Ãâ€š"]
```

## OpenClaw File Processing Architecture

### File System Organization for Greek Banks
```yaml
Banking_File_Structure:
  bank_imports:
    - /data/banking/imports/alpha/          # Alpha Bank statement imports
    - /data/banking/imports/nbg/            # National Bank imports  
    - /data/banking/imports/eurobank/       # Eurobank imports
    - /data/banking/imports/piraeus/        # Piraeus Bank imports
    - /data/banking/imports/other/          # Other Greek banks
    
  processing_workspace:
    - /data/banking/processing/raw/         # Imported files before processing
    - /data/banking/processing/validated/   # Format validation completed
    - /data/banking/processing/categorized/ # Transaction categorization done
    - /data/banking/processing/reconciled/  # Reconciliation completed
    
  output_delivery:
    - /data/banking/reconciliation/         # Bank reconciliation reports
    - /data/exports/accounting-software/    # Ready for accounting software export
    - /data/reports/client/                 # Client-facing bank summaries
```

### Bank Statement Processing Pipeline
```yaml
Processing_Workflow:
  step_1_import:
    command: "openclaw banking import-batch --scan-all-banks --auto-detect"
    input: "/data/banking/imports/{bank_name}/"
    output: "/data/banking/processing/raw/"
    functions: ["File format detection", "Bank identification", "Data validation"]
    
  step_2_validate:
    command: "openclaw banking validate-format --greek-standards --fix-encoding"
    input: "/data/banking/processing/raw/"
    output: "/data/banking/processing/validated/"
    functions: ["Greek character encoding fix", "Date format standardization", "Amount parsing"]
    
  step_3_categorize:
    command: "openclaw banking categorize --greek-business-rules --vat-detection"
    input: "/data/banking/processing/validated/"
    output: "/data/banking/processing/categorized/"
    functions: ["Expense categorization", "VAT rate detection", "Client payment identification"]
    
  step_4_reconcile:
    command: "openclaw banking reconcile --match-outstanding --confidence-scoring"
    input: "/data/banking/processing/categorized/"
    output: "/data/banking/processing/reconciled/"
    functions: ["Invoice matching", "Payment confirmation", "Variance analysis"]
    
  step_5_export:
    command: "openclaw banking export-accounting --csv --greek-formats"
    input: "/data/banking/processing/reconciled/"
    output: "/data/exports/accounting-software/"
    functions: ["Chart of accounts mapping", "VAT code assignment", "Multi-currency handling"]
```

## Greek Business Transaction Intelligence

### Greek Transaction Categorization
```yaml
Greek_Business_Categories:
  income_categories:
    client_payments:
      keywords_greek: ["ÃŽÂ ÃŽâ€ºÃŽâ€”ÃŽÂ¡ÃŽÂ©ÃŽÅ“ÃŽâ€”", "ÃŽâ€¢ÃŽÅ“ÃŽâ€™ÃŽâ€˜ÃŽÂ£ÃŽÅ“ÃŽâ€˜", "ÃŽÅ¡ÃŽâ€˜ÃŽÂ¤ÃŽâ€˜ÃŽËœÃŽâ€¢ÃŽÂ£ÃŽâ€”"]
      keywords_english: ["PAYMENT", "TRANSFER", "DEPOSIT"]
      vat_implications: "Check if VAT already included"
      
    government_refunds:
      keywords: ["ÃŽâ€˜ÃŽâ€ÃŽâ€ÃŽâ€¢", "ÃŽâ€¢ÃŽÂ¦ÃŽÅ¡ÃŽâ€˜", "ÃŽâ€ÃŽâ€”ÃŽÅ“ÃŽÅ¸ÃŽÂ£", "ÃŽâ€¢ÃŽÂ ÃŽâ„¢ÃŽÂ£ÃŽÂ¤ÃŽÂ¡ÃŽÅ¸ÃŽÂ¦ÃŽâ€”"]
      categories: ["VAT refunds", "Social security refunds", "Municipal refunds"]
      
    bank_interest:
      keywords: ["ÃŽÂ¤ÃŽÅ¸ÃŽÅ¡ÃŽÅ¸ÃŽâ„¢", "INTEREST", "ÃŽÂ ÃŽÂ¡ÃŽÅ¸ÃŽÂ£ÃŽÅ¸ÃŽâ€ÃŽÅ¸ÃŽÂ£"]
      tax_treatment: "15% withholding tax already applied"
      
  expense_categories:
    supplier_payments:
      keywords_greek: ["ÃŽÂ ÃŽâ€ºÃŽâ€”ÃŽÂ¡ÃŽÂ©ÃŽÅ“ÃŽâ€” ÃŽÂ ÃŽÂ¡ÃŽÅ¸ÃŽÂ£", "ÃŽÅ“ÃŽâ€¢ÃŽÂ¤ÃŽâ€˜ÃŽÂ¦ÃŽÅ¸ÃŽÂ¡ÃŽâ€˜", "ÃŽâ€¢ÃŽÂÃŽÂ¤ÃŽÅ¸ÃŽâ€ºÃŽâ€”"]
      vat_recovery: "Standard 24%, Reduced 13%, Super-reduced 6%"
      
    payroll_expenses:
      keywords: ["ÃŽÅ“ÃŽâ„¢ÃŽÂ£ÃŽËœÃŽÅ¸ÃŽâ€ÃŽÅ¸ÃŽÂ£ÃŽâ„¢ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¡ÃŽâ€œÃŽâ€˜ÃŽâ€“ÃŽÅ¸ÃŽÅ“ÃŽâ€¢ÃŽÂÃŽÅ¸ÃŽÂ£", "ÃŽâ„¢ÃŽÅ¡ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¦ÃŽÅ¡ÃŽâ€˜"]
      categories: ["Gross salaries", "Social security employer", "Withholding taxes"]
      
    government_payments:
      keywords: ["ÃŽâ€˜ÃŽâ€ÃŽâ€ÃŽâ€¢", "ÃŽÂ¦ÃŽÂ ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¦ÃŽÅ¡ÃŽâ€˜", "ÃŽâ€ÃŽâ€”ÃŽÅ“ÃŽÅ¸ÃŽÂ£", "ENFIA"]
      categories: ["VAT payments", "Income tax", "Social security", "Municipal taxes"]
      
    operating_expenses:
      rent: ["ÃŽâ€¢ÃŽÂÃŽÅ¸ÃŽâ„¢ÃŽÅ¡ÃŽâ„¢ÃŽÅ¸", "ÃŽÅ“ÃŽâ„¢ÃŽÂ£ÃŽËœÃŽÂ©ÃŽÅ“ÃŽâ€˜"]
      utilities: ["ÃŽâ€ÃŽâ€¢ÃŽâ€”", "ÃŽâ€¢ÃŽÂ¥ÃŽâ€ÃŽâ€˜ÃŽÂ ", "COSMOTE", "VODAFONE", "WIND"]
      fuel: ["ÃŽÅ¡ÃŽâ€˜ÃŽÂ¥ÃŽÂ£ÃŽâ„¢ÃŽÅ“ÃŽâ€˜", "ÃŽâ€™ÃŽâ€¢ÃŽÂÃŽâ€“ÃŽâ„¢ÃŽÂÃŽâ€”", "ÃŽÂ ÃŽâ€¢ÃŽÂ¤ÃŽÂ¡ÃŽâ€¢ÃŽâ€ºÃŽâ€˜ÃŽâ„¢ÃŽÅ¸", "BP", "SHELL", "ELIN"]
      office: ["ÃŽâ€œÃŽÂ¡ÃŽâ€˜ÃŽÂ¦ÃŽâ„¢ÃŽÅ¡ÃŽâ€˜", "ÃŽâ€˜ÃŽÂÃŽâ€˜ÃŽâ€ºÃŽÂ©ÃŽÂ£ÃŽâ„¢ÃŽÅ“ÃŽâ€˜", "OFFICE", "SUPPLIES"]
```

### Greek Banking Transaction Patterns
```yaml
Transaction_Pattern_Recognition:
  sepa_transfers:
    domestic_pattern: "GR[0-9]{2}[0-9]{3}[0-9]{16}"
    international_pattern: "[A-Z]{2}[0-9]{2}[A-Z0-9]{1,30}"
    fee_detection: "Look for SEPA fees in separate transactions"
    
  standing_orders:
    keywords: ["ÃŽÅ“ÃŽÅ¸ÃŽÂÃŽâ„¢ÃŽÅ“ÃŽâ€” ÃŽâ€¢ÃŽÂÃŽÂ¤ÃŽÅ¸ÃŽâ€ºÃŽâ€”", "STANDING ORDER", "ÃŽÂ¤ÃŽâ€˜ÃŽÅ¡ÃŽÂ¤ÃŽâ„¢ÃŽÅ¡ÃŽâ€” ÃŽÂ ÃŽâ€ºÃŽâ€”ÃŽÂ¡ÃŽÂ©ÃŽÅ“ÃŽâ€”"]
    categorization: "Recurring expense (rent, insurance, loan payments)"
    
  direct_debits:
    keywords: ["ÃŽâ€˜ÃŽÅ“ÃŽâ€¢ÃŽÂ£ÃŽâ€” ÃŽÂ§ÃŽÂ¡ÃŽâ€¢ÃŽÂ©ÃŽÂ£ÃŽâ€”", "DIRECT DEBIT", "DOMICILIATION"]
    common_billers: ["ÃŽâ€ÃŽâ€¢ÃŽâ€”", "ÃŽâ€¢ÃŽÂ¥ÃŽâ€ÃŽâ€˜ÃŽÂ ", "COSMOTE", "Insurance companies"]
    
  card_transactions:
    pos_patterns: ["POS", "CARD", "ÃŽÅ¡ÃŽâ€˜ÃŽÂ¡ÃŽÂ¤ÃŽâ€˜", "ÃŽâ€˜ÃŽâ€œÃŽÅ¸ÃŽÂ¡ÃŽâ€˜"]
    online_patterns: ["ONLINE", "INTERNET", "E-COMMERCE"]
    cash_withdrawals: ["ATM", "ÃŽâ€˜ÃŽÂÃŽâ€˜ÃŽâ€ºÃŽâ€”ÃŽÂ¨ÃŽâ€”", "ÃŽÅ“ÃŽâ€¢ÃŽÂ¤ÃŽÂ¡ÃŽâ€”ÃŽÂ¤ÃŽâ€˜"]
```

## Greek Banking API & Data Integration

### Practical Bank Data Integration
```yaml
Real_World_Integration:
  bank_export_procedures:
    alpha_bank:
      login: "Alpha Web Banking or Business Banking"
      navigation: "Accounts Ã¢â€ â€™ Statement Ã¢â€ â€™ Export"
      formats_available: ["Excel", "CSV", "PDF"]
      export_period: "Custom date range (max 12 months)"
      
    nbg:
      login: "NBG i-bank"
      navigation: "Account Info Ã¢â€ â€™ Account Statement Ã¢â€ â€™ Download"
      formats_available: ["Excel", "CSV", "PDF", "QIF"]
      special_note: "Business accounts have additional export options"
      
    eurobank:
      login: "e-banking Portal"
      navigation: "Accounts Ã¢â€ â€™ Movement History Ã¢â€ â€™ Export Data"
      formats_available: ["Excel", "CSV", "PDF", "OFX"]
      automation_note: "Some business accounts allow scheduled exports"
      
    piraeus:
      login: "winbank"
      navigation: "Account Ã¢â€ â€™ History Ã¢â€ â€™ Export Statement"
      formats_available: ["Excel", "CSV", "PDF"]
      bulk_download: "Available for business accounts"
```

### OpenClaw Bank File Monitoring
```bash
# Monitor for new bank files
openclaw banking monitor-imports --watch-directories --auto-process
openclaw banking schedule-imports --daily-check --business-hours-only

# Handle various file formats automatically  
openclaw banking auto-detect --all-greek-banks --handle-encoding-issues
openclaw banking batch-process --parallel-processing --error-recovery

# Integration testing commands (for your VM testing)
openclaw banking test-formats --sample-statements --all-greek-banks
openclaw banking validate-parsing --check-accuracy --greek-date-formats
openclaw banking simulate-processing --test-reconciliation --dry-run
```

## Advanced Reconciliation Features

### Intelligent Transaction Matching
```yaml
Matching_Algorithms:
  invoice_matching:
    exact_amount_match: "Priority 1: Exact euro amount matching"
    reference_number_match: "Priority 2: Invoice number in description"
    client_name_match: "Priority 3: Client name fuzzy matching"
    date_proximity_match: "Priority 4: Within payment terms window"
    
  payment_confirmation:
    confidence_scoring:
      - perfect_match: "100% - Amount + Reference + Date"
      - high_confidence: "90-99% - Amount + (Reference OR Client)"
      - medium_confidence: "70-89% - Amount + Date proximity"
      - low_confidence: "50-69% - Amount match only"
      - manual_review: "<50% - Requires human verification"
      
  duplicate_detection:
    same_day_same_amount: "Flag for review"
    reference_number_duplicate: "Error - same reference used twice"
    client_overpayment: "Detect overpayments for refund processing"
```

### Greek VAT Transaction Analysis
```yaml
VAT_Analysis_Features:
  vat_rate_detection:
    standard_24_percent:
      transaction_patterns: "Most goods and services"
      calculation_check: "Amount * 1.24 or Amount / 1.24"
      
    reduced_13_percent:
      transaction_patterns: "Hotels, restaurants, transport"
      keywords: ["ÃŽâ€¢ÃŽÂ£ÃŽÂ¤ÃŽâ„¢ÃŽâ€˜ÃŽÂ¤ÃŽÅ¸ÃŽÂ¡ÃŽâ„¢ÃŽÅ¸", "ÃŽÅ¾ÃŽâ€¢ÃŽÂÃŽÅ¸ÃŽâ€ÃŽÅ¸ÃŽÂ§ÃŽâ€¢ÃŽâ„¢ÃŽÅ¸", "ÃŽÂ¤ÃŽâ€˜ÃŽÅ¾ÃŽâ„¢", "RESTAURANT", "HOTEL"]
      
    super_reduced_6_percent:
      transaction_patterns: "Books, newspapers, medicines"
      keywords: ["ÃŽâ€™ÃŽâ„¢ÃŽâ€™ÃŽâ€ºÃŽâ„¢ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¦ÃŽâ€”ÃŽÅ“ÃŽâ€¢ÃŽÂ¡ÃŽâ„¢ÃŽâ€ÃŽâ€˜", "ÃŽÂ¦ÃŽâ€˜ÃŽÂ¡ÃŽÅ“ÃŽâ€˜ÃŽÅ¡ÃŽâ€¢ÃŽâ„¢ÃŽÅ¸", "BOOKS", "PHARMACY"]
      
  vat_recovery_calculation:
    input_vat_tracking: "Track recoverable VAT from suppliers"
    vat_return_preparation: "Calculate net VAT position"
    quarterly_vat_analysis: "Prepare quarterly VAT return data"
```

## Integration with Greek Accounting Standards

### Greek Chart of Accounts Mapping
```yaml
Greek_Accounting_Integration:
  elsyn_chart_of_accounts:
    class_1_assets:
      - "10. ÃŽÂ ÃŽÂ¬ÃŽÂ³ÃŽÂ¹ÃŽÂ± ÃÆ’Ãâ€žÃŽÂ¿ÃŽÂ¹Ãâ€¡ÃŽÂµÃŽÂ¯ÃŽÂ± ÃŽÂµÃŽÂ½ÃŽÂµÃÂÃŽÂ³ÃŽÂ·Ãâ€žÃŽÂ¹ÃŽÂºÃŽÂ¿ÃÂ"
      - "14. ÃŽâ€˜Ãâ‚¬ÃŽÂ¿ÃŽÂ¸ÃŽÂ­ÃŽÂ¼ÃŽÂ±Ãâ€žÃŽÂ±"
      - "16. ÃŽâ€˜Ãâ‚¬ÃŽÂ±ÃŽÂ¹Ãâ€žÃŽÂ®ÃÆ’ÃŽÂµÃŽÂ¹Ãâ€š"
      - "18. ÃŽâ€ÃŽÂ¹ÃŽÂ±ÃŽÂ¸ÃŽÂ­ÃÆ’ÃŽÂ¹ÃŽÂ¼ÃŽÂ±"
      
    class_2_liabilities:
      - "20. ÃŽÅ ÃŽÂ´ÃŽÂ¹ÃŽÂ± ÃŽÂºÃŽÂµÃâ€ ÃŽÂ¬ÃŽÂ»ÃŽÂ±ÃŽÂ¹ÃŽÂ±"
      - "24. ÃŽÂ ÃÂÃŽÂ¿ÃŽÂ²ÃŽÂ»ÃŽÂ­ÃË†ÃŽÂµÃŽÂ¹Ãâ€š ÃŽÂ³ÃŽÂ¹ÃŽÂ± ÃŽÂºÃŽÂ¹ÃŽÂ½ÃŽÂ´ÃÂÃŽÂ½ÃŽÂ¿Ãâ€¦Ãâ€š ÃŽÂºÃŽÂ±ÃŽÂ¹ ÃŽÂ­ÃŽÂ¾ÃŽÂ¿ÃŽÂ´ÃŽÂ±"  
      - "25. ÃŽÂ¥Ãâ‚¬ÃŽÂ¿Ãâ€¡ÃÂÃŽÂµÃÅ½ÃÆ’ÃŽÂµÃŽÂ¹Ãâ€š"
      
    class_6_expenses:
      - "60. ÃŽâ€˜ÃŽÂ³ÃŽÂ¿ÃÂÃŽÂ­Ãâ€š"
      - "61. ÃŽÅ“ÃŽÂµÃâ€žÃŽÂ±ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ® ÃŽÂ±Ãâ‚¬ÃŽÂ¿ÃŽÂ¸ÃŽÂµÃŽÂ¼ÃŽÂ¬Ãâ€žÃâ€°ÃŽÂ½"
      - "62. ÃŽâ€ºÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ­Ãâ€š Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ¿Ãâ€¡ÃŽÂ­Ãâ€š Ãâ€žÃÂÃŽÂ¯Ãâ€žÃâ€°ÃŽÂ½"
      - "63. ÃŽÂ ÃŽÂ±ÃÂÃŽÂ¿Ãâ€¡ÃŽÂ­Ãâ€š ÃÆ’ÃŽÂµ ÃŽÂµÃÂÃŽÂ³ÃŽÂ±ÃŽÂ¶ÃŽÂ¿ÃŽÂ¼ÃŽÂ­ÃŽÂ½ÃŽÂ¿Ãâ€¦Ãâ€š"
      - "64. ÃŽâ€ºÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¬ ÃŽÂ»ÃŽÂµÃŽÂ¹Ãâ€žÃŽÂ¿Ãâ€¦ÃÂÃŽÂ³ÃŽÂ¹ÃŽÂºÃŽÂ¬ ÃŽÂ­ÃŽÂ¾ÃŽÂ¿ÃŽÂ´ÃŽÂ±"
      
    class_7_income:
      - "70. ÃŽÂ Ãâ€°ÃŽÂ»ÃŽÂ®ÃÆ’ÃŽÂµÃŽÂ¹Ãâ€š ÃŽÂµÃŽÂ¼Ãâ‚¬ÃŽÂ¿ÃÂÃŽÂµÃâ€¦ÃŽÂ¼ÃŽÂ¬Ãâ€žÃâ€°ÃŽÂ½"
      - "73. ÃŽÂ ÃŽÂ±ÃÂÃŽÂ±ÃŽÂ³Ãâ€°ÃŽÂ³ÃŽÂ® Ãâ‚¬ÃŽÂµÃÂÃŽÂ¹ÃÅ’ÃŽÂ´ÃŽÂ¿Ãâ€¦"
      - "74. ÃŽÂ ÃŽÂ±ÃÂÃŽÂ¿Ãâ€¡ÃŽÂ­Ãâ€š Ãâ€¦Ãâ‚¬ÃŽÂ·ÃÂÃŽÂµÃÆ’ÃŽÂ¹ÃÅ½ÃŽÂ½"
      - "75. ÃŽâ€ºÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¬ ÃÆ’Ãâ€¦ÃŽÂ½ÃŽÂ®ÃŽÂ¸ÃŽÂ· ÃŽÂ­ÃÆ’ÃŽÂ¿ÃŽÂ´ÃŽÂ±"
```

### Accounting Software Integration
```yaml
Accounting_Software_Export:
  quickbooks_greece:
    chart_of_accounts: "Map to Greek ELSYN standards"
    vat_codes: "Map Greek VAT rates to QuickBooks codes"
    currency: "EUR primary, handle foreign currency"
    
  xero_greece:
    account_mapping: "Custom Greek chart of accounts setup"
    bank_feeds: "Direct bank feed integration where possible"
    vat_reporting: "Greek VAT return format"
    
  sage_greece:
    nominal_codes: "Greek accounting nominal code structure"
    multi_currency: "Handle EUR and foreign transactions"
    reporting: "Greek statutory reporting formats"
```

## Production Testing & Validation

### Greek Bank Testing Procedures
```bash
# Testing commands for VM and Greek company deployment
openclaw banking test-greek-banks --validate-all-formats --sample-data
openclaw banking accuracy-test --known-transactions --measure-precision
openclaw banking performance-test --large-statements --processing-speed

# Validation for real Greek bank data
openclaw banking validate-greek-format --check-encoding --verify-amounts
openclaw banking audit-trail --transaction-tracking --modification-log
openclaw banking reconciliation-test --against-manual-reconciliation
```

### Error Handling & Recovery for Greek Banks
```yaml
Error_Recovery_Procedures:
  format_recognition_failure:
    action: "Try alternative parsers for the same bank"
    fallback: "Manual format specification with guided setup"
    
  greek_encoding_issues:
    detection: "Check for Windows-1253, ISO-8859-7, UTF-8"
    correction: "Auto-convert to UTF-8 with character mapping"
    
  amount_parsing_errors:
    greek_format: "Handle 1.234,56 format and currency symbols"
    validation: "Cross-check totals against statement summary"
    
  date_format_confusion:
    greek_standard: "dd/MM/yyyy format"
    validation: "Check against known Greek banking date patterns"
```

## Usage Examples for Greek Company Testing

### Daily Bank Processing
```bash
# Typical morning banking workflow for Greek company
$ openclaw banking morning-process --all-greek-banks --yesterday

Ã°Å¸ÂÂ¦ Greek Banking Processing Summary - February 19, 2026:

Ã°Å¸â€œÅ  Statements Processed:
Ã¢Å“â€¦ Alpha Bank Business Account (Ã¢â€šÂ¬45,230.67 Ã¢â€ â€™ Ã¢â€šÂ¬47,890.45)
   - 12 transactions processed  
   - 8 client payments identified (+Ã¢â€šÂ¬8,450.00)
   - 4 supplier payments (-Ã¢â€šÂ¬5,790.22)
   
Ã¢Å“â€¦ Eurobank Current Account (Ã¢â€šÂ¬12,450.30 Ã¢â€ â€™ Ã¢â€šÂ¬11,890.15) 
   - 6 transactions processed
   - 2 government payments identified (-Ã¢â€šÂ¬560.15)
   - 4 operating expenses (-Ã¢â€šÂ¬0.00)

Ã°Å¸Å½Â¯ Reconciliation Results:
Ã¢Å“â€¦ 7 invoices automatically matched (100% confidence)
Ã¢Å¡Â Ã¯Â¸Â 2 payments require manual review (Invoice #2024-0156, #2024-0189)  
Ã¢Å“â€¦ VAT analysis completed: Ã¢â€šÂ¬1,240.50 recoverable input VAT

Ã°Å¸â€œÂ¤ Exports Generated:
- QuickBooks: /data/exports/accounting-software/EL123456789_2026-02_transactions.csv
- VAT Analysis: /data/reports/client/EL123456789_2026-02_vat-analysis.xlsx
- Client Reports: 5 payment confirmations ready for sending
```

### Greek Bank Reconciliation Example
```bash
$ openclaw banking reconcile-month --february-2026 --all-accounts

Ã°Å¸â€œâ€¹ February 2026 Bank Reconciliation:

Ã°Å¸ÂÂ¦ Alpha Bank Business (***1234):
Bank Statement Balance: Ã¢â€šÂ¬47,890.45
Outstanding Deposits: Ã¢â€šÂ¬2,340.00 (Feb 28 deposits in transit)
Outstanding Checks: Ã¢â€šÂ¬890.50 (Checks not yet cleared)
Book Balance: Ã¢â€šÂ¬49,339.95
Variance: Ã¢â€šÂ¬0.00 Ã¢Å“â€¦

Ã°Å¸â€Â Matched Transactions: 156/158 (98.7%)
Ã¢Å¡Â Ã¯Â¸Â Unmatched Transactions (2):
  - Ã¢â€šÂ¬234.50 - "SEPA Transfer - Unknown reference XYZ123"
  - Ã¢â€šÂ¬89.90 - "Bank charges - Service fee"

Ã°Å¸Â§Â® VAT Summary:
Input VAT Recovered: Ã¢â€šÂ¬3,450.67 (24% standard rate)
Output VAT Collected: Ã¢â€šÂ¬5,670.88 (mixed rates)
Net VAT Position: Ã¢â€šÂ¬2,220.21 payable

Ã°Å¸â€œÅ  Client Payments Analysis:
- COMPANY A AE: Ã¢â€šÂ¬4,500.00 (Invoice #2024-0145) Ã¢Å“â€¦
- COMPANY B EPE: Ã¢â€šÂ¬2,300.00 (Invoice #2024-0167) Ã¢Å“â€¦  
- FREELANCER C: Ã¢â€šÂ¬890.00 (Multiple invoices) Ã¢Å¡Â Ã¯Â¸Â Partial payment
```

### Integration with Meta-Skill
```bash
# Meta-skill orchestrated banking (what your girlfriend will use)
$ openclaw greek daily-banking --process-statements --auto-reconcile

# Behind the scenes coordination:
# 1. Greek Banking Integration: Process all bank files
# 2. Accounting Workflows: Categorize and validate transactions
# 3. Greek Compliance AADE: Update VAT calculations
# 4. Email Processor: Generate payment confirmations
# 5. Individual Taxes: Update personal account tracking (if applicable)
# 6. Professional Greek summary generated for review
```

## Success Metrics for Greek Company Testing

A successful Greek banking integration should achieve:
- Ã¢Å“â€¦ 95%+ automatic transaction categorization accuracy
- Ã¢Å“â€¦ Support for all major Greek bank statement formats
- Ã¢Å“â€¦ <5 minute processing time for monthly statements
- Ã¢Å“â€¦ 90%+ automatic invoice-to-payment matching
- Ã¢Å“â€¦ Complete VAT analysis with Greek rates (24%, 13%, 6%)
- Ã¢Å“â€¦ Seamless integration with Greek accounting software
- Ã¢Å“â€¦ Robust handling of Greek language and character encoding
- Ã¢Å“â€¦ Production-ready error handling and recovery procedures

Remember: This skill is designed specifically for testing with real Greek banks and Greek company data, using OpenClaw's file processing capabilities to handle the complexity of Greek banking formats and business requirements.
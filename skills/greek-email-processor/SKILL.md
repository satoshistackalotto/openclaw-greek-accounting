---
name: greek-email-processor
description: Automated email processing skill for Greek accounting workflows. Monitors Gmail, Outlook, and other email providers for Greek financial documents, AADE notifications, bank statements, invoices, and client correspondence. Provides intelligent document classification, automated forwarding, and Greek language support for accounting automation.
version: 1.0.0
author: openclaw-greek-accounting
tags: ["greek", "accounting", "email", "document-classification", "gmail"]
metadata: {"openclaw": {"requires": {"bins": ["jq", "curl"], "env": ["OPENCLAW_DATA_DIR"]}}}
---

# Greek Email Processor

This skill transforms OpenClaw into an intelligent Greek business email processor that automatically detects, categorizes, and processes financial documents and official communications from Greek government agencies, banks, and business partners.

## Core Philosophy

- **Greek Language First**: Native support for Greek language emails and documents
- **Intelligent Classification**: Automatic detection of document types and priority levels
- **Compliance Focused**: Special handling for AADE, EFKA, and government communications
- **Business Context Aware**: Understanding of Greek business communication patterns
- **Privacy Conscious**: Secure handling of sensitive financial information in emails

## Key Capabilities

### 1. Greek Document Recognition & Classification
- **Invoice Detection**: Identify Greek invoices (ÃŽÂ¤ÃŽâ„¢ÃŽÅ“ÃŽÅ¸ÃŽâ€ºÃŽÅ¸ÃŽâ€œÃŽâ„¢ÃŽÅ¸, ÃŽâ€˜ÃŽÂ ÃŽÅ¸ÃŽâ€ÃŽâ€¢ÃŽâ„¢ÃŽÅ¾ÃŽâ€”) in email attachments
- **Government Notifications**: Recognize AADE, EFKA, and municipal communications
- **Bank Statements**: Process statements from all major Greek banks
- **Tax Documents**: Detect tax-related emails and forms
- **Client Communications**: Categorize business correspondence and payment requests
- **Receipt Processing**: Identify expense receipts and business documentation

### 2. Email Provider Integration
- **Gmail Business Accounts**: Full integration with Google Workspace and personal Gmail
- **Outlook/Exchange**: Microsoft business email integration
- **Yahoo Business**: Yahoo business email support
- **Custom IMAP/POP3**: Support for Greek business email providers
- **Multi-Account Support**: Handle multiple email accounts simultaneously
- **Real-time Monitoring**: Continuous inbox monitoring with configurable intervals

### 3. Greek Language Processing
- **Greek Text Recognition**: Native Greek language email content analysis
- **Mixed Language Support**: Handle Greek-English business communications
- **Greek Date Formats**: Recognize Greek date patterns (dd/MM/yyyy)
- **Currency Detection**: Greek Euro formatting (Ã¢â€šÂ¬1.234,56)
- **Address Parsing**: Greek address format recognition
- **VAT Number Detection**: Identify Greek VAT numbers (EL123456789) in emails

### 4. Automated Processing Workflows
- **Document Extraction**: Automatic attachment download and processing
- **Smart Forwarding**: Route emails to appropriate processing pipelines
- **Client Notification**: Automated responses in Greek for document receipt
- **Priority Escalation**: Flag urgent emails (overdue payments, government notices)
- **Calendar Integration**: Create calendar events for payment due dates and deadlines
- **Task Creation**: Generate accounting tasks from email content

## Implementation Guidelines

### Email Monitoring Architecture

#### Gmail Integration
```yaml
Gmail_API_Configuration:
  oauth_scopes:
    - "https://www.googleapis.com/auth/gmail.readonly"
    - "https://www.googleapis.com/auth/gmail.send"
    - "https://www.googleapis.com/auth/gmail.modify"
  
  monitoring_labels:
    - "INBOX"
    - "UNREAD"
    - "IMPORTANT"
    - custom_labels: ["Accounting", "Tax", "Invoices"]
  
  search_queries:
    invoices: "subject:(Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ OR invoice OR ÃŽÂ±Ãâ‚¬ÃŽÂ¿ÃŽÂ´ÃŽÂµÃŽÂ¹ÃŽÂ¾ÃŽÂ· OR receipt)"
    tax_documents: "from:aade.gr OR from:efka.gov.gr OR subject:Ãâ€ Ãâ‚¬ÃŽÂ±"
    bank_statements: "from:alphabank.gr OR from:nbg.gr OR from:eurobank.gr OR from:piraeusbank.gr"
    client_payments: "subject:(Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ® OR payment OR ÃŽÂ¿Ãâ€ ÃŽÂµÃŽÂ¹ÃŽÂ»ÃŽÂ® OR due)"
```

#### Outlook/Exchange Integration
```yaml
Outlook_API_Configuration:
  microsoft_graph_scopes:
    - "https://graph.microsoft.com/Mail.Read"
    - "https://graph.microsoft.com/Mail.Send"
    - "https://graph.microsoft.com/Mail.ReadWrite"
  
  folder_monitoring:
    - "Inbox"
    - "Accounting"
    - "Tax Documents" 
    - "Bank Statements"
  
  advanced_queries:
    greek_invoices: "subject:Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ OR attachmentNames:invoice"
    government_mail: "from:gov.gr OR from:aade.gr"
    banking: "from:bank OR from:Ãâ€žÃÂÃŽÂ¬Ãâ‚¬ÃŽÂµÃŽÂ¶ÃŽÂ±"
```

### Document Classification Engine

#### Greek Document Types
```yaml
Document_Classification:
  invoices:
    greek_keywords: ["Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿", "ÃŽÂ±Ãâ‚¬ÃŽÂ¿ÃŽÂ´ÃŽÂµÃŽÂ¹ÃŽÂ¾ÃŽÂ·", "Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃÆ’Ãâ€žÃŽÂ±Ãâ€žÃŽÂ¹ÃŽÂºÃÅ’", "invoice"]
    file_patterns: ["*.pdf", "*.xml", "*.doc*"]
    confidence_thresholds:
      high: 0.95  # Clear invoice format
      medium: 0.80  # Probable invoice
      low: 0.60   # Possible invoice
    
  tax_documents:
    aade_keywords: ["Ãâ€ Ãâ‚¬ÃŽÂ±", "Ãâ€ ÃÅ’ÃÂÃŽÂ¿Ãâ€š", "ÃŽÂ´ÃŽÂ®ÃŽÂ»Ãâ€°ÃÆ’ÃŽÂ·", "ÃŽÂµÃŽÂºÃŽÂºÃŽÂ±ÃŽÂ¸ÃŽÂ±ÃÂÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ¹ÃŽÂºÃÅ’"]
    sender_patterns: ["*@aade.gr", "*@taxisnet.gr"]
    subject_patterns: ["*ÃŽÂ¦ÃŽÂ ÃŽâ€˜*", "*TAX*", "*ENFIA*"]
    
  bank_statements:
    greek_banks: ["Alpha Bank", "ÃŽâ€¢ÃŽÂ¸ÃŽÂ½ÃŽÂ¹ÃŽÂºÃŽÂ® ÃŽÂ¤ÃÂÃŽÂ¬Ãâ‚¬ÃŽÂµÃŽÂ¶ÃŽÂ±", "Eurobank", "ÃŽÂ¤ÃÂÃŽÂ¬Ãâ‚¬ÃŽÂµÃŽÂ¶ÃŽÂ± ÃŽÂ ÃŽÂµÃŽÂ¹ÃÂÃŽÂ±ÃŽÂ¹ÃÅ½Ãâ€š"]
    keywords: ["ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ· ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ±ÃÂÃŽÂ¹ÃŽÂ±ÃÆ’ÃŽÂ¼ÃŽÂ¿ÃÂ", "statement", "ÃŽÂ±ÃŽÂ½Ãâ€žÃŽÂ¯ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ¿", "Ãâ€¦Ãâ‚¬ÃÅ’ÃŽÂ»ÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¿"]
    formats: ["pdf", "csv", "xls", "xlsx"]
    
  receipts:
    keywords: ["ÃŽÂ±Ãâ‚¬ÃŽÂ¿ÃŽÂ´ÃŽÂµÃŽÂ¹ÃŽÂ¾ÃŽÂ·", "Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃÆ’Ãâ€žÃŽÂ±Ãâ€žÃŽÂ¹ÃŽÂºÃÅ’", "Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ ÃŽÂ»ÃŽÂ¹ÃŽÂ±ÃŽÂ½ÃŽÂ¹ÃŽÂºÃŽÂ®Ãâ€š", "receipt"]
    amount_patterns: ["Ã¢â€šÂ¬\\d+[.,]\\d+", "\\d+[.,]\\d+\\s*Ã¢â€šÂ¬", "\\d+[.,]\\d+\\s*EUR"]
    vat_patterns: ["ÃŽÂ¦ÃŽÂ ÃŽâ€˜ \\d+%", "VAT \\d+%"]
    
  client_communications:
    payment_keywords: ["Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ®", "ÃŽÂ¿Ãâ€ ÃŽÂµÃŽÂ¹ÃŽÂ»ÃŽÂ®", "ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ±ÃÂÃŽÂ¹ÃŽÂ±ÃÆ’ÃŽÂ¼ÃÅ’Ãâ€š", "Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ·ÃÆ’ÃŽÂ·"]
    request_keywords: ["Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃÅ½", "ÃŽÂ±ÃŽÂ¯Ãâ€žÃŽÂ·ÃŽÂ¼ÃŽÂ±", "Ãâ€¡ÃÂÃŽÂµÃŽÂ¹ÃŽÂ¬ÃŽÂ¶ÃŽÂ¿ÃŽÂ¼ÃŽÂ±ÃŽÂ¹", "ÃÆ’Ãâ€žÃŽÂµÃŽÂ¯ÃŽÂ»Ãâ€žÃŽÂµ"]
    urgent_keywords: ["ÃŽÂµÃâ‚¬ÃŽÂµÃŽÂ¯ÃŽÂ³ÃŽÂ¿ÃŽÂ½", "urgent", "ÃŽÂ¬ÃŽÂ¼ÃŽÂµÃÆ’ÃŽÂ±", "Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±"]
```

#### Intelligent Content Analysis
```yaml
Content_Analysis_Rules:
  priority_detection:
    high_priority:
      - government_communications: "Emails from AADE, EFKA, municipalities"
      - payment_due: "Overdue payment notices"
      - audit_requests: "Tax audit or compliance requests"
      - system_outages: "TAXIS, myDATA system announcements"
      
    medium_priority:
      - new_invoices: "Incoming invoices from suppliers"
      - bank_notifications: "Bank statement availability"
      - client_requests: "Client document requests"
      - deadline_reminders: "Tax or compliance deadline notices"
      
    low_priority:
      - newsletters: "Professional service newsletters"
      - marketing: "Software or service promotions"
      - routine_confirmations: "Standard transaction confirmations"
  
  automated_actions:
    high_priority_actions:
      - immediate_notification: "SMS + email alert"
      - create_calendar_event: "Add deadline to calendar"
      - create_task: "Generate action item in task management"
      - escalate_to_human: "Flag for immediate attention"
      
    medium_priority_actions:
      - extract_attachments: "Download and process documents"
      - forward_to_processing: "Send to document processing pipeline"
      - send_confirmation: "Automated receipt confirmation in Greek"
      - update_client_records: "Log communication in client file"
      
    low_priority_actions:
      - archive_appropriately: "File in correct folder"
      - update_newsletter_tracking: "Mark as read, file for reference"
```

### Greek Language Processing Engine

#### Language Detection & Parsing
```yaml
Greek_Language_Support:
  text_processing:
    encoding: "UTF-8"
    character_sets: ["ISO-8859-7", "Windows-1253", "UTF-8"]
    
  date_recognition:
    greek_months: ["ÃŽâ„¢ÃŽÂ±ÃŽÂ½ÃŽÂ¿Ãâ€¦ÃŽÂ¬ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÂ¦ÃŽÂµÃŽÂ²ÃÂÃŽÂ¿Ãâ€¦ÃŽÂ¬ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÅ“ÃŽÂ¬ÃÂÃâ€žÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽâ€˜Ãâ‚¬ÃÂÃŽÂ¯ÃŽÂ»ÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÅ“ÃŽÂ¬ÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽâ„¢ÃŽÂ¿ÃÂÃŽÂ½ÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽâ„¢ÃŽÂ¿ÃÂÃŽÂ»ÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽâ€˜ÃÂÃŽÂ³ÃŽÂ¿Ãâ€¦ÃÆ’Ãâ€žÃŽÂ¿Ãâ€š", "ÃŽÂ£ÃŽÂµÃâ‚¬Ãâ€žÃŽÂ­ÃŽÂ¼ÃŽÂ²ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÅ¸ÃŽÂºÃâ€žÃÅ½ÃŽÂ²ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÂÃŽÂ¿ÃŽÂ­ÃŽÂ¼ÃŽÂ²ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽâ€ÃŽÂµÃŽÂºÃŽÂ­ÃŽÂ¼ÃŽÂ²ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š"]
    date_patterns: ["dd/MM/yyyy", "dd-MM-yyyy", "dd.MM.yyyy", "dd ÃŽÅ“ÃŽÂ¼ÃŽÂ¼ÃŽÂ¼ yyyy"]
    
  currency_recognition:
    euro_patterns: ["Ã¢â€šÂ¬\\d+[.,]\\d+", "\\d+[.,]\\d+\\s*Ã¢â€šÂ¬", "\\d+[.,]\\d+\\s*EUR", "\\d+[.,]\\d+\\s*ÃŽÂµÃâ€¦ÃÂÃÅ½"]
    greek_numerals: Support for Greek number formatting (1.234,56)
    
  vat_number_detection:
    greek_pattern: "EL\\d{9}"
    validation: "Check digit validation for Greek VAT numbers"
    
  address_parsing:
    greek_patterns: "Street number, area, postal code, city format"
    common_abbreviations: ["ÃŽâ€ºÃŽÂµÃâ€°Ãâ€ .", "ÃŽÅ¸ÃŽÂ´ÃÅ’Ãâ€š", "ÃŽÂ ÃŽÂ»ÃŽÂ±Ãâ€žÃŽÂµÃŽÂ¯ÃŽÂ±", "ÃŽÂ¤.ÃŽÅ¡."]
    
  business_terminology:
    accounting_terms: ["ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ®ÃÂÃŽÂ¹ÃŽÂ¿", "Ãâ€ ÃŽÂ¿ÃÂÃŽÂ¿Ãâ€žÃŽÂµÃâ€¡ÃŽÂ½ÃŽÂ¹ÃŽÂºÃÅ’Ãâ€š", "ÃŽÂ¦ÃŽÂ ÃŽâ€˜", "ÃŽâ€¢ÃŽÂÃŽÂ¦ÃŽâ„¢ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¦ÃŽÅ¡ÃŽâ€˜"]
    legal_entities: ["ÃŽâ€˜.ÃŽâ€¢.", "ÃŽâ€¢.ÃŽÂ .ÃŽâ€¢.", "ÃŽÅ¸.ÃŽâ€¢.", "ÃŽâ€¢.ÃŽâ€¢.", "ÃŽâ„¢.ÃŽÅ¡.ÃŽâ€¢."]
```

#### Greek Email Templates
```yaml
Automated_Response_Templates:
  invoice_received:
    subject: "ÃŽâ€¢Ãâ‚¬ÃŽÂ¹ÃŽÂ²ÃŽÂµÃŽÂ²ÃŽÂ±ÃŽÂ¯Ãâ€°ÃÆ’ÃŽÂ· Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂ»ÃŽÂ±ÃŽÂ²ÃŽÂ®Ãâ€š Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¯ÃŽÂ¿Ãâ€¦ - {invoice_number}"
    body: |
      ÃŽâ€˜ÃŽÂ³ÃŽÂ±Ãâ‚¬ÃŽÂ·Ãâ€žÃŽÂ­/ÃŽÂ® {sender_name},
      
      ÃŽâ€¢Ãâ‚¬ÃŽÂ¹ÃŽÂ²ÃŽÂµÃŽÂ²ÃŽÂ±ÃŽÂ¹ÃÅ½ÃŽÂ½ÃŽÂ¿Ãâ€¦ÃŽÂ¼ÃŽÂµ Ãâ€žÃŽÂ·ÃŽÂ½ Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂ»ÃŽÂ±ÃŽÂ²ÃŽÂ® Ãâ€žÃŽÂ¿Ãâ€¦ Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¯ÃŽÂ¿Ãâ€¦ {invoice_number} 
      ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃŽÂ¿ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¯ÃŽÂ±Ãâ€š {invoice_date} ÃÆ’Ãâ€¦ÃŽÂ½ÃŽÂ¿ÃŽÂ»ÃŽÂ¹ÃŽÂºÃŽÂ®Ãâ€š ÃŽÂ±ÃŽÂ¾ÃŽÂ¯ÃŽÂ±Ãâ€š {total_amount}.
      
      ÃŽÂ¤ÃŽÂ¿ Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ ÃŽÂ­Ãâ€¡ÃŽÂµÃŽÂ¹ Ãâ‚¬ÃÂÃŽÂ¿Ãâ€°ÃŽÂ¸ÃŽÂ·ÃŽÂ¸ÃŽÂµÃŽÂ¯ ÃÆ’Ãâ€žÃŽÂ¿ ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ®ÃÂÃŽÂ¹ÃÅ’ ÃŽÂ¼ÃŽÂ±Ãâ€š ÃŽÂ³ÃŽÂ¹ÃŽÂ± ÃŽÂµÃâ‚¬ÃŽÂµÃŽÂ¾ÃŽÂµÃÂÃŽÂ³ÃŽÂ±ÃÆ’ÃŽÂ¯ÃŽÂ±.
      ÃŽâ€” Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ® ÃŽÂ¸ÃŽÂ± Ãâ‚¬ÃÂÃŽÂ±ÃŽÂ³ÃŽÂ¼ÃŽÂ±Ãâ€žÃŽÂ¿Ãâ‚¬ÃŽÂ¿ÃŽÂ¹ÃŽÂ·ÃŽÂ¸ÃŽÂµÃŽÂ¯ ÃŽÂµÃŽÂ½Ãâ€žÃÅ’Ãâ€š {payment_terms}.
      
      ÃŽÅ“ÃŽÂµ ÃŽÂµÃŽÂºÃâ€žÃŽÂ¯ÃŽÂ¼ÃŽÂ·ÃÆ’ÃŽÂ·,
      {company_name}
      
  document_request:
    subject: "ÃŽâ€˜ÃŽÂ¯Ãâ€žÃŽÂ·ÃŽÂ¼ÃŽÂ± ÃŽÂ³ÃŽÂ¹ÃŽÂ± Ãâ‚¬ÃÂÃÅ’ÃÆ’ÃŽÂ¸ÃŽÂµÃâ€žÃŽÂ± ÃŽÂ­ÃŽÂ³ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ± - {reference_number}"
    body: |
      ÃŽâ€˜ÃŽÂ³ÃŽÂ±Ãâ‚¬ÃŽÂ·Ãâ€žÃŽÂ­/ÃŽÂ® {client_name},
      
      ÃŽâ€œÃŽÂ¹ÃŽÂ± Ãâ€žÃŽÂ·ÃŽÂ½ ÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂºÃŽÂ»ÃŽÂ®ÃÂÃâ€°ÃÆ’ÃŽÂ· Ãâ€žÃŽÂ·Ãâ€š ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ¹ÃŽÂºÃŽÂ®Ãâ€š ÃŽÂµÃâ‚¬ÃŽÂµÃŽÂ¾ÃŽÂµÃÂÃŽÂ³ÃŽÂ±ÃÆ’ÃŽÂ¯ÃŽÂ±Ãâ€š, Ãâ€¡ÃÂÃŽÂµÃŽÂ¹ÃŽÂ±ÃŽÂ¶ÃÅ’ÃŽÂ¼ÃŽÂ±ÃÆ’Ãâ€žÃŽÂµ 
      Ãâ€žÃŽÂ± ÃŽÂ±ÃŽÂºÃÅ’ÃŽÂ»ÃŽÂ¿Ãâ€¦ÃŽÂ¸ÃŽÂ± ÃŽÂ­ÃŽÂ³ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ±:
      
      {required_documents}
      
      ÃŽÂ ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµ ÃÆ’Ãâ€žÃŽÂµÃŽÂ¯ÃŽÂ»Ãâ€žÃŽÂµ Ãâ€žÃŽÂ± ÃŽÂ­ÃŽÂ³ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ± Ãâ€žÃŽÂ¿ ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂ¿ÃŽÂ¼ÃÅ’Ãâ€žÃŽÂµÃÂÃŽÂ¿ ÃŽÂ´Ãâ€¦ÃŽÂ½ÃŽÂ±Ãâ€žÃÅ’.
      
      ÃŽâ€¢Ãâ€¦Ãâ€¡ÃŽÂ±ÃÂÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµ,
      {accountant_name}
      
  payment_reminder:
    subject: "ÃŽÂ¥Ãâ‚¬ÃŽÂµÃŽÂ½ÃŽÂ¸ÃÂÃŽÂ¼ÃŽÂ¹ÃÆ’ÃŽÂ· Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ®Ãâ€š - {invoice_number}"
    body: |
      ÃŽâ€˜ÃŽÂ³ÃŽÂ±Ãâ‚¬ÃŽÂ·Ãâ€žÃŽÂ­/ÃŽÂ® {client_name},
      
      ÃŽÂ£ÃŽÂ±Ãâ€š Ãâ€¦Ãâ‚¬ÃŽÂµÃŽÂ½ÃŽÂ¸Ãâ€¦ÃŽÂ¼ÃŽÂ¯ÃŽÂ¶ÃŽÂ¿Ãâ€¦ÃŽÂ¼ÃŽÂµ ÃÅ’Ãâ€žÃŽÂ¹ Ãâ€žÃŽÂ¿ Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ {invoice_number} 
      ÃŽÂ±ÃŽÂ¾ÃŽÂ¯ÃŽÂ±Ãâ€š {amount} ÃŽÂµÃŽÂ¯Ãâ€¡ÃŽÂµ ÃŽÂ»ÃŽÂ®ÃŽÂ¾ÃŽÂµÃŽÂ¹ Ãâ€žÃŽÂ·ÃŽÂ½ {due_date}.
      
      ÃŽÂ ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµ Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ²ÃŽÂµÃŽÂ¯Ãâ€žÃŽÂµ ÃÆ’Ãâ€žÃŽÂ·ÃŽÂ½ Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ® Ãâ€žÃŽÂ¿ ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂ¿ÃŽÂ¼ÃÅ’Ãâ€žÃŽÂµÃÂÃŽÂ¿ ÃŽÂ´Ãâ€¦ÃŽÂ½ÃŽÂ±Ãâ€žÃÅ’.
      
      ÃŽâ€œÃŽÂ¹ÃŽÂ± ÃŽÂ¿Ãâ‚¬ÃŽÂ¿ÃŽÂ¹ÃŽÂ±ÃŽÂ´ÃŽÂ®Ãâ‚¬ÃŽÂ¿Ãâ€žÃŽÂµ ÃŽÂ´ÃŽÂ¹ÃŽÂµÃâ€¦ÃŽÂºÃÂÃŽÂ¯ÃŽÂ½ÃŽÂ¹ÃÆ’ÃŽÂ·, ÃŽÂµÃâ‚¬ÃŽÂ¹ÃŽÂºÃŽÂ¿ÃŽÂ¹ÃŽÂ½Ãâ€°ÃŽÂ½ÃŽÂ®ÃÆ’Ãâ€žÃŽÂµ ÃŽÂ¼ÃŽÂ±ÃŽÂ¶ÃŽÂ¯ ÃŽÂ¼ÃŽÂ±Ãâ€š.
      
      ÃŽÅ“ÃŽÂµ ÃŽÂµÃŽÂºÃâ€žÃŽÂ¯ÃŽÂ¼ÃŽÂ·ÃÆ’ÃŽÂ·,
      {company_name}
```

## Workflow Templates

### Daily Email Processing Routine

#### Morning Email Scan (8:00 AM Greece Time)
```bash
#!/bin/bash
# Morning email processing workflow

# Check all configured email accounts
openclaw email scan all-accounts --since "24 hours ago"

# Process government emails first (highest priority)
openclaw email process --filter "government" --priority high

# Process banking notifications
openclaw email process --filter "banking" --auto-download-statements

# Process client invoices and payments
openclaw email process --filter "invoices" --auto-extract-data

# Process client communications
openclaw email process --filter "client-communications" --auto-respond

# Generate morning email summary
openclaw email summary daily --include-urgent --include-actions-needed
```

#### Continuous Monitoring (Every 15 minutes)
```bash
#!/bin/bash
# Real-time email monitoring

# Quick scan for urgent emails
openclaw email scan --filter "urgent" --real-time

# Process AADE/EFKA notifications immediately
openclaw email process --filter "government" --immediate-alert

# Handle client payment confirmations
openclaw email process --filter "payments" --update-accounting-system

# Auto-respond to routine requests
openclaw email auto-respond --filter "routine" --use-greek-templates
```

#### End of Day Processing (6:00 PM Greece Time)
```bash
#!/bin/bash
# End of day email processing

# Process any remaining unread emails
openclaw email process --filter "unread" --batch-process

# Generate daily email report
openclaw email report daily --include-statistics --include-pending

# Archive processed emails appropriately
openclaw email archive --processed-today --by-category

# Prepare tomorrow's email agenda
openclaw email agenda tomorrow --include-expected --include-deadlines
```

### Integration Workflows

#### AADE Email Integration
```yaml
AADE_Email_Processing:
  sender_domains:
    - "@aade.gr"
    - "@taxisnet.gr"
    - "@mydata.aade.gr"
    
  automatic_actions:
    tax_deadline_changes:
      - extract_new_deadline: "Parse email content for deadline changes"
      - update_calendar: "Update compliance calendar immediately"
      - alert_clients: "Notify affected clients of deadline changes"
      - log_compliance: "Record change in compliance tracking system"
      
    system_maintenance_notices:
      - extract_maintenance_window: "Parse maintenance dates and times"
      - alert_users: "Notify users of planned system outages"
      - reschedule_activities: "Move planned TAXIS submissions if needed"
      
    audit_notifications:
      - high_priority_alert: "Immediate SMS and email notification"
      - create_urgent_task: "Generate audit response task"
      - gather_documents: "Prepare standard audit documentation"
      - legal_consultation: "Flag for legal review if needed"
```

#### Bank Email Integration
```yaml
Greek_Bank_Email_Processing:
  supported_banks:
    alpha_bank:
      domains: ["@alphabank.gr", "@alpha.gr"]
      statement_patterns: ["statement", "ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ· ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ±ÃÂÃŽÂ¹ÃŽÂ±ÃÆ’ÃŽÂ¼ÃŽÂ¿ÃÂ"]
      
    national_bank:
      domains: ["@nbg.gr", "@ethnikibank.gr"]
      statement_patterns: ["ÃŽÂ±ÃŽÂ½Ãâ€žÃŽÂ¯ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ¿ ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ·Ãâ€š", "account statement"]
      
    eurobank:
      domains: ["@eurobank.gr"]
      statement_patterns: ["ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ· ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ±ÃÂÃŽÂ¹ÃŽÂ±ÃÆ’ÃŽÂ¼ÃŽÂ¿ÃÂ", "ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ±ÃÂÃŽÂ¹ÃŽÂ±ÃÆ’ÃŽÂ¼ÃÅ’Ãâ€š ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ·Ãâ€š"]
      
    piraeus_bank:
      domains: ["@piraeusbank.gr", "@winbank.gr"]
      statement_patterns: ["statement", "ÃŽÂºÃŽÂ¯ÃŽÂ½ÃŽÂ·ÃÆ’ÃŽÂ·", "Ãâ€¦Ãâ‚¬ÃÅ’ÃŽÂ»ÃŽÂ¿ÃŽÂ¹Ãâ‚¬ÃŽÂ¿"]
      
  processing_workflow:
    statement_detection:
      - verify_sender: "Confirm email is from legitimate bank domain"
      - extract_attachments: "Download PDF/CSV statement files"
      - parse_account_info: "Extract account numbers and dates"
      - integrate_accounting: "Forward to bank reconciliation system"
      
    payment_confirmations:
      - match_transactions: "Match with pending payment records"
      - update_client_accounts: "Mark invoices as paid"
      - generate_receipts: "Create payment confirmation documents"
      
    fraud_detection:
      - verify_bank_signatures: "Check for legitimate bank formatting"
      - flag_suspicious: "Alert for unusual sender patterns"
      - security_validation: "Verify against known bank communication patterns"
```

## Advanced Features

### Client Communication Automation

#### Intelligent Auto-Response System
```yaml
Auto_Response_Logic:
  invoice_submissions:
    conditions:
      - "Email contains PDF attachment"
      - "Subject contains 'Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿' or 'invoice'"
      - "Sender is known client"
    actions:
      - send_confirmation: "Automated receipt confirmation in Greek"
      - extract_invoice_data: "Process invoice for accounting system"
      - create_payment_schedule: "Add to payment processing queue"
      
  document_requests:
    conditions:
      - "Email contains request for documents"
      - "Keywords: 'ÃÆ’Ãâ€žÃŽÂµÃŽÂ¯ÃŽÂ»Ãâ€žÃŽÂµ', 'Ãâ€¡ÃÂÃŽÂµÃŽÂ¹ÃŽÂ¬ÃŽÂ¶ÃŽÂ¿ÃŽÂ¼ÃŽÂ±ÃŽÂ¹', 'Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃÅ½'"
    actions:
      - acknowledge_request: "Confirm receipt of request"
      - generate_document_list: "List available documents"
      - schedule_follow_up: "Set reminder if documents not sent"
      
  payment_inquiries:
    conditions:
      - "Subject contains 'Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ®' or 'payment'"
      - "Client asking about payment status"
    actions:
      - check_payment_status: "Query accounting system"
      - send_status_update: "Provide current payment status"
      - attach_receipt: "Include payment confirmation if paid"
```

### Multi-Account Management

#### Account Configuration
```yaml
Multi_Account_Setup:
  primary_business_account:
    email: "accounting@company.gr"
    provider: "Gmail"
    processing_priority: "high"
    auto_responses: "enabled"
    
  client_communication_account:
    email: "info@company.gr"  
    provider: "Outlook"
    processing_priority: "medium"
    auto_responses: "enabled"
    
  government_notifications_account:
    email: "compliance@company.gr"
    provider: "Gmail"
    processing_priority: "critical"
    auto_responses: "disabled"
    
  bank_statements_account:
    email: "banking@company.gr"
    provider: "Yahoo"
    processing_priority: "high"
    auto_responses: "disabled"
    
Account_Synchronization:
  cross_account_deduplication: "Prevent duplicate processing"
  unified_reporting: "Single report covering all accounts"
  centralized_task_management: "Tasks from all accounts in one queue"
  global_contact_management: "Shared client database across accounts"
```

## Security & Privacy Features

### Data Protection
- **Email Encryption**: Support for encrypted email communication
- **Secure Attachment Handling**: Virus scanning and secure storage
- **Access Controls**: Role-based access to email processing functions
- **Audit Logging**: Complete trail of email processing activities
- **GDPR Compliance**: European privacy law compliance for email data

### Greek Business Privacy
- **Client Confidentiality**: Secure handling of client communications
- **Banking Security**: Special protection for bank statement processing
- **Government Communication Security**: Secure processing of official communications
- **Document Retention**: Greek legal requirements for email retention
- **Professional Privilege**: Respect for accountant-client privilege

## Performance Optimization

### Efficient Processing
```yaml
Performance_Settings:
  email_scanning:
    interval: "5 minutes for critical accounts"
    batch_size: "50 emails per batch"
    concurrent_processing: "3 accounts simultaneously"
    
  attachment_processing:
    size_limits: "50MB per attachment"
    format_support: ["pdf", "doc", "docx", "xls", "xlsx", "csv", "xml"]
    ocr_enabled: "For scanned documents"
    
  response_times:
    urgent_emails: "<30 seconds"
    government_emails: "<1 minute" 
    routine_processing: "<5 minutes"
    
  caching:
    sender_recognition: "Cache known senders for faster processing"
    template_responses: "Pre-compiled response templates"
    document_patterns: "Cache document recognition patterns"
```

## Integration Points

### OpenClaw Skills Integration
```bash
# Integration with other Greek accounting skills
openclaw email process --forward-to greek-compliance-aade
openclaw email process --forward-to accounting-workflows
openclaw email process --forward-to cli-deadline-monitor

# Integration with document processing
openclaw email extract-attachments --process-with deepread-skill
openclaw email invoices --process-with greek-vat-calculator

# Integration with client management
openclaw email client-communications --update-crm-system
openclaw email payments --update-accounting-ledger
```

### External System Integration
```yaml
Accounting_Software_Integration:
  quickbooks: "Direct API integration for invoice processing"
  xero: "Automated transaction import from email processing"
  sage: "Client communication logging integration"
  
Calendar_Integration:
  google_calendar: "Create events for payment due dates and deadlines"
  outlook_calendar: "Sync with business calendar systems"
  
Task_Management_Integration:
  asana: "Create accounting tasks from email requests"
  trello: "Client workflow management"
  slack: "Team notifications for urgent emails"
  
Banking_Integration:
  auto_reconciliation: "Match email notifications with bank transactions"
  payment_processing: "Trigger payments based on email approvals"
```

## Usage Examples

### Example 1: Invoice Processing
```bash
$ openclaw email process --filter "invoices" --account "accounting@company.gr"

Ã°Å¸â€œÂ§ EMAIL PROCESSING RESULTS:

New Invoices Processed (3):
Ã¢Å“â€¦ SUPPLIER A AE - Invoice #2026-0156 - Ã¢â€šÂ¬1,250.00
   Ã¢â€Å“Ã¢â€â‚¬ Status: VAT validated (24%)
   Ã¢â€Å“Ã¢â€â‚¬ Due Date: March 15, 2026 (26 days)  
   Ã¢â€Å“Ã¢â€â‚¬ Action: Forwarded to accounting system
   Ã¢â€â€Ã¢â€â‚¬ Response: Greek confirmation sent to supplier

Ã¢Å“â€¦ ÃŽÂ ÃŽÂ¡ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽËœÃŽâ€¢ÃŽÂ¥ÃŽÂ¤ÃŽâ€”ÃŽÂ£ B ÃŽâ€¢ÃŽÂ ÃŽâ€¢ - ÃŽÂ¤ÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ #456 - Ã¢â€šÂ¬850.00
   Ã¢â€Å“Ã¢â€â‚¬ Status: Greek invoice format recognized
   Ã¢â€Å“Ã¢â€â‚¬ VAT Rate: 13% (services)
   Ã¢â€Å“Ã¢â€â‚¬ Action: Added to payment queue
   Ã¢â€â€Ã¢â€â‚¬ Response: "ÃŽâ€¢Ãâ‚¬ÃŽÂ¹ÃŽÂ²ÃŽÂµÃŽÂ²ÃŽÂ±ÃŽÂ¯Ãâ€°ÃÆ’ÃŽÂ· Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂ»ÃŽÂ±ÃŽÂ²ÃŽÂ®Ãâ€š" sent

Ã¢Å¡Â Ã¯Â¸Â VENDOR C - Invoice unclear format - Ã¢â€šÂ¬2,100.00
   Ã¢â€Å“Ã¢â€â‚¬ Status: Manual review required
   Ã¢â€Å“Ã¢â€â‚¬ Issue: VAT calculation uncertain
   Ã¢â€Å“Ã¢â€â‚¬ Action: Flagged for accountant review
   Ã¢â€â€Ã¢â€â‚¬ Response: Acknowledgment sent, review requested

Summary: 3 invoices processed, 2 automated, 1 manual review needed
```

### Example 2: AADE Notification Processing
```bash
$ openclaw email process --filter "government" --priority critical

Ã°Å¸Ââ€ºÃ¯Â¸Â GOVERNMENT EMAIL PROCESSING:

AADE Notification Processed (1):
Ã°Å¸Å¡Â¨ CRITICAL: VAT Deadline Change Detected
   Ã¢â€Å“Ã¢â€â‚¬ From: notifications@aade.gr
   Ã¢â€Å“Ã¢â€â‚¬ Subject: "ÃŽâ€˜ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±Ãâ€š Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®Ãâ€š ÃŽÂ´ÃŽÂ®ÃŽÂ»Ãâ€°ÃÆ’ÃŽÂ·Ãâ€š ÃŽÂ¦ÃŽÂ ÃŽâ€˜"
   Ã¢â€Å“Ã¢â€â‚¬ Change: March VAT deadline moved from 25th to 20th
   Ã¢â€Å“Ã¢â€â‚¬ Impact: 5 days earlier than expected
   Ã¢â€Å“Ã¢â€â‚¬ Actions Taken:
   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬ Updated compliance calendar Ã¢Å“â€¦
   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬ Notified affected clients Ã¢Å“â€¦
   Ã¢â€â€š   Ã¢â€Å“Ã¢â€â‚¬ Rescheduled VAT preparation tasks Ã¢Å“â€¦
   Ã¢â€â€š   Ã¢â€â€Ã¢â€â‚¬ Created urgent alert for accounting team Ã¢Å“â€¦

EFKA System Notice (1):
Ã¢â€žÂ¹Ã¯Â¸Â Planned Maintenance Notification
   Ã¢â€Å“Ã¢â€â‚¬ From: support@efka.gov.gr
   Ã¢â€Å“Ã¢â€â‚¬ Maintenance Window: Feb 19, 02:00-06:00 EET
   Ã¢â€Å“Ã¢â€â‚¬ Impact: Social security submissions unavailable
   Ã¢â€Å“Ã¢â€â‚¬ Action: Rescheduled morning submissions to afternoon

Summary: Critical compliance changes processed and implemented
```

### Example 3: Client Communication Automation
```bash
$ openclaw email process --filter "client-communications" --auto-respond

Ã°Å¸â€˜Â¥ CLIENT COMMUNICATION PROCESSING:

Payment Status Inquiries (2):
Ã°Å¸â€œâ€¹ ÃŽÂ ÃŽâ€¢ÃŽâ€ºÃŽâ€˜ÃŽÂ¤ÃŽâ€”ÃŽÂ£ A ÃŽâ€˜ÃŽâ€¢ - Payment Status Request
   Ã¢â€Å“Ã¢â€â‚¬ Query: "ÃŽÂ ÃÅ’Ãâ€žÃŽÂµ ÃŽÂ¸ÃŽÂ± Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¸ÃŽÂµÃŽÂ¯ Ãâ€žÃŽÂ¿ Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃÅ’ ÃŽÂ¼ÃŽÂ±Ãâ€š #789?"
   Ã¢â€Å“Ã¢â€â‚¬ Status Check: Invoice paid Feb 15, 2026
   Ã¢â€Å“Ã¢â€â‚¬ Response: Greek status update with payment confirmation
   Ã¢â€â€Ã¢â€â‚¬ Attachment: Payment receipt included

Ã°Å¸â€œâ€¹ CLIENT B LTD - Overdue Payment Inquiry  
   Ã¢â€Å“Ã¢â€â‚¬ Query: "Why is payment delayed for invoice #456?"
   Ã¢â€Å“Ã¢â€â‚¬ Status Check: Payment scheduled for Feb 20, 2026
   Ã¢â€Å“Ã¢â€â‚¬ Response: Explanation of payment schedule + apology
   Ã¢â€â€Ã¢â€â‚¬ Follow-up: Added to priority payment list

Document Requests (1):
Ã°Å¸â€œâ€ž ÃŽâ€¢ÃŽÂ¤ÃŽâ€˜ÃŽâ„¢ÃŽÂ¡ÃŽâ€¢ÃŽâ„¢ÃŽâ€˜ ÃŽâ€œ ÃŽâ€¢ÃŽÂ ÃŽâ€¢ - Additional Documentation  
   Ã¢â€Å“Ã¢â€â‚¬ Request: "ÃŽÂ§ÃÂÃŽÂµÃŽÂ¹ÃŽÂ±ÃŽÂ¶ÃÅ’ÃŽÂ¼ÃŽÂ±ÃÆ’Ãâ€žÃŽÂµ ÃŽÂ±ÃŽÂ½Ãâ€žÃŽÂ¯ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂ¿ Ãâ€ ÃŽÂ¿ÃÂÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃŽÂºÃŽÂ®Ãâ€š ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃÅ’Ãâ€žÃŽÂ·Ãâ€žÃŽÂ±Ãâ€š"
   Ã¢â€Å“Ã¢â€â‚¬ Document: Tax compliance certificate generated
   Ã¢â€Å“Ã¢â€â‚¬ Response: Certificate attached with Greek cover letter
   Ã¢â€â€Ã¢â€â‚¬ Archive: Request logged in client file

Summary: 3 client communications processed, all with automated responses
```

## OpenClaw Integration Strategy

### Practical OpenClaw Email Processing
```bash
# File-based email processing â€” drop exported email files into incoming
openclaw email monitor-folder /data/incoming/ --greek-language
openclaw email process-attachments --extract-invoices --auto-classify
openclaw email generate-responses --templates-greek --auto-send false

# Email integration through file system
openclaw email scan-exports --source gmail-backup --process-new
openclaw email parse-greek-documents --invoices --government --banking
```

### File-Based Email Workflow (OpenClaw Compatible)
```yaml
Email_Processing_Workflow:
  # Step 1: Email Export (External to OpenClaw)
  email_export:
    method: "User exports emails/attachments to /data/incoming/"
    formats: [".eml", ".mbox", ".pst", ".msg", ".pdf", ".xlsx"]
    subfolders:
      invoices: "/data/incoming/invoices/"
      government: "/data/incoming/government/"
      statements: "/data/incoming/statements/"
      other: "/data/incoming/other/"
    
  # Step 2: OpenClaw Processing
  openclaw_processing:
    scan: "openclaw email scan-folder /data/incoming/"
    extract: "openclaw email extract-attachments --greek-docs"
    classify: "openclaw email classify-documents --business-types"
    
  # Step 3: Response Generation
  response_generation:
    templates: "openclaw email prepare-responses --greek-templates"
    review: "openclaw email review-drafts --manual-approval"
    output: "/data/processing/email-drafts/{YYYY-MM-DD}/{response-type}.txt"
```

### OpenClaw-Friendly Email Commands
```bash
# Document processing from incoming folder (after email export)
openclaw email extract-invoices --input-dir /data/incoming/invoices/
openclaw email process-statements --input-dir /data/incoming/statements/ --bank-format greek --auto-reconcile
openclaw email handle-government --input-dir /data/incoming/government/ --aade-notifications --priority urgent

# Greek language specific processing
openclaw email greek-classify --document-types --confidence-threshold 0.8
openclaw email greek-respond --template-library /data/system/templates/greek/
openclaw email greek-forward --accounting-system --include-metadata
```

### Integration with Other Skills
```bash
# Chain with other OpenClaw skills
openclaw email process-batch | openclaw accounting validate-invoices
openclaw email extract-data | openclaw greek-compliance calculate-vat
openclaw email government-alerts | openclaw deadline update-calendar
```

A successful Greek email processing system should achieve:
- Ã¢Å“â€¦ 95%+ accuracy in Greek document classification
- Ã¢Å“â€¦ <30 seconds response time for urgent government emails
- Ã¢Å“â€¦ 90%+ automation rate for routine client communications
- Ã¢Å“â€¦ Zero missed critical compliance notifications
- Ã¢Å“â€¦ Complete audit trail for all email processing
- Ã¢Å“â€¦ Integration with all major Greek email providers
- Ã¢Å“â€¦ Native Greek language support for all communications

Remember: This skill serves as the communication hub for Greek accounting automation, ensuring no important financial documents or government notifications are missed while maintaining professional Greek business communication standards.
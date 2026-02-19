---
name: aade-api-monitor
description: OpenClaw-optimized real-time monitoring of Greek AADE (Independent Authority for Public Revenue) systems, announcements, and regulatory changes. Uses file-based processing and intelligent document monitoring to track tax deadlines, rate changes, system status, and compliance updates. Designed for production OpenClaw deployment with robust error handling.
version: 1.0.0
author: openclaw-greek-accounting
tags: ["greek", "accounting", "aade", "government-monitoring", "api"]
metadata: {"openclaw": {"requires": {"bins": ["jq", "curl"], "env": ["OPENCLAW_DATA_DIR"]}}}
---

# AADE API Monitor

This skill provides comprehensive monitoring of AADE systems and announcements through OpenClaw's file processing capabilities, delivering real-time alerts for Greek tax compliance changes.

## Core Philosophy

- **File-First Processing**: Monitor and process government documents, not complex APIs
- **Reliable Operation**: Work offline with cached data when government sites unavailable
- **OpenClaw Native**: Built specifically for OpenClaw's strengths and limitations
- **Production Ready**: Error handling, logging, and recovery built-in from start
- **Greek Business Focus**: Professional alerts and reporting in Greek

## OpenClaw Commands

### Core AADE Monitoring Commands
```bash
# Primary monitoring operations
openclaw aade monitor --enable --government-sites --cache-updates
openclaw aade check-updates --since "24 hours" --urgent-only
openclaw aade download-announcements --date today --all-categories
openclaw aade scan-deadlines --compare-previous --alert-changes

# System status monitoring  
openclaw aade status-check --taxis --mydata --efka --report-outages
openclaw aade system-health --uptime-tracking --performance-metrics
openclaw aade maintenance-schedule --upcoming --impact-assessment

# Document processing
openclaw aade process-documents --input /data/incoming/government/ --extract-deadlines
openclaw aade classify-updates --tax-changes --deadline-changes --system-updates
openclaw aade generate-alerts --priority high --recipients accounting-team
```

### Deadline & Rate Change Monitoring
```bash
# Deadline monitoring
openclaw aade monitor-deadlines --vat --income-tax --enfia --social-security
openclaw aade deadline-changes --since yesterday --client-impact-analysis
openclaw aade calendar-update --sync-changes --notify-affected-clients

# Rate and regulation changes
openclaw aade monitor-rates --vat-rates --tax-brackets --social-security
openclaw aade regulation-tracker --new-circulars --law-changes --implementation-dates
openclaw aade impact-analysis --rate-changes --client-calculations --cost-impact
```

### Integration & Reporting Commands
```bash
# Integration with other skills
openclaw aade integrate --cli-deadline-monitor --email-processor --meta-skill
openclaw aade export-data --format json --destination /data/dashboard/state/
openclaw aade sync-calendar --google-calendar --outlook --greek-holidays

# Professional reporting
openclaw aade report-generate --daily --weekly --monthly --client-ready-greek
openclaw aade client-notifications --deadline-changes --rate-updates --professional-tone
openclaw aade compliance-dashboard --current-status --upcoming-deadlines --action-items
```

## OpenClaw File Processing Architecture

### File System Organization
```yaml
AADE_File_Structure:
  input_monitoring:                              # Raw government documents arrive here
    - /data/incoming/government/                 # All AADE/government downloads
    
  processing_workspace:                          # Ephemeral â€” cleared after pipeline
    - /data/processing/compliance/               # Classification and extraction workspace
    
  output_delivery:
    - /data/dashboard/state/current-alerts.json  # Active alerts for dashboard
    - /data/dashboard/state/deadline-tracker.json # Updated deadline calendar
    - /data/reports/compliance/                   # Professional compliance reports
    - /data/exports/compliance-calendar.ics       # Calendar integration export
```

### Document Processing Pipeline
```yaml
Processing_Workflow:
  step_1_download:
    command: "openclaw aade download-batch --sources all --format pdf,html,xml"
    input: "Government website monitoring"
    output: "/data/incoming/government/{YYYYMMDD}/"
    
  step_2_extract:
    command: "openclaw aade extract-content --use-deepread --greek-language"
    input: "/data/incoming/government/"
    output: "/data/processing/compliance/"
    
  step_3_classify:
    command: "openclaw aade classify-importance --deadline-changes high --rate-changes high"
    input: "/data/processing/compliance/"
    output: "/data/processing/compliance/"
    
  step_4_compare:
    command: "openclaw aade detect-changes --compare-with-cache --highlight-differences"
    input: "/data/processing/compliance/"
    output: "/data/processing/compliance/"
    
  step_5_validate:
    command: "openclaw aade validate-data --cross-reference --accuracy-check"
    input: "/data/processing/compliance/"
    output: "/data/processing/compliance/"
    
  step_6_generate:
    command: "openclaw aade generate-outputs --alerts --reports --notifications"
    input: "/data/processing/compliance/"
    output: "/data/dashboard/state/ and /data/reports/compliance/"
```

## Intelligent Document Monitoring

### AADE Website Monitoring Strategy
```yaml
Government_Site_Monitoring:
  primary_sources:
    aade_main:
      url: "https://www.aade.gr"
      sections: ["announcements", "circulars", "deadlines", "rates"]
      frequency: "every_2_hours"
      
    taxis_updates:
      url: "https://www1.aade.gr/taxisnet"
      sections: ["system-announcements", "maintenance-schedules"]  
      frequency: "every_4_hours"
      
    mydata_status:
      url: "https://mydatapi.aade.gr"
      sections: ["api-status", "system-updates", "technical-announcements"]
      frequency: "hourly"
      
  backup_sources:
    press_releases:
      url: "https://www.aade.gr/deltia-typou"
      fallback: true
      
    legal_database:
      url: "https://www.aade.gr/nomothesia"
      frequency: "daily"
```

### Intelligent Change Detection
```yaml
Change_Detection_Logic:
  deadline_changes:
    triggers:
      - "Date changes in deadline tables"
      - "New deadline announcements"  
      - "Extension or acceleration notices"
    confidence_threshold: 0.95
    validation: "Cross-reference multiple sources"
    
  rate_changes:
    triggers:
      - "VAT rate modifications"
      - "Tax bracket adjustments"
      - "Social security rate updates"
    effective_date_tracking: "Extract implementation dates"
    impact_calculation: "Estimate client effects"
    
  system_updates:
    triggers:
      - "Maintenance announcements"
      - "New feature releases"
      - "System outage notifications"
    criticality_assessment: "Business impact analysis"
    workaround_suggestions: "Alternative procedures"
```

## OpenClaw-Native Processing Features

### Robust Error Handling
```bash
# Error recovery commands
openclaw aade retry-failed --batch-id {id} --fix-network-issues
openclaw aade fallback-mode --use-cached-data --offline-operation
openclaw aade manual-review --flagged-updates --require-human-verification

# Monitoring and diagnostics
openclaw aade health-check --test-all-sources --report-failures
openclaw aade diagnostics --connection-test --parsing-test --alert-test
openclaw aade logs --filter errors --last 48h --include-context
```

### Caching & Offline Operation
```yaml
Caching_Strategy:
  announcement_cache:
    retention: "90 days"
    update_frequency: "every_2_hours"
    fallback_behavior: "Use cached data if source unavailable"
    
  deadline_cache:
    retention: "1 year"
    critical_updates: "Force immediate refresh"
    validation: "Compare multiple sources for accuracy"
    
  system_status_cache:
    retention: "7 days" 
    real_time_updates: "When possible"
    offline_mode: "Report last known status with timestamp"
```

### Greek Language Processing
```yaml
Greek_Document_Processing:
  text_extraction:
    encoding: "UTF-8, Windows-1253, ISO-8859-7"
    ocr_support: "Greek character recognition via deepread"
    
  keyword_detection:
    deadline_terms: ["Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±", "ÃŽÂ»ÃŽÂ®ÃŽÂ¾ÃŽÂ·", "Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®", "deadline"]
    rate_terms: ["ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂµÃŽÂ»ÃŽÂµÃÆ’Ãâ€žÃŽÂ®Ãâ€š", "Ãâ‚¬ÃŽÂ¿ÃÆ’ÃŽÂ¿ÃÆ’Ãâ€žÃÅ’", "Ãâ€ ÃÅ’ÃÂÃŽÂ¿Ãâ€š", "rate", "tax"]  
    system_terms: ["ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂ®ÃÂÃŽÂ·ÃÆ’ÃŽÂ·", "ÃŽÂ´ÃŽÂ¹ÃŽÂ±ÃŽÂºÃŽÂ¿Ãâ‚¬ÃŽÂ®", "maintenance", "outage"]
    
  date_recognition:
    greek_formats: ["dd/MM/yyyy", "dd-MM-yyyy", "dd ÃŽÅ“ÃŽÂ¼ÃŽÂ¼ yyyy"]
    month_names: ["ÃŽâ„¢ÃŽÂ±ÃŽÂ½ÃŽÂ¿Ãâ€¦ÃŽÂ¬ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", "ÃŽÂ¦ÃŽÂµÃŽÂ²ÃÂÃŽÂ¿Ãâ€¦ÃŽÂ¬ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š", ..., "ÃŽâ€ÃŽÂµÃŽÂºÃŽÂ­ÃŽÂ¼ÃŽÂ²ÃÂÃŽÂ¹ÃŽÂ¿Ãâ€š"]
    business_day_calculation: "Exclude Greek holidays and weekends"
```

## Professional Alert System

### Alert Generation & Classification
```yaml
Alert_System:
  critical_alerts:
    deadline_changes:
      trigger: "Any tax deadline moved forward"
      delivery: "Immediate SMS + email + Slack"
      template: "ÃŽÅ¡ÃŽÂ¡ÃŽâ„¢ÃŽÂ£ÃŽâ„¢ÃŽÅ“ÃŽÅ¸: ÃŽÂ ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ± {tax_type} ÃŽÂ¼ÃŽÂµÃâ€žÃŽÂ±ÃŽÂºÃŽÂ¹ÃŽÂ½ÃŽÂ®ÃŽÂ¸ÃŽÂ·ÃŽÂºÃŽÂµ ÃÆ’Ãâ€žÃŽÂ¹Ãâ€š {new_date}"
      
    system_outages:
      trigger: "TAXIS or myDATA unavailable >30 minutes"
      delivery: "Immediate notification to accounting teams"
      template: "ÃŽâ€ÃŽâ„¢ÃŽâ€˜ÃŽÅ¡ÃŽÅ¸ÃŽÂ ÃŽâ€”: ÃŽÂ£ÃÂÃÆ’Ãâ€žÃŽÂ·ÃŽÂ¼ÃŽÂ± {system_name} ÃŽÂ¼ÃŽÂ· ÃŽÂ´ÃŽÂ¹ÃŽÂ±ÃŽÂ¸ÃŽÂ­ÃÆ’ÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ ÃŽÂ±Ãâ‚¬ÃÅ’ {outage_start}"
      
  important_alerts:
    rate_changes:
      trigger: "VAT or tax rate modifications"
      delivery: "Email + dashboard update"
      template: "ÃŽâ€˜ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂµÃŽÂ»ÃŽÂµÃÆ’Ãâ€žÃŽÂ®: {rate_type} ÃŽÂ±Ãâ‚¬ÃÅ’ {old_rate} ÃÆ’ÃŽÂµ {new_rate}"
      
    new_regulations:
      trigger: "New tax circulars or law changes"
      delivery: "Daily digest email"
      template: "ÃŽÂÃŽÂ­ÃŽÂ± ÃŽÂµÃŽÂ³ÃŽÂºÃÂÃŽÂºÃŽÂ»ÃŽÂ¹ÃŽÂ¿Ãâ€š: {circular_number} - {summary}"
      
  routine_alerts:
    system_maintenance:
      trigger: "Scheduled maintenance announcements" 
      delivery: "Weekly summary"
      template: "ÃŽÂ ÃÂÃŽÂ¿ÃŽÂ³ÃÂÃŽÂ±ÃŽÂ¼ÃŽÂ¼ÃŽÂ±Ãâ€žÃŽÂ¹ÃÆ’ÃŽÂ¼ÃŽÂ­ÃŽÂ½ÃŽÂ· ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂ®ÃÂÃŽÂ·ÃÆ’ÃŽÂ·: {system} Ãâ€žÃŽÂ·ÃŽÂ½ {date} {time}"
```

### Greek Professional Communication
```yaml
Professional_Templates:
  client_deadline_alert:
    subject: "ÃŽÂ£ÃŽÂ·ÃŽÂ¼ÃŽÂ±ÃŽÂ½Ãâ€žÃŽÂ¹ÃŽÂºÃŽÂ® ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂ­ÃÂÃâ€°ÃÆ’ÃŽÂ·: ÃŽâ€˜ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±Ãâ€š {tax_type}"
    body: |
      ÃŽâ€˜ÃŽÂ¾ÃŽÂ¹ÃÅ’Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ¹ Ãâ‚¬ÃŽÂµÃŽÂ»ÃŽÂ¬Ãâ€žÃŽÂµÃâ€š,
      
      ÃŽÂ£ÃŽÂ±Ãâ€š ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃÅ½ÃŽÂ½ÃŽÂ¿Ãâ€¦ÃŽÂ¼ÃŽÂµ ÃÅ’Ãâ€žÃŽÂ¹ ÃŽÂ· ÃŽâ€˜ÃŽâ€˜ÃŽâ€ÃŽâ€¢ ÃŽÂ±ÃŽÂ½ÃŽÂ±ÃŽÂºÃŽÂ¿ÃŽÂ¯ÃŽÂ½Ãâ€°ÃÆ’ÃŽÂµ ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® ÃÆ’Ãâ€žÃŽÂ·ÃŽÂ½ Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ± 
      Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®Ãâ€š {tax_description}.
      
      ÃŽÂÃŽÂ­ÃŽÂ± Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±: {new_deadline}
      ÃŽÂ ÃÂÃŽÂ¿ÃŽÂ·ÃŽÂ³ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµÃŽÂ½ÃŽÂ· Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±: {old_deadline}
      
      ÃŽÂ ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµ ÃŽÂµÃâ‚¬ÃŽÂ¹ÃŽÂºÃŽÂ¿ÃŽÂ¹ÃŽÂ½Ãâ€°ÃŽÂ½ÃŽÂ®ÃÆ’Ãâ€žÃŽÂµ ÃŽÂ¼ÃŽÂ±ÃŽÂ¶ÃŽÂ¯ ÃŽÂ¼ÃŽÂ±Ãâ€š ÃŽÂ³ÃŽÂ¹ÃŽÂ± ÃŽÂ¿Ãâ‚¬ÃŽÂ¿ÃŽÂ¹ÃŽÂ±ÃŽÂ´ÃŽÂ®Ãâ‚¬ÃŽÂ¿Ãâ€žÃŽÂµ ÃŽÂ´ÃŽÂ¹ÃŽÂµÃâ€¦ÃŽÂºÃÂÃŽÂ¯ÃŽÂ½ÃŽÂ¹ÃÆ’ÃŽÂ·.
      
      ÃŽÅ“ÃŽÂµ ÃŽÂµÃŽÂºÃâ€žÃŽÂ¯ÃŽÂ¼ÃŽÂ·ÃÆ’ÃŽÂ·,
      {accounting_firm_name}
      
  rate_change_notification:
    subject: "ÃŽâ€¢ÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂ­ÃÂÃâ€°ÃÆ’ÃŽÂ·: ÃŽâ€˜ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® Ãâ€ ÃŽÂ¿ÃÂÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃŽÂºÃŽÂ¿ÃÂ ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂµÃŽÂ»ÃŽÂµÃÆ’Ãâ€žÃŽÂ®"
    body: |
      ÃŽâ€˜ÃŽÂ³ÃŽÂ±Ãâ‚¬ÃŽÂ·Ãâ€žÃŽÂ¿ÃŽÂ¯ ÃÆ’Ãâ€¦ÃŽÂ½ÃŽÂµÃÂÃŽÂ³ÃŽÂ¬Ãâ€žÃŽÂµÃâ€š,
      
      ÃŽâ€˜Ãâ‚¬ÃÅ’ {effective_date} ÃŽÂ¹ÃÆ’Ãâ€¡ÃÂÃŽÂµÃŽÂ¹ ÃŽÂ½ÃŽÂ­ÃŽÂ¿Ãâ€š ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂµÃŽÂ»ÃŽÂµÃÆ’Ãâ€žÃŽÂ®Ãâ€š {tax_type}:
      - ÃŽÂÃŽÂ­ÃŽÂ¿Ãâ€š ÃÆ’Ãâ€¦ÃŽÂ½Ãâ€žÃŽÂµÃŽÂ»ÃŽÂµÃÆ’Ãâ€žÃŽÂ®Ãâ€š: {new_rate}%
      - ÃŽÂ ÃÂÃŽÂ¿ÃŽÂ·ÃŽÂ³ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµÃŽÂ½ÃŽÂ¿Ãâ€š: {old_rate}%
      
      ÃŽâ€” ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® ÃŽÂµÃâ‚¬ÃŽÂ·ÃÂÃŽÂµÃŽÂ¬ÃŽÂ¶ÃŽÂµÃŽÂ¹: {affected_transactions}
      
      ÃŽÂ¤ÃŽÂ¿ ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ¹ÃŽÂºÃÅ’ ÃŽÂ¼ÃŽÂ±Ãâ€š ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂµÃŽÂ¯ÃŽÂ¿ ÃŽÂ¸ÃŽÂ± ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃÅ½ÃÆ’ÃŽÂµÃŽÂ¹ ÃÅ’ÃŽÂ»ÃŽÂ¿Ãâ€¦Ãâ€š Ãâ€žÃŽÂ¿Ãâ€¦Ãâ€š Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’ÃŽÂ¼ÃŽÂ¿ÃÂÃâ€š.
      
      {firm_contact_info}
```

## Integration Workflows

### Meta-Skill Integration
```bash
# Integration with OpenClaw Greek Accounting Meta-Skill
openclaw aade register-with-meta --enable-orchestration
openclaw aade meta-commands --list-available --business-focused

# Meta-skill can now call:
# openclaw greek government-check  (calls aade-api-monitor internally)
# openclaw greek emergency-compliance  (uses aade alerts)
# openclaw greek status-dashboard  (includes aade system status)
```

### Other Skill Integration 
```yaml
Skill_Integration_Points:
  cli_deadline_monitor:
    data_exchange: "Share deadline change data"
    coordination: "Avoid duplicate monitoring"
    backup_relationship: "CLI monitor provides fallback data"
    
  greek_email_processor:
    alert_delivery: "Use email processor for client notifications"
    template_sharing: "Share Greek language templates"
    document_processing: "Process AADE emails received by clients"
    
  greek_compliance_aade:
    rate_updates: "Notify compliance skill of rate changes"
    calculation_updates: "Trigger recalculation when rates change"
    submission_timing: "Coordinate deadline changes with submissions"
```

## Production Monitoring & Maintenance

### Automated Health Monitoring
```bash
# Health check commands for production deployment
openclaw aade health-check --comprehensive --test-all-endpoints
openclaw aade performance-monitor --response-times --error-rates --uptime
openclaw aade data-validation --accuracy-check --cross-reference --anomaly-detection

# Maintenance and optimization
openclaw aade cache-optimize --cleanup-old --defragment --performance-tune
openclaw aade update-patterns --learn-new-formats --improve-accuracy
openclaw aade backup-data --critical-cache --configuration --logs
```

### Logging & Audit Trail
```yaml
Production_Logging:
  access_logs:
    file: "/logs/aade-monitor/access.log"
    retention: "6 months"
    includes: ["URLs accessed", "Response codes", "Response times"]
    
  change_detection_logs:
    file: "/logs/aade-monitor/changes.log" 
    retention: "2 years"
    includes: ["Detected changes", "Confidence scores", "Validation results"]
    
  alert_logs:
    file: "/logs/aade-monitor/alerts.log"
    retention: "1 year"
    includes: ["Alert generation", "Delivery methods", "User responses"]
    
  error_logs:
    file: "/logs/aade-monitor/errors.log"
    retention: "1 year"
    includes: ["Processing errors", "Network failures", "Recovery actions"]
```

## Advanced Features

### Machine Learning Enhancement
```yaml
ML_Capabilities:
  document_classification:
    training_data: "Historical AADE announcements with manual classifications"
    accuracy_target: ">95% for critical document identification"
    continuous_learning: "Update model based on manual corrections"
    
  change_impact_prediction:
    analysis: "Predict client impact based on historical patterns"
    risk_assessment: "Identify high-risk clients for proactive communication"
    resource_planning: "Estimate workload from detected changes"
    
  anomaly_detection:
    baseline_patterns: "Learn normal AADE announcement patterns"
    unusual_activity: "Flag potential system issues or major changes"
    false_positive_reduction: "Reduce unnecessary alerts through pattern learning"
```

### Compliance Dashboard Integration
```yaml
Dashboard_Features:
  real_time_status:
    aade_systems: "Live status of TAXIS, myDATA, EFKA systems"
    recent_changes: "Timeline of recent deadline and rate changes"
    alert_summary: "Critical, important, and routine alerts overview"
    
  client_impact_view:
    affected_clients: "Which clients affected by recent changes"
    action_required: "Immediate actions needed per client"
    communication_status: "Which clients have been notified"
    
  performance_metrics:
    monitoring_uptime: "AADE monitor system availability"
    detection_accuracy: "Change detection success rate"
    alert_effectiveness: "User response to generated alerts"
```

## Usage Examples

### Daily Operations
```bash
# Morning AADE check (part of daily routine)
$ openclaw aade morning-check --since yesterday

Ã°Å¸â€œÅ  AADE Morning Summary - February 18, 2026:

Ã°Å¸Ââ€ºÃ¯Â¸Â System Status:
Ã¢Å“â€¦ TAXIS Online (98.2% uptime last 24h)
Ã¢Å“â€¦ myDATA Online (99.1% uptime last 24h)  
Ã¢Å“â€¦ EFKA Portal Online (97.5% uptime last 24h)

Ã°Å¸â€œÂ¢ New Announcements (2):
Ã°Å¸â€œâ€¹ Circular POL.1157/2026 - VAT exemption clarification
Ã¢Å¡Â Ã¯Â¸Â System maintenance scheduled: February 20, 02:00-06:00 EET

Ã°Å¸â€â€ž Changes Detected: None
Ã°Å¸â€œâ€¦ Upcoming Deadlines: 3 VAT returns due in 7 days

Next check in 2 hours. Manual refresh: openclaw aade check-updates
```

### Change Detection Example
```bash
$ openclaw aade detect-changes --urgent --notify-immediately

Ã°Å¸Å¡Â¨ CRITICAL CHANGE DETECTED:

Ã°Å¸â€œâ€¦ Deadline Change Alert:
Tax Type: Monthly VAT Return (March 2026)
Old Deadline: April 25, 2026
New Deadline: April 20, 2026
Change: 5 days earlier
Impact: 47 clients affected

Ã°Å¸â€œâ€¹ Source Document:
AADE Announcement: ÃŽÂ ÃŽÅ¸ÃŽâ€º.1158/2026
Published: 2026-02-18 14:30 EET
Confidence: 98.5%

Ã¢Å“â€¦ Actions Taken:
- Updated compliance calendar
- Generated client notifications (47 emails prepared)
- Integrated with meta-skill workflow
- Logged change in audit trail

Ã°Å¸â€œÂ§ Client notifications ready for review:
openclaw aade review-notifications --batch-id 2026021801
```

### Professional Client Communication
```bash
$ openclaw aade generate-client-alert --deadline-change --professional-tone

Ã°Å¸â€œÂ§ Generated Greek Client Communication:

Subject: ÃŽâ€¢ÃŽÂ ÃŽâ€¢ÃŽâ„¢ÃŽâ€œÃŽÅ¸ÃŽÂ: ÃŽâ€˜ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ±Ãâ€š ÃŽÂ´ÃŽÂ®ÃŽÂ»Ãâ€°ÃÆ’ÃŽÂ·Ãâ€š ÃŽÂ¦ÃŽÂ ÃŽâ€˜ ÃŽÅ“ÃŽÂ±ÃÂÃâ€žÃŽÂ¯ÃŽÂ¿Ãâ€¦ 2026

ÃŽâ€˜ÃŽÂ¾ÃŽÂ¹ÃÅ’Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ¹ Ãâ‚¬ÃŽÂµÃŽÂ»ÃŽÂ¬Ãâ€žÃŽÂµÃâ€š,

ÃŽÂ£ÃŽÂ±Ãâ€š ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃÅ½ÃŽÂ½ÃŽÂ¿Ãâ€¦ÃŽÂ¼ÃŽÂµ ÃŽÂ¼ÃŽÂµ ÃŽÂ±Ãâ€ ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂ® Ãâ€žÃŽÂ·ÃŽÂ½ ÃŽÂ±ÃŽÂ½ÃŽÂ±ÃŽÂºÃŽÂ¿ÃŽÂ¯ÃŽÂ½Ãâ€°ÃÆ’ÃŽÂ· Ãâ€žÃŽÂ·Ãâ€š ÃŽâ€˜ÃŽâ€˜ÃŽâ€ÃŽâ€¢ (ÃŽÂ ÃŽÅ¸ÃŽâ€º.1158/2026) 
ÃÅ’Ãâ€žÃŽÂ¹ ÃŽÂ· Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¯ÃŽÂ± Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®Ãâ€š Ãâ€žÃŽÂ·Ãâ€š ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¹ÃŽÂ±ÃŽÂ¯ÃŽÂ±Ãâ€š ÃŽÂ´ÃŽÂ®ÃŽÂ»Ãâ€°ÃÆ’ÃŽÂ·Ãâ€š ÃŽÂ¦ÃŽÂ ÃŽâ€˜ ÃŽÂ³ÃŽÂ¹ÃŽÂ± Ãâ€žÃŽÂ¿ÃŽÂ½ ÃŽÅ“ÃŽÂ¬ÃÂÃâ€žÃŽÂ¹ÃŽÂ¿ 2026 
ÃŽÂ¼ÃŽÂµÃâ€žÃŽÂ±ÃŽÂºÃŽÂ¹ÃŽÂ½ÃŽÂµÃŽÂ¯Ãâ€žÃŽÂ±ÃŽÂ¹ ÃŽÂ±Ãâ‚¬ÃÅ’ Ãâ€žÃŽÂ¹Ãâ€š 25 ÃŽâ€˜Ãâ‚¬ÃÂÃŽÂ¹ÃŽÂ»ÃŽÂ¯ÃŽÂ¿Ãâ€¦ ÃÆ’Ãâ€žÃŽÂ¹Ãâ€š 20 ÃŽâ€˜Ãâ‚¬ÃÂÃŽÂ¹ÃŽÂ»ÃŽÂ¯ÃŽÂ¿Ãâ€¦ 2026.

ÃŽâ€” ÃŽÂ±ÃŽÂ»ÃŽÂ»ÃŽÂ±ÃŽÂ³ÃŽÂ® ÃŽÂµÃâ‚¬ÃŽÂ·ÃÂÃŽÂµÃŽÂ¬ÃŽÂ¶ÃŽÂµÃŽÂ¹ ÃÅ’ÃŽÂ»ÃŽÂµÃâ€š Ãâ€žÃŽÂ¹Ãâ€š ÃŽÂµÃâ‚¬ÃŽÂ¹Ãâ€¡ÃŽÂµÃŽÂ¹ÃÂÃŽÂ®ÃÆ’ÃŽÂµÃŽÂ¹Ãâ€š ÃŽÂ¼ÃŽÂµ Ãâ€¦Ãâ‚¬ÃŽÂ¿Ãâ€¡ÃÂÃŽÂ­Ãâ€°ÃÆ’ÃŽÂ· Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®Ãâ€š 
ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¹ÃŽÂ±ÃŽÂ¯ÃŽÂ±Ãâ€š ÃŽÂ´ÃŽÂ®ÃŽÂ»Ãâ€°ÃÆ’ÃŽÂ·Ãâ€š ÃŽÂ¦ÃŽÂ ÃŽâ€˜.

ÃŽÂ¤ÃŽÂ¿ ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¹ÃÆ’Ãâ€žÃŽÂ¹ÃŽÂºÃÅ’ ÃŽÂ¼ÃŽÂ±Ãâ€š ÃŽÂ³ÃÂÃŽÂ±Ãâ€ ÃŽÂµÃŽÂ¯ÃŽÂ¿ ÃŽÂ­Ãâ€¡ÃŽÂµÃŽÂ¹ ÃŽÂ®ÃŽÂ´ÃŽÂ· ÃŽÂµÃŽÂ½ÃŽÂ·ÃŽÂ¼ÃŽÂµÃÂÃÅ½ÃÆ’ÃŽÂµÃŽÂ¹ Ãâ€žÃŽÂ¿ ÃÆ’ÃÂÃÆ’Ãâ€žÃŽÂ·ÃŽÂ¼ÃŽÂ± Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃÂÃŽÂ¸ÃŽÂ·ÃÆ’ÃŽÂ·Ãâ€š 
Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂ¸ÃŽÂµÃÆ’ÃŽÂ¼ÃŽÂ¹ÃÅ½ÃŽÂ½ ÃŽÂºÃŽÂ±ÃŽÂ¹ ÃŽÂ¸ÃŽÂ± Ãâ€ ÃÂÃŽÂ¿ÃŽÂ½Ãâ€žÃŽÂ¯ÃÆ’ÃŽÂ¿Ãâ€¦ÃŽÂ¼ÃŽÂµ ÃŽÂ³ÃŽÂ¹ÃŽÂ± Ãâ€žÃŽÂ·ÃŽÂ½ ÃŽÂ­ÃŽÂ³ÃŽÂºÃŽÂ±ÃŽÂ¹ÃÂÃŽÂ· Ãâ‚¬ÃÂÃŽÂ¿ÃŽÂµÃâ€žÃŽÂ¿ÃŽÂ¹ÃŽÂ¼ÃŽÂ±ÃÆ’ÃŽÂ¯ÃŽÂ± ÃŽÂºÃŽÂ±ÃŽÂ¹ Ãâ€¦Ãâ‚¬ÃŽÂ¿ÃŽÂ²ÃŽÂ¿ÃŽÂ»ÃŽÂ®.

ÃŽâ€œÃŽÂ¹ÃŽÂ± ÃŽÂ¿Ãâ‚¬ÃŽÂ¿ÃŽÂ¹ÃŽÂ±ÃŽÂ´ÃŽÂ®Ãâ‚¬ÃŽÂ¿Ãâ€žÃŽÂµ ÃŽÂ´ÃŽÂ¹ÃŽÂµÃâ€¦ÃŽÂºÃÂÃŽÂ¯ÃŽÂ½ÃŽÂ¹ÃÆ’ÃŽÂ·, Ãâ‚¬ÃŽÂ±ÃÂÃŽÂ±ÃŽÂºÃŽÂ±ÃŽÂ»ÃŽÂ¿ÃÂÃŽÂ¼ÃŽÂµ ÃŽÂµÃâ‚¬ÃŽÂ¹ÃŽÂºÃŽÂ¿ÃŽÂ¹ÃŽÂ½Ãâ€°ÃŽÂ½ÃŽÂ®ÃÆ’Ãâ€žÃŽÂµ ÃŽÂ¼ÃŽÂ±ÃŽÂ¶ÃŽÂ¯ ÃŽÂ¼ÃŽÂ±Ãâ€š.

ÃŽÅ“ÃŽÂµ ÃŽÂµÃŽÂºÃâ€žÃŽÂ¯ÃŽÂ¼ÃŽÂ·ÃÆ’ÃŽÂ·,
[Accounting Firm Name]
Ã°Å¸â€œÂ§ Ready for sending to 47 affected clients
```

## Success Metrics

A successful AADE API Monitor should achieve:
- Ã¢Å“â€¦ 99%+ uptime monitoring of critical AADE systems
- Ã¢Å“â€¦ <5 minute detection time for critical deadline changes
- Ã¢Å“â€¦ 95%+ accuracy in document classification and change detection
- Ã¢Å“â€¦ Zero false positives for critical alerts
- Ã¢Å“â€¦ Complete integration with meta-skill orchestration
- Ã¢Å“â€¦ Professional Greek communication standards
- Ã¢Å“â€¦ Comprehensive audit trail for compliance purposes
- Ã¢Å“â€¦ Robust offline operation with cached data fallback

Remember: This skill is built OpenClaw-first, using file processing and practical automation rather than complex API integrations, making it reliable and maintainable for production Greek accounting environments.
---
name: greek-document-ocr
description: OpenClaw-optimized Greek language document OCR and text processing system. Enhances deepread with specialized Greek character recognition, handwritten Greek text processing, and Greek business document intelligence. Built for production Greek accounting workflows with high accuracy Greek text extraction and automated document categorization.
version: 1.0.0
author: openclaw-greek-accounting
tags: ["greek", "accounting", "ocr", "document-processing", "greek-language"]
metadata: {"openclaw": {"requires": {"bins": ["jq"], "env": ["OPENCLAW_DATA_DIR"]}}}
---

# Greek Document OCR

This skill provides advanced Greek language optical character recognition and document processing capabilities, specifically designed for Greek business documents, invoices, receipts, and handwritten materials commonly found in Greek accounting workflows.

## Core Philosophy

- **Greek Language Excellence**: Superior recognition of Greek characters, accents, and business terminology
- **OpenClaw Integration**: Built to enhance existing `deepread` skill with Greek-specific capabilities
- **Business Document Focus**: Optimized for invoices, receipts, contracts, and government forms
- **Production Accuracy**: High-precision text extraction suitable for automated accounting workflows
- **Handwritten Support**: Advanced recognition of handwritten Greek text and signatures

## OpenClaw Commands

### Core OCR Operations
```bash
# Primary Greek document processing
openclaw ocr process-greek --input-dir /data/ocr/incoming/scanned/ --enhance-greek-chars
openclaw ocr batch-process --greek-language --confidence-threshold 0.95 --auto-classify
openclaw ocr extract-invoices --greek-format --vat-detection --amount-parsing
openclaw ocr process-receipts --greek-business --expense-categorization

# Integration with existing deepread skill
openclaw ocr enhance-deepread --greek-language-pack --improve-accuracy
openclaw ocr greek-preprocessing --image-enhancement --character-optimization
openclaw ocr validate-extraction --greek-language --business-rules

# Specialized Greek document types
openclaw ocr process-handwritten --greek-cursive --signature-detection
openclaw ocr government-forms --aade-forms --efka-documents --municipal-papers
openclaw ocr process-contracts --greek-legal --clause-extraction --signature-verification
```

### Advanced Greek Text Processing
```bash
# Greek language enhancement and correction
openclaw ocr correct-greek --spell-check --accent-correction --business-terminology
openclaw ocr standardize-text --greek-formatting --currency-amounts --date-formats
openclaw ocr extract-entities --greek-names --addresses --vat-numbers --amounts

# Document intelligence and categorization
openclaw ocr classify-documents --greek-business-types --confidence-scoring
openclaw ocr extract-structured-data --invoices --receipts --contracts --forms
openclaw ocr generate-searchable-pdf --greek-text-layer --preserve-formatting
```

### Quality Control & Validation
```bash
# Accuracy monitoring and improvement
openclaw ocr accuracy-test --greek-documents --known-text-samples
openclaw ocr confidence-analysis --character-level --word-level --document-level
openclaw ocr manual-review --low-confidence --flagged-documents --greek-verification

# Integration and export
openclaw ocr export-accounting --quickbooks --xero --sage --greek-formats
openclaw ocr integrate-banking --match-bank-transactions --reference-extraction
openclaw ocr coordinate-compliance --vat-analysis --tax-document-processing
```

## Greek Language Processing Architecture

### Greek Character Recognition Enhancement
```yaml
Greek_Character_Optimization:
  alphabet_coverage:
    uppercase: "ÃŽâ€˜ÃŽâ€™ÃŽâ€œÃŽâ€ÃŽâ€¢ÃŽâ€“ÃŽâ€”ÃŽËœÃŽâ„¢ÃŽÅ¡ÃŽâ€ºÃŽÅ“ÃŽÂÃŽÅ¾ÃŽÅ¸ÃŽÂ ÃŽÂ¡ÃŽÂ£ÃŽÂ¤ÃŽÂ¥ÃŽÂ¦ÃŽÂ§ÃŽÂ¨ÃŽÂ©"
    lowercase: "ÃŽÂ±ÃŽÂ²ÃŽÂ³ÃŽÂ´ÃŽÂµÃŽÂ¶ÃŽÂ·ÃŽÂ¸ÃŽÂ¹ÃŽÂºÃŽÂ»ÃŽÂ¼ÃŽÂ½ÃŽÂ¾ÃŽÂ¿Ãâ‚¬ÃÂÃÆ’Ãâ€žÃâ€¦Ãâ€ Ãâ€¡ÃË†Ãâ€°"
    accented_characters: "ÃŽÂ¬ÃŽÂ­ÃŽÂ®ÃŽÂ¯ÃÅ’ÃÂÃÅ½ÃŽÂÃŽÂ°"
    special_characters: "Ãâ€š" # Final sigma
    punctuation: "Ã‚Â·" # Greek middle dot
    
  character_enhancement:
    similar_character_disambiguation:
      - "ÃŽâ€˜ vs A (Latin A)"
      - "ÃŽâ€™ vs B (Latin B)" 
      - "ÃŽâ€¢ vs E (Latin E)"
      - "ÃŽâ€” vs H (Latin H)"
      - "ÃŽâ„¢ vs I (Latin I)"
      - "ÃŽÅ¡ vs K (Latin K)"
      - "ÃŽÅ“ vs M (Latin M)"
      - "ÃŽÂ vs N (Latin N)"
      - "ÃŽÅ¸ vs O (Latin O)"
      - "ÃŽÂ  vs P (Latin P)"
      - "ÃŽÂ¡ vs P (Latin P confusion)"
      - "ÃŽÂ¤ vs T (Latin T)"
      - "ÃŽÂ¥ vs Y (Latin Y)"
      - "ÃŽÂ§ vs X (Latin X)"
      
  accent_recognition:
    acute_accents: "ÃŽÂ¬ ÃŽÂ­ ÃŽÂ® ÃŽÂ¯ ÃÅ’ ÃÂ ÃÅ½"
    diaeresis: "ÃÅ  Ãâ€¹" 
    combined_accents: "ÃŽÂ ÃŽÂ°"
    accent_correction: "Auto-correct missing or incorrect accents"
```

### Greek Business Document Intelligence
```yaml
Greek_Business_Document_Types:
  invoices:
    greek_keywords: ["ÃŽÂ¤ÃŽâ„¢ÃŽÅ“ÃŽÅ¸ÃŽâ€ºÃŽÅ¸ÃŽâ€œÃŽâ„¢ÃŽÅ¸", "ÃŽâ€˜ÃŽÂ ÃŽÅ¸ÃŽâ€ÃŽâ€¢ÃŽâ„¢ÃŽÅ¾ÃŽâ€”", "ÃŽÂ ÃŽâ€˜ÃŽÂ¡ÃŽâ€˜ÃŽÂ£ÃŽÂ¤ÃŽâ€˜ÃŽÂ¤ÃŽâ„¢ÃŽÅ¡ÃŽÅ¸"]
    required_elements: ["ÃŽâ€˜ÃŽÂ¦ÃŽÅ“", "ÃŽÂ¦ÃŽÂ ÃŽâ€˜", "ÃŽâ€”ÃŽÅ“ÃŽâ€¢ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽÂÃŽâ„¢ÃŽâ€˜", "ÃŽÂ ÃŽÅ¸ÃŽÂ£ÃŽÅ¸"]
    amount_patterns: ["Ã¢â€šÂ¬\\d+[.,]\\d+", "\\d+[.,]\\d+\\s*Ã¢â€šÂ¬", "\\d+[.,]\\d+\\s*EUR"]
    vat_patterns: ["ÃŽÂ¦ÃŽÂ ÃŽâ€˜\\s*\\d+%", "VAT\\s*\\d+%", "24%", "13%", "6%"]
    
  receipts:
    types: ["ÃŽâ€˜ÃŽÂ ÃŽÅ¸ÃŽâ€ÃŽâ€¢ÃŽâ„¢ÃŽÅ¾ÃŽâ€” ÃŽâ€ºÃŽâ„¢ÃŽâ€˜ÃŽÂÃŽâ„¢ÃŽÅ¡ÃŽâ€”ÃŽÂ£", "ÃŽâ€˜ÃŽÂ ÃŽÅ¸ÃŽâ€ÃŽâ€¢ÃŽâ„¢ÃŽÅ¾ÃŽâ€” ÃŽÂ ÃŽâ€˜ÃŽÂ¡ÃŽÅ¸ÃŽÂ§ÃŽâ€”ÃŽÂ£ ÃŽÂ¥ÃŽÂ ÃŽâ€”ÃŽÂ¡ÃŽâ€¢ÃŽÂ£ÃŽâ„¢ÃŽÂ©ÃŽÂ"]
    essential_info: ["ÃŽâ€”ÃŽÅ“ÃŽâ€¢ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽÂÃŽâ„¢ÃŽâ€˜", "ÃŽÂ©ÃŽÂ¡ÃŽâ€˜ÃŽâ€”", "ÃŽÂ ÃŽÅ¸ÃŽÂ£ÃŽÅ¸", "ÃŽâ€˜ÃŽÂ¦ÃŽÅ“ ÃŽÅ¡ÃŽâ€˜ÃŽÂ¤ÃŽâ€˜ÃŽÂ£ÃŽÂ¤ÃŽâ€”ÃŽÅ“ÃŽâ€˜ÃŽÂ¤ÃŽÅ¸ÃŽÂ£"]
    pos_indicators: ["POS", "ÃŽÅ¡ÃŽâ€˜ÃŽÂ¡ÃŽÂ¤ÃŽâ€˜", "ÃŽÅ“ÃŽâ€¢ÃŽÂ¤ÃŽÂ¡ÃŽâ€”ÃŽÂ¤ÃŽâ€˜"]
    
  government_forms:
    aade_forms: ["ÃŽâ€¢1", "ÃŽâ€¢3", "ÃŽÂ¦ÃŽÂ ÃŽâ€˜", "ÃŽâ€¢ÃŽÂÃŽÂ¦ÃŽâ„¢ÃŽâ€˜"]
    efka_forms: ["ÃŽâ€˜.ÃŽÂ .ÃŽâ€.", "ÃŽâ€˜ÃŽÂ ÃŽâ€˜", "ÃŽâ€¢ÃŽÂ¦ÃŽÅ¡", "ÃŽâ€¢ÃŽÂ¡ÃŽâ€œÃŽÅ¸ÃŽâ€ÃŽÅ¸ÃŽÂ¤ÃŽâ„¢ÃŽÅ¡ÃŽâ€¢ÃŽÂ£ ÃŽâ€¢ÃŽâ„¢ÃŽÂ£ÃŽÂ¦ÃŽÅ¸ÃŽÂ¡ÃŽâ€¢ÃŽÂ£"]
    municipal_forms: ["ÃŽâ€ÃŽâ€”ÃŽÅ“ÃŽÅ¸ÃŽÂ¤ÃŽâ„¢ÃŽÅ¡ÃŽÅ¸ÃŽÂ£ ÃŽÂ¦ÃŽÅ¸ÃŽÂ¡ÃŽÅ¸ÃŽÂ£", "ÃŽÂ¤ÃŽâ€¢ÃŽâ€ºÃŽÅ¸ÃŽÂ£ ÃŽÅ¡ÃŽâ€˜ÃŽËœÃŽâ€˜ÃŽÂ¡ÃŽâ„¢ÃŽÅ¸ÃŽÂ¤ÃŽâ€”ÃŽÂ¤ÃŽâ€˜ÃŽÂ£"]
    
  contracts:
    contract_types: ["ÃŽÂ£ÃŽÂ¥ÃŽÅ“ÃŽâ€™ÃŽâ€˜ÃŽÂ£ÃŽâ€”", "ÃŽÂ£ÃŽÂ¥ÃŽÅ“ÃŽÂ¦ÃŽÂ©ÃŽÂÃŽâ„¢ÃŽâ€˜", "ÃŽÂ ÃŽâ€˜ÃŽÂ¡ÃŽâ€˜ÃŽÂ§ÃŽÂ©ÃŽÂ¡ÃŽâ€”ÃŽÂ£ÃŽâ€”"]
    key_clauses: ["ÃŽâ€˜ÃŽÂÃŽÂ¤ÃŽâ„¢ÃŽÅ¡ÃŽâ€¢ÃŽâ„¢ÃŽÅ“ÃŽâ€¢ÃŽÂÃŽÅ¸", "ÃŽÂ¤ÃŽâ„¢ÃŽÅ“ÃŽâ€”", "ÃŽâ€ÃŽâ„¢ÃŽâ€˜ÃŽÂ¡ÃŽÅ¡ÃŽâ€¢ÃŽâ„¢ÃŽâ€˜", "ÃŽÂ¥ÃŽÂ ÃŽÅ¸ÃŽÂ§ÃŽÂ¡ÃŽâ€¢ÃŽÂ©ÃŽÂ£ÃŽâ€¢ÃŽâ„¢ÃŽÂ£"]
    signature_areas: ["ÃŽÂ¥ÃŽÂ ÃŽÅ¸ÃŽâ€œÃŽÂ¡ÃŽâ€˜ÃŽÂ¦ÃŽâ€”", "ÃŽÂ£ÃŽÂ¦ÃŽÂ¡ÃŽâ€˜ÃŽâ€œÃŽâ„¢ÃŽâ€ÃŽâ€˜", "ÃŽâ€”ÃŽÅ“ÃŽâ€¢ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽÂÃŽâ„¢ÃŽâ€˜ ÃŽÂ¥ÃŽÂ ÃŽÅ¸ÃŽâ€œÃŽÂ¡ÃŽâ€˜ÃŽÂ¦ÃŽâ€”ÃŽÂ£"]
```

### OpenClaw File Processing Integration
```yaml
Greek_OCR_File_Structure:
  input_processing:
    - /data/ocr/incoming/scanned/         # Scanned documents (PDF, JPG, PNG, TIFF)
    - /data/ocr/incoming/photos/          # Mobile phone document photos
    - /data/ocr/incoming/handwritten/     # Handwritten Greek documents
    - /data/ocr/incoming/government/      # Government forms and official documents
    
  processing_workspace:
    - /data/ocr/preprocessing/enhanced/   # Image enhancement and optimization
    - /data/ocr/processing/greek-ocr/     # Greek language OCR processing
    - /data/ocr/processing/validation/    # Text validation and correction
    - /data/ocr/processing/classification/# Document type classification
    
  output_delivery:
    - /data/ocr/output/text-extracted/      # Clean extracted text files
    - /data/ocr/output/structured-data/     # Structured business data (JSON)
    - /data/ocr/output/searchable-pdf/      # PDFs with Greek text layer
    - /data/ocr/output/accounting-ready/    # Data ready for accounting integration
```

## Enhanced Greek OCR Processing Pipeline

### Pre-Processing Optimization for Greek Documents
```yaml
Image_Enhancement_Pipeline:
  step_1_assessment:
    command: "openclaw ocr assess-quality --greek-text --character-density"
    functions: ["Image quality analysis", "Greek text detection", "Optimal processing path selection"]
    
  step_2_enhancement:
    command: "openclaw ocr enhance-image --greek-characters --contrast-optimization"
    functions: ["Noise reduction", "Contrast enhancement", "Greek character sharpening"]
    
  step_3_preprocessing:
    command: "openclaw ocr preprocess --deskew --border-removal --greek-layout"
    functions: ["Document alignment", "Border detection", "Greek text layout analysis"]
    
Greek_Specific_Enhancements:
  character_enhancement:
    accent_sharpening: "Enhance accent mark visibility"
    character_separation: "Improve separation of connected Greek letters"
    font_optimization: "Optimize for common Greek fonts (Times New Roman Greek, Arial Greek)"
    
  layout_analysis:
    greek_reading_order: "Right-to-left aware processing for mixed text"
    column_detection: "Handle Greek newspaper and document column layouts"
    table_recognition: "Greek table headers and structure recognition"
```

### Advanced Greek Text Extraction
```yaml
Greek_OCR_Engine_Configuration:
  primary_ocr_engine:
    base: "OpenClaw deepread skill enhancement"
    greek_language_model: "el-GR with business terminology"
    confidence_threshold: 0.95
    character_whitelist: "Greek alphabet + Latin numbers + common punctuation"
    
  secondary_engines:
    tesseract_greek: "Fallback for challenging documents"
    handwriting_recognition: "Specialized for Greek cursive and signatures"
    form_processing: "Template-based for government forms"
    
  post_processing:
    spell_checking: "Greek business dictionary with 50,000+ terms"
    context_correction: "Business context-aware text correction"
    accent_normalization: "Standard Greek accent placement"
    
Text_Validation_Rules:
  greek_business_validation:
    vat_number_format: "EL followed by 9 digits"
    date_validation: "dd/MM/yyyy or dd-MM-yyyy Greek formats"
    amount_validation: "Greek currency formatting (1.234,56 Ã¢â€šÂ¬)"
    address_validation: "Greek address patterns and postal codes"
    
  confidence_scoring:
    character_confidence: "Per-character accuracy scoring"
    word_confidence: "Greek word validation against dictionary"
    context_confidence: "Business context appropriateness"
    overall_confidence: "Weighted average with manual review threshold"
```

## Handwritten Greek Document Processing

### Greek Cursive Recognition
```yaml
Handwritten_Greek_Support:
  cursive_patterns:
    connected_letters: "Common Greek letter combinations (ÃŽÂ¿Ãâ€¦, ÃŽÂµÃŽÂ¹, ÃŽÂ±ÃŽÂ¹, etc.)"
    character_variations: "Individual handwriting style adaptation"
    historical_forms: "Recognition of older Greek handwriting styles"
    
  signature_recognition:
    greek_signatures: "Greek name pattern recognition"
    official_stamps: "Government and business stamp recognition"
    verification_marks: "Legal document verification signatures"
    
  enhancement_techniques:
    contrast_boosting: "Improve handwritten text visibility"
    stroke_analysis: "Greek letter stroke pattern recognition"
    word_segmentation: "Separate connected handwritten Greek words"
    
Handwriting_Processing_Workflow:
  preprocessing:
    - "Handwriting-specific image enhancement"
    - "Stroke width normalization"  
    - "Background noise removal"
    
  recognition:
    - "Greek cursive letter recognition"
    - "Word boundary detection"
    - "Context-based correction"
    
  validation:
    - "Greek word dictionary validation"
    - "Business context verification"
    - "Manual review flagging for low confidence"
```

## Greek Document Classification Intelligence

### Automated Document Type Recognition
```yaml
Greek_Document_Classifier:
  invoice_detection:
    visual_cues: ["ÃŽÂ¤ÃŽâ„¢ÃŽÅ“ÃŽÅ¸ÃŽâ€ºÃŽÅ¸ÃŽâ€œÃŽâ„¢ÃŽÅ¸ header", "Company logos", "VAT number placement"]
    text_patterns: ["ÃŽâ€˜ÃŽÂ¦ÃŽÅ“ patterns", "Invoice numbering", "Due date formats"]
    layout_features: ["Table structures", "Total amount positioning", "VAT breakdowns"]
    confidence_threshold: 0.92
    
  receipt_detection:
    visual_cues: ["POS receipt format", "Thermal paper patterns", "Store logos"]
    text_patterns: ["ÃŽâ€˜ÃŽÂ ÃŽÅ¸ÃŽâ€ÃŽâ€¢ÃŽâ„¢ÃŽÅ¾ÃŽâ€”", "Date/time stamps", "Payment method indicators"]
    layout_features: ["Linear item listing", "Total at bottom", "Change calculation"]
    confidence_threshold: 0.90
    
  government_form_detection:
    visual_cues: ["Government letterheads", "Official stamps", "Form numbers"]
    text_patterns: ["ÃŽâ€¢ÃŽâ€ºÃŽâ€ºÃŽâ€”ÃŽÂÃŽâ„¢ÃŽÅ¡ÃŽâ€” ÃŽâ€ÃŽâ€”ÃŽÅ“ÃŽÅ¸ÃŽÅ¡ÃŽÂ¡ÃŽâ€˜ÃŽÂ¤ÃŽâ„¢ÃŽâ€˜", "Ministry names", "Official references"]
    layout_features: ["Standard form layouts", "Checkbox structures", "Signature lines"]
    confidence_threshold: 0.95
    
  contract_detection:
    visual_cues: ["Multi-page documents", "Legal formatting", "Signature pages"]
    text_patterns: ["ÃŽÂ£ÃŽÂ¥ÃŽÅ“ÃŽâ€™ÃŽâ€˜ÃŽÂ£ÃŽâ€”", "Legal terminology", "Clause numbering"]
    layout_features: ["Paragraph structures", "Section headers", "Signature blocks"]
    confidence_threshold: 0.88
```

### Greek Business Data Extraction
```yaml
Structured_Data_Extraction:
  invoice_data_extraction:
    company_info:
      - supplier_name: "Extract from header/footer"
      - supplier_vat: "ÃŽâ€˜ÃŽÂ¦ÃŽÅ“: pattern recognition"
      - supplier_address: "Greek address format extraction"
      
    transaction_info:
      - invoice_number: "ÃŽâ€˜ÃÂÃŽÂ¹ÃŽÂ¸ÃŽÂ¼ÃÅ’Ãâ€š Ãâ€žÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃŽÂ¿ÃŽÂ³ÃŽÂ¯ÃŽÂ¿Ãâ€¦ pattern"
      - invoice_date: "Greek date format recognition"
      - due_date: "ÃŽâ€”ÃŽÂ¼ÃŽÂµÃÂÃŽÂ¿ÃŽÂ¼ÃŽÂ·ÃŽÂ½ÃŽÂ¯ÃŽÂ± Ãâ‚¬ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ®Ãâ€š extraction"
      
    financial_info:
      - line_items: "Table extraction with Greek descriptions"
      - vat_amounts: "ÃŽÂ¦ÃŽÂ ÃŽâ€˜ calculation validation"
      - total_amount: "ÃŽÂ£ÃŽÂ¥ÃŽÂÃŽÅ¸ÃŽâ€ºÃŽÅ¸ or TOTAL pattern recognition"
      
  receipt_data_extraction:
    merchant_info:
      - business_name: "Store name from receipt header"
      - vat_number: "ÃŽâ€˜ÃŽÂ¦ÃŽÅ“ from receipt footer"
      - location: "Address or branch information"
      
    transaction_info:
      - date_time: "Greek date/time format extraction"
      - payment_method: "ÃŽÅ¡ÃŽâ€˜ÃŽÂ¡ÃŽÂ¤ÃŽâ€˜, ÃŽÅ“ÃŽâ€¢ÃŽÂ¤ÃŽÂ¡ÃŽâ€”ÃŽÂ¤ÃŽâ€˜, etc."
      - receipt_number: "ÃŽâ€˜ÃÂÃŽÂ¹ÃŽÂ¸ÃŽÂ¼ÃÅ’Ãâ€š ÃŽÂ±Ãâ‚¬ÃÅ’ÃŽÂ´ÃŽÂµÃŽÂ¹ÃŽÂ¾ÃŽÂ·Ãâ€š"
      
    items_and_amounts:
      - purchased_items: "Item list with Greek descriptions"
      - individual_prices: "Price extraction per item"
      - vat_breakdown: "VAT rate identification (24%, 13%, 6%)"
      - total_amount: "Final amount with currency"
```

## Quality Control & Accuracy Optimization

### Greek OCR Accuracy Monitoring
```yaml
Quality_Control_System:
  accuracy_metrics:
    character_accuracy: "Greek character recognition rate >98%"
    word_accuracy: "Greek word recognition rate >95%"
    document_accuracy: "Complete document processing rate >92%"
    
  confidence_monitoring:
    low_confidence_threshold: "<0.85 flags for manual review"
    medium_confidence: "0.85-0.92 requires validation"
    high_confidence: ">0.92 auto-processed"
    
  error_pattern_analysis:
    common_errors: "Track frequent Greek OCR mistakes"
    improvement_feedback: "Learn from manual corrections"
    model_updates: "Continuous improvement based on corrections"
    
Manual_Review_Workflow:
  flagging_criteria:
    - "Greek accent recognition issues"
    - "Similar character confusion (ÃŽâ€˜ vs A)"
    - "Handwritten text with low confidence"
    - "Complex table structures"
    - "Damaged or poor quality documents"
    
  review_interface:
    original_image: "Side-by-side with extracted text"
    character_highlighting: "Mark uncertain characters"
    greek_keyboard: "Easy Greek text correction interface"
    validation_tools: "Business rule checking (VAT numbers, dates)"
```

### Integration with Greek Accounting Workflows
```yaml
Accounting_Integration:
  invoice_processing:
    workflow: "OCR Ã¢â€ â€™ Validation Ã¢â€ â€™ Accounting Software Export"
    vat_verification: "Cross-check extracted VAT with business rules"
    amount_validation: "Verify calculated totals match extracted amounts"
    
  expense_categorization:
    greek_expense_categories: "Map to Greek chart of accounts"
    vat_rate_assignment: "Automatic VAT rate based on expense type"
    supplier_recognition: "Match suppliers to existing accounting records"
    
  compliance_support:
    audit_trail: "Maintain OCR processing history"
    document_retention: "Store original images with extracted data"
    accuracy_reporting: "Generate accuracy reports for auditors"
```

## Production Deployment Features

### Performance Optimization for Greek Documents
```bash
# Performance monitoring and optimization
openclaw ocr performance-monitor --greek-processing --throughput-analysis
openclaw ocr optimize-batch --large-documents --parallel-processing
openclaw ocr cache-optimization --greek-models --frequent-terms

# Scalability commands
openclaw ocr scale-processing --concurrent-documents 5 --memory-optimization
openclaw ocr distributed-ocr --worker-nodes --greek-language-models
openclaw ocr load-balancing --priority-queues --document-types
```

### Greek Language Model Management
```yaml
Model_Management:
  greek_language_models:
    business_terminology: "50,000+ Greek business terms"
    accounting_vocabulary: "Specialized accounting and tax terminology"
    government_terminology: "Official government document language"
    
  model_updates:
    automatic_updates: "Monthly model improvements"
    custom_training: "Client-specific terminology learning"
    accuracy_feedback: "Continuous learning from corrections"
    
  deployment_options:
    cloud_models: "High accuracy, internet required"
    local_models: "Good accuracy, offline capability"
    hybrid_mode: "Cloud for complex, local for routine"
```

## Usage Examples for Greek Company Testing

### Daily Document Processing
```bash
# Morning document processing workflow
$ openclaw ocr morning-batch --process-overnight --greek-priority

Ã°Å¸â€œâ€ž Greek OCR Processing Summary - February 19, 2026:

Ã°Å¸â€œÅ  Documents Processed: 23 total
Ã¢Å“â€¦ Invoices: 8 processed (avg confidence: 96.2%)
   - SUPPLIER A AE: Invoice #2026-0234, Ã¢â€šÂ¬1,234.56 Ã¢Å“â€¦
   - ÃŽÂ ÃŽÂ¡ÃŽÅ¸ÃŽÅ“ÃŽâ€”ÃŽËœÃŽâ€¢ÃŽÂ¥ÃŽÂ¤ÃŽâ€”ÃŽÂ£ ÃŽâ€™ ÃŽâ€¢ÃŽÂ ÃŽâ€¢: ÃŽÂ¤ÃŽÂ¹ÃŽÂ¼ÃŽÂ¿ÃŽÂ»ÃÅ’ÃŽÂ³ÃŽÂ¹ÃŽÂ¿ #456, Ã¢â€šÂ¬890.00 Ã¢Å“â€¦
   
Ã¢Å“â€¦ Receipts: 12 processed (avg confidence: 94.8%)
   - Restaurant receipts: 4 (13% VAT detected)
   - Fuel receipts: 3 (24% VAT detected)
   - Office supplies: 5 (24% VAT detected)

Ã¢Å¡Â Ã¯Â¸Â Manual Review Required: 3 documents
   - Handwritten note (confidence: 78%)
   - Damaged invoice (confidence: 82%)
   - Complex government form (confidence: 84%)

Ã°Å¸â€œÂ¤ Accounting Export: 20 documents ready for QuickBooks import
Ã°Å¸â€™Â¾ Searchable PDFs: 23 documents with Greek text layer created
```

### Complex Greek Document Processing
```bash
$ openclaw ocr process-complex --handwritten --government-forms --contracts

Ã°Å¸â€œâ€¹ Complex Greek Document Processing:

Ã¢Å“ÂÃ¯Â¸Â Handwritten Documents (5):
Ã¢Å“â€¦ Handwritten invoice corrections - Ã¢â€šÂ¬234.50 adjustment recognized
Ã¢Å“â€¦ Client note with payment instructions - "ÃŽÂ ÃŽÂ»ÃŽÂ·ÃÂÃâ€°ÃŽÂ¼ÃŽÂ® ÃÆ’Ãâ€žÃŽÂ¹Ãâ€š 25/02" extracted
Ã¢Å¡Â Ã¯Â¸Â Signature verification needed - Legal contract signature page

Ã°Å¸Ââ€ºÃ¯Â¸Â Government Forms (3):
Ã¢Å“â€¦ AADE E1 Form - Individual tax data extracted completely
Ã¢Å“â€¦ EFKA contribution form - Employee data processed
Ã¢Å“â€¦ Municipal tax payment receipt - Ã¢â€šÂ¬456.78 payment confirmed

Ã°Å¸â€œâ€ž Contracts (2):
Ã¢Å“â€¦ Service contract - Key terms extracted (Duration: 12 months, Ã¢â€šÂ¬2,000/month)
Ã¢Å¡Â Ã¯Â¸Â Real estate contract - Complex legal clauses flagged for manual review

Ã°Å¸â€œÅ  Overall Success Rate: 91.3%
Ã¢ÂÂ±Ã¯Â¸Â Processing Time: 4 minutes 32 seconds
Ã°Å¸â€Â Manual Review Items: 4 documents requiring attention
```

### Integration with Meta-Skill
```bash
# Meta-skill coordinated document processing
$ openclaw greek document-intelligence --scan-and-process --coordinate-all

# Behind the scenes coordination:
# 1. Greek OCR: Process scanned documents and photos
# 2. Banking Integration: Match receipts to bank transactions
# 3. Compliance AADE: Validate VAT rates and amounts
# 4. Email Processor: Send processing confirmations to clients
# 5. Accounting Workflows: Export to accounting software
# 6. Individual Taxes: Update personal expense tracking
```

### Accuracy Analysis and Improvement
```bash
$ openclaw ocr accuracy-report --greek-documents --monthly-analysis

Ã°Å¸â€œË† Greek OCR Accuracy Analysis - February 2026:

Ã°Å¸â€œÅ  Character Recognition:
Ã¢Å“â€¦ Greek Letters: 98.7% accuracy (target: >98%)
Ã¢Å“â€¦ Accented Characters: 97.2% accuracy (ÃŽÂ¬, ÃŽÂ­, ÃŽÂ®, etc.)
Ã¢Å“â€¦ Numbers/Currency: 99.4% accuracy (Ã¢â€šÂ¬ amounts)
Ã¢Å¡Â Ã¯Â¸Â Handwritten Text: 89.3% accuracy (target: >90%)

Ã°Å¸â€œâ€¹ Document Type Accuracy:
Ã¢Å“â€¦ Printed Invoices: 96.8% complete extraction
Ã¢Å“â€¦ POS Receipts: 95.2% complete extraction  
Ã¢Å“â€¦ Government Forms: 94.1% complete extraction
Ã¢Å¡Â Ã¯Â¸Â Handwritten Notes: 85.7% complete extraction

Ã°Å¸â€Â§ Improvement Actions:
- Enhanced handwritten Greek cursive training scheduled
- Updated business terminology dictionary (+347 new terms)
- Improved accent recognition for damaged documents
- Added 3 new Greek receipt format templates

Ã°Å¸â€œË† Month-over-Month: +2.3% accuracy improvement
Ã°Å¸Å½Â¯ Next Target: 97% overall accuracy by March 2026
```

## Success Metrics for Greek OCR Deployment

A successful Greek OCR system should achieve:
- Ã¢Å“â€¦ 98%+ accuracy for printed Greek business documents
- Ã¢Å“â€¦ 95%+ accuracy for clear handwritten Greek text
- Ã¢Å“â€¦ 90%+ accuracy for damaged or poor quality documents
- Ã¢Å“â€¦ Complete integration with existing OpenClaw deepread skill
- Ã¢Å“â€¦ Automatic Greek VAT rate and amount extraction
- Ã¢Å“â€¦ Professional searchable PDF generation with Greek text layer
- Ã¢Å“â€¦ Real-time processing suitable for daily business workflows
- Ã¢Å“â€¦ Robust error handling and manual review workflow

Remember: This skill transforms OpenClaw into a production-ready Greek document processing system, enabling automated processing of all types of Greek business documents with high accuracy and intelligent data extraction suitable for Greek accounting workflows.
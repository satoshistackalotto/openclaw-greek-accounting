# Contributing

## How to Contribute

1. Fork this repository
2. Create a feature branch: `git checkout -b feature/improve-skill-XX`
3. Make your changes
4. Run path validation: `./scripts/validate-paths.sh`
5. Run evals for affected skills: `./scripts/run-evals.sh <skill-name>`
6. Submit a pull request

## Guidelines

### Skill Modifications

- All file paths must conform to `skills/canonical-data-map/SKILL.md`
- Use `{AFM}` (with EL prefix) for client references — never `{client_vat}` or `{tax_id}`
- All CLI commands follow the `openclaw <namespace> <action>` pattern
- Include human confirmation gates for any government submission workflow
- Update the meta-skill (Skill 06) if adding new user-facing commands

### Adding EVALS

- Every skill should have an `EVALS.json` file with at least 5 test scenarios
- Include edge cases: missing data, malformed input, concurrent access
- Test completeness gates where applicable
- Test Greek character handling in all text processing scenarios

### Path Conventions

- Never introduce new top-level directories under `/data/` without updating the canonical data map
- Never write client data outside `/data/clients/{AFM}/`
- Use ISO date format (`YYYY-MM-DD`) in all file names and JSON
- Never use Greek characters in file names — only in JSON values and display output

### Code of Conduct

Be professional. This system handles real financial data for real businesses. Prioritize correctness and safety over cleverness.

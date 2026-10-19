---
name: security-review
description: Review the pending changes for security vulnerabilities. Use when a change touches auth, input handling, secrets, the network, files, or dependencies.
---

# Security review

## Steps

1. Get the changes and read the affected files in full. Identify where untrusted input enters and where it is used.
2. Check the change for:
   - **Injection:** SQL, command, template, path traversal, and unsafe deserialization.
   - **Authentication and authorization:** missing checks, broken access control, and insecure sessions or tokens.
   - **Secrets:** hardcoded credentials or keys, and secrets in logs or error messages.
   - **Input and output handling:** missing validation, XSS, SSRF, open redirects, and unsafe file uploads.
   - **Cryptography:** weak or homemade algorithms, bad randomness, and missing TLS verification.
   - **Dependencies:** new or upgraded packages that are unmaintained, unpinned, or known to be vulnerable.
   - **Data exposure:** sensitive data returned, stored, or logged unnecessarily.
3. Confirm each finding by tracing a realistic path from attacker-controlled input to impact. Drop anything you cannot support.
4. Report the findings, most severe first. For each, give the `file:line`, the vulnerability, how it could be exploited, and the fix.
5. Fix the findings if asked, then re-verify.

## Notes

- Review defensively. Do not write working exploits.
- If you find nothing, say so.

# Linux Health Daemon & Local CI/CD Pipeline

A lightweight system health monitoring daemon integrated with an automated local CI/CD pipeline using GitHub Actions and a self-hosted runner on CentOS.

---

## Project Overview
This project demonstrates automated systems administration and DevOps best practices by bridging cloud orchestration (GitHub Actions) with private on-premise infrastructure (CentOS VM). Every push to the repository automatically triggers syntax validation, local file deployment, system health audits, and structured logging.

---

## Architecture & Workflow
1. **Source Control:** Code changes are pushed to the GitHub repository.
2. **CI/CD Trigger:** GitHub Actions detects the event and dispatches the workflow job.
3. **Self-Hosted Runner:** A local runner (`./run.sh`) polling inside the private CentOS VM picks up the job.
4. **Continuous Integration:** Runs automated syntax and structure validation tests (`validate.sh`).
5. **Continuous Deployment:** Safely copies updated scripts into the local operational path (`~/health-daemon/scripts/`).
6. **Execution & Auditing:** Executes the health-check script and securely writes operational metrics to `/var/log/sys_health/`.

---

## Repository Structure
```text
Linux-health-daemon/
├── .github/
│   └── workflows/
│       └── deploy.yml      # Automated GitHub Actions CI/CD pipeline definition
├── scripts/
│   └── health-check.sh     # System health audit script (Monitors disk & RAM)
└── tests/
    └── validate.sh         # CI syntax and validation test suite

OS: CentOS (Virtual Machine)

Orchestration: GitHub Actions & Self-Hosted Runner

Scripting: Bash

Logging & Permissions: Linux System Administration (/var/log/sys_health/)

=== STARTING SYSTEM AUDIT: Saturday 26 September 2026 11:36:37 PM IST ===
[INFO] Checking Disk Space...
Root Partition Usage: 48%
[INFO] Checking Memory Consumption...
Free Memory: 527 MB out of 3700 MB
=== AUDIT COMPLETE ===

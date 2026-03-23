# Project Report: Open Source Audit of Git
**Course:** Open Source Software — CSE0002
**Student:** Arsh Verma (24BCG10026)
**Date:** 22 March 2026

---

## 1. Executive Summary
This report documents a comprehensive audit of **Git**, a distributed version control system licensed under GPL v2. The project involves a deep-dive into the technical and philosophical foundations of the software, supported by five original shell scripts designed for Linux system auditing.

## 2. Auditing Approach

My approach to this project was systematic, moving from high-level system metadata to granular software-specific auditing. The methodology was divided into four main phases:

1.  **Phase 1 — Environmental Baselining**: Using `script1_system_identity.sh` to capture the operating system, kernel version, and user context. This ensured that the audit results were grounded in a specific, reproducible environment.
2.  **Phase 2 — Software Identity & Philosophy**: Using `script2_package_inspector.sh` to verify the installation of Git and contrast it with other FOSS giants. This phase focused on finding the "philosophical fit" of each tool within the open-source movement.
3.  **Phase 3 — Technical Deep-Dive & Security**: Using `script3_disk_auditor.sh` and `script4_log_analyzer.sh` to perform low-level analysis. I examined file-system permissions, configuration hierarchies (`/etc` vs `~`), and analyzed system logs for operational errors.
4.  **Phase 4 — Ethical Synthesis**: The final phase involved synthesizing the technical data into a philosophical audit of the GPL v2 license and the creation of a personalized manifesto via `script5_manifesto_generator.sh`.

---

## 3. Technical Implementation (Scripts)

### Script 1: System Identity Report (`script1_system_identity.sh`)
*   **Logic**: Uses `uname`, `whoami`, and `uptime` to gather environmental metadata.
*   **Key Feature**: Dynamic distribution detection via `/etc/os-release` or `lsb_release`.
*   **Specific Result**: Successfully identified the host as a Linux/Unix environment with kernel `6.x` and established the system as a valid FOSS audit target.

### Script 2: FOSS Package Inspector (`script2_package_inspector.sh`)
*   **Logic**: Detects the system package manager (`dpkg` vs `rpm`) and audits Git's version and license.
*   **Key Feature**: A `case` statement provides individual philosophy notes for a curated list of open-source tools (Apache, MySQL, Firefox, etc.).
*   **Specific Result**: Confirmed Git 2.x installation under GPL v2.0, reinforcing its status as a core system utility.

### Script 3: Disk and Permission Auditor (`script3_disk_auditor.sh`)
*   **Logic**: Iterates through critical directories (`/etc`, `/var/log`, etc.) using a `for` loop.
*   **Key Feature**: Uses `awk` to extract shell-level details (Permissions, Owner, Group) and `printf` for tabular alignment.
*   **Specific Result**: Verified that `/usr/bin/git` is world-executable but `/etc/gitconfig` is root-protected, reflecting a secure multi-user Linux setup.

### Script 4: Log File Analyzer (`script4_log_analyzer.sh`)
*   **Logic**: A robust `while read` loop that scans any provided log file for a specific keyword.
*   **Key Feature**: Includes file existence, readability, and size validation (`-f`, `-r`, `-s`) to prevent runtime errors.
*   **Specific Result**: Efficiently isolated the last 5 operational warnings from system logs, proving the feasibility of automated audit monitoring.

### Script 5: Open Source Manifesto Generator (`script5_manifesto_generator.sh`)
*   **Logic**: An interactive script using `read -p` and `while` validation loops to ensure user input.
*   **Key Feature**: Dynamically generates a personalized `.txt` file using the current system `whoami` for the filename.
*   **Specific Result**: Created the final `manifesto_arshverma.txt`, capturing the personal values and vision behind the audit.

---

## 4. Key Findings

1.  **Philosophical Resilience**: The most significant finding was Git’s origin story. Git was born out of a crisis (the BitKeeper incident), proving that open-source communities can build superior tools in response to proprietary lockdowns.
2.  **Licensing Integrity**: The GPL v2.0 license is the "moral anchor" of Git. It prevents fragmentation by ensuring that any redistribution of the source code remains as free as the original.
3.  **Technical POSIX Alignment**: Git differs from databases or web servers by *not* running as a background service. It leverages the underlying Linux permission model perfectly—a design finding that highlights its efficiency as a "plumbing" tool.
4.  **Ecosystem Dominance**: While proprietary tools like Perforce dominate niches (e.g., game dev with large binaries), Git’s open-source nature has allowed it to capture nearly 90% of the software development market through platforms like GitHub and GitLab.

## 5. Conclusion
The audit confirms that Git is not just a version control tool; it is a fundamental infrastructure for the modern world. My approach demonstrated that even simple shell scripts can provide deep technical insights into how a piece of software integrates with the Linux philosophy of transparency and security.

---
**Repository Link:** https://github.com/ArshVermaGit/oss-audit-24BCG10026

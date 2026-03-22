# OSS Audit — Git

**Student:** Arsh Verma
**Roll Number:** 24BCG10026
**Course:** Open Source Software — CSE0002
**Chosen Software:** Git (Version Control System)
**License:** GNU General Public License v2 (GPL v2)
**Repository:** https://github.com/[YOUR GITHUB USERNAME]/oss-audit-git

---

## About This Project

This repository houses the capstone audit of **Git** — the world's most widely used distributed version control system — conducted as part of the Open Source Software (OSS NGMC) course. The audit examines Git's origin story and the events that led Linus Torvalds to create it, analyses its GPL v2 licensing and the philosophical foundations of copyleft, and maps its footprint on Linux systems. It also compares Git against proprietary alternatives such as Perforce and BitKeeper. Alongside the written report, the project includes five original shell scripts that demonstrate practical Linux command-line and shell scripting skills.

---

## Chosen Software — Git

Git was created by Linus Torvalds in April 2005 after BitMover revoked the free licence for BitKeeper that the Linux kernel team had been relying on for source-code management. Torvalds needed a replacement that was fast, distributed, and capable of handling a project the size of the Linux kernel, so he wrote the first working version of Git in roughly ten days. Git is a distributed version control system, meaning every developer holds a full copy of the repository history — there is no single point of failure. It is released under the GNU General Public License version 2 (GPL v2), which guarantees the four freedoms (use, study, modify, distribute) and enforces copyleft so that derivative works must also remain open source. Today, Git powers platforms like GitHub, GitLab, and Gitea, and is the backbone of virtually all modern collaborative software development.

---

## Repository Structure

```
oss-audit-git/
├── README.md                              ← Project documentation (this file)
├── scripts/
│   ├── script1_system_identity.sh         ← System Identity Report
│   ├── script2_package_inspector.sh       ← FOSS Package Inspector
│   ├── script3_disk_auditor.sh            ← Disk and Permission Auditor
│   ├── script4_log_analyzer.sh            ← Log File Analyzer
│   └── script5_manifesto_generator.sh     ← Open Source Manifesto Generator
└── report/
    └── oss_audit_report.pdf               ← Full project report (uploaded separately to VITyarthi)
```

| Path | Description |
|------|-------------|
| `README.md` | Root-level project documentation with setup, run instructions, and script descriptions |
| `scripts/` | Contains all five shell scripts required by the assignment |
| `report/` | Reserved for the final compiled PDF report |

---

## Environment Setup

1. **Operating System:** Linux (Ubuntu 20.04+ or CentOS 7+ recommended). All scripts are tested on Ubuntu 22.04 LTS.

2. **Required tools:** `bash` (version 4.0+), `git`, `coreutils` (provides `du`, `df`, `ls`, `date`, `uname`, `whoami`, `uptime`)

3. **Install Git on Ubuntu / Debian:**
   ```bash
   sudo apt update
   sudo apt install git -y
   ```

4. **Install Git on RHEL / CentOS / Fedora:**
   ```bash
   sudo yum install git -y
   # or on newer Fedora:
   sudo dnf install git -y
   ```

5. **Verify installation:**
   ```bash
   git --version
   ```

6. **Clone this repository:**
   ```bash
   git clone https://github.com/[YOUR GITHUB USERNAME]/oss-audit-git.git
   cd oss-audit-git
   ```
   *(Replace `[YOUR GITHUB USERNAME]` with your actual GitHub username.)*

---

## Making Scripts Executable

```bash
chmod +x scripts/script1_system_identity.sh
chmod +x scripts/script2_package_inspector.sh
chmod +x scripts/script3_disk_auditor.sh
chmod +x scripts/script4_log_analyzer.sh
chmod +x scripts/script5_manifesto_generator.sh
```

Or all at once:

```bash
chmod +x scripts/*.sh
```

---

## Script Descriptions and How to Run Each

### Script 1 — System Identity Report (`script1_system_identity.sh`)

Displays a formatted welcome screen containing the Linux distribution name, kernel version, logged-in username, home directory path, system uptime, current date and time, and a note about the open-source (GPL v2) licence of the Linux kernel. Demonstrates the use of **variables**, **`echo`**, and **command substitution `$()`**.

**Run:**
```bash
./scripts/script1_system_identity.sh
```
**Expected output:** A bordered banner showing all system identity fields along with a brief note about GPL v2 licensing of the Linux kernel.

---

### Script 2 — FOSS Package Inspector (`script2_package_inspector.sh`)

Checks whether Git is installed on the system, retrieves its version and licence information, and uses a `case` statement to print a philosophy note about each recognised open-source package. Demonstrates **if-then-else**, **case statements**, **`dpkg`/`rpm` queries**, and **piping with `grep`**.

**Run:**
```bash
./scripts/script2_package_inspector.sh
```
**Expected output:** Installation status of Git, its version, licence details, and a one-line open-source philosophy note.

---

### Script 3 — Disk and Permission Auditor (`script3_disk_auditor.sh`)

Loops through key system directories (e.g., `/etc`, `/var`, `/usr`, `/home`) and reports the permissions, owner, and disk usage for each. Also inspects Git's configuration directory if present. Demonstrates **`for` loops**, **`du`**, **`ls -ld`**, **`awk`**, and **`cut`**.

**Run:**
```bash
./scripts/script3_disk_auditor.sh
```
**Expected output:** A formatted table listing directories alongside their permissions, owners, and sizes.

---

### Script 4 — Log File Analyzer (`script4_log_analyzer.sh`)

Reads a log file line by line, counts how many lines match a user-supplied keyword (default: `"error"`), and prints the last five matching lines. Demonstrates **`while read` loops**, **if-then conditionals**, **counter variables**, and **command-line arguments (`$1`, `$2`)**.

**Run:**
```bash
./scripts/script4_log_analyzer.sh /var/log/syslog error
# or with a custom log file and keyword:
./scripts/script4_log_analyzer.sh /path/to/logfile WARNING
```
**Expected output:** The total count of keyword matches followed by the last five matching lines from the log file.

---

### Script 5 — Open Source Manifesto Generator (`script5_manifesto_generator.sh`)

Interactively asks the user three questions about their open-source beliefs, then generates a personalised philosophy statement and saves it to a `.txt` file. Demonstrates **`read` for user input**, **string concatenation**, **file writing with `>` and `>>`**, and the **`date` command**.

**Run:**
```bash
./scripts/script5_manifesto_generator.sh
```
**Expected output:** A saved file named `manifesto_[username].txt` containing a personalised open-source philosophy paragraph; the same text is also printed to the terminal.

---

## Dependencies

| Tool | Purpose | Install (Ubuntu) |
|------|---------|-----------------|
| `bash` | Script interpreter | Pre-installed |
| `git` | Chosen audit software | `sudo apt install git` |
| `coreutils` | `du`, `df`, `ls`, `date`, `uname`, `whoami`, `uptime` | Pre-installed |
| `grep` | Text search in log analyzer | Pre-installed |
| `awk` | Field extraction in disk auditor | Pre-installed |
| `dpkg` or `rpm` | Package info in inspector | Pre-installed on respective distros |

---

## Notes for the Evaluator

- All scripts have been tested on **Ubuntu 22.04 LTS**.
- **Script 4** requires a readable log file path as the first argument. Use `/var/log/syslog` on Ubuntu or `/var/log/messages` on CentOS.
- **Script 5** is interactive — it will prompt for input when run.
- **No root/sudo access** is required to run any script.

---

## License

This project is submitted as coursework under the OSS NGMC course. The shell scripts are original work by the student. The project report is the intellectual property of the student.

#!/bin/bash
# =============================================================
# Script 1  : System Identity Report
# Author    : Arsh Verma (24BCG10026)
# Course    : Open Source Software — CSE0002
# Software  : Git (chosen for OSS Audit)
# Purpose   : Displays a system identity report as a formatted
#             welcome screen, showing OS, kernel, user, uptime,
#             and the open-source license of the Linux kernel.
# Date      : March 2026
# =============================================================

# --- VARIABLES ---

# Student and project information
STUDENT_NAME="Arsh Verma"              # Student's full name
ROLL_NUMBER="24BCG10026"               # University roll number
SOFTWARE_CHOICE="Git"                  # Chosen open-source software for audit

# System information using command substitution
KERNEL=$(uname -r)                     # Get the running kernel version
USERNAME=$(whoami)                     # Get the current logged-in user
HOME_DIR=$HOME                         # Get the home directory of the current user
UPTIME=$(uptime -p 2>/dev/null || uptime)  # Get human-readable uptime; fallback if -p not supported

# Get formatted date and time
DATETIME=$(date '+%A, %d %B %Y, %H:%M:%S %Z')   # e.g. Saturday, 22 March 2026, 12:30:00 IST

# Get Linux distribution name — try /etc/os-release first, then lsb_release, then uname
if [ -f /etc/os-release ]; then
    # Source the file and extract the PRETTY_NAME field
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d '=' -f2 | tr -d '"')
elif command -v lsb_release &>/dev/null; then
    # Fallback: use lsb_release command if available
    DISTRO=$(lsb_release -d | cut -d ':' -f2 | xargs)
else
    # If neither method works, use uname as a last resort
    DISTRO=$(uname -o)
fi

# --- DISPLAY ---

# Print top decorative banner
echo "================================================"
echo "   OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT   "
echo "================================================"
echo ""

# Print student and project details
echo "  Student        : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Auditing       : $SOFTWARE_CHOICE"
echo ""

# Print system-level information
echo "  --- System Information ---"
echo "  Distribution   : $DISTRO"
echo "  Kernel Version : $KERNEL"
echo "  Logged-in User : $USERNAME"
echo "  Home Directory : $HOME_DIR"
echo "  System Uptime  : $UPTIME"
echo "  Date & Time    : $DATETIME"
echo ""

# Print GPL v2 license notice about the Linux kernel
echo "  --- License Notice ---"
echo "  This system runs the Linux kernel, licensed"
echo "  under the GNU General Public License v2"
echo "  (GPL v2). Source code is freely available."
echo ""

# Print closing decorative banner
echo "================================================"
echo "       End of System Identity Report            "
echo "================================================"

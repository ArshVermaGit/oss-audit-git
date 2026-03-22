#!/bin/bash
# =============================================================
# Script 4  : Log File Analyzer
# Author    : Arsh Verma (24BCG10026)
# Course    : Open Source Software — CSE0002
# Software  : Git (chosen for OSS Audit)
# Purpose   : Reads a log file line by line, counts lines that
#             match a keyword, and displays the last 5 matches.
#             Accepts log file path and keyword as arguments.
# Usage     : ./script4_log_analyzer.sh <logfile> [keyword]
# Example   : ./script4_log_analyzer.sh /var/log/syslog error
# Date      : March 2026
# =============================================================

# --- USAGE CHECK ---
# If no arguments are given, print a usage message and exit
# $# holds the number of arguments passed to the script
if [ $# -eq 0 ]; then
    echo ""
    echo "  Usage: $0 <log_file_path> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    echo "  Example: $0 /var/log/auth.log WARNING"
    echo ""
    echo "  If keyword is not provided, 'error' is used by default."
    echo ""
    exit 1    # Exit with code 1 to indicate incorrect usage
fi

# --- VARIABLES ---
# $1 is the first command-line argument (log file path)
LOGFILE=$1

# $2 is the optional second argument; default to "error" if not provided
# The :- operator sets a default value if the variable is empty or unset
KEYWORD=${2:-"error"}

COUNT=0          # Counter for lines matching the keyword — starts at zero

echo "=============================================="
echo "          LOG FILE ANALYZER                  "
echo "=============================================="
echo ""
echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo ""

# --- FILE VALIDATION ---
# Check if the provided path is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found or is not a regular file."
    echo "  Please provide a valid log file path."
    exit 1    # Exit with error code — cannot proceed without a valid file
fi

# Check if the file is readable by the current user
if [ ! -r "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' exists but cannot be read."
    echo "  Try running with sudo, or check file permissions."
    exit 1
fi

# --- EMPTY FILE CHECK (do-while style retry) ---
# Check if the file has any content at all
# -s tests if the file has a size greater than zero
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: The file '$LOGFILE' appears to be empty."
    echo "  Attempting to verify file size..."

    # Simulate a retry by checking again after a brief pause
    sleep 1    # Wait 1 second before retrying
    if [ ! -s "$LOGFILE" ]; then
        # File is still empty after retry — inform the user and exit
        echo "  Confirmed: File is empty. No log entries to analyze."
        echo "  Try a different log file, e.g. /var/log/syslog or /var/log/auth.log"
        exit 0    # Exit cleanly (not an error — just nothing to do)
    fi
fi

echo "  Scanning for lines containing: '$KEYWORD' (case-insensitive)"
echo ""
printf '%0.s-' {1..46}
echo ""

# --- WHILE READ LOOP ---
# Read the file line by line
# IFS= prevents leading/trailing whitespace from being stripped
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # Check if the current line contains the keyword (case-insensitive)
    # grep -i = case-insensitive, -q = quiet mode (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Line matches — increment the counter
        # $(( )) is bash arithmetic expansion
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"    # Redirect the file as input to the while loop

# --- SUMMARY OUTPUT ---
echo ""
echo "  Results:"
echo "  --------"
echo "  Keyword  : '$KEYWORD'"
echo "  Log File : $LOGFILE"
echo "  Matches  : $COUNT line(s) found"
echo ""

# --- LAST 5 MATCHING LINES ---
# Show the last 5 lines that matched the keyword for context
# grep -i = case-insensitive matching
# tail -n 5 = take only the last 5 results from the grep output

if [ $COUNT -gt 0 ]; then
    echo "  Last 5 matching lines:"
    printf '%0.s-' {1..46}
    echo ""
    # Pipe grep output to tail to get only the final 5 matches
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    printf '%0.s-' {1..46}
    echo ""
else
    echo "  No matching lines found for keyword: '$KEYWORD'"
    echo "  The log file may use a different term — try: error, ERROR, warn, fail, critical"
fi

echo ""
echo "=============================================="
echo "       End of Log File Analyzer             "
echo "=============================================="

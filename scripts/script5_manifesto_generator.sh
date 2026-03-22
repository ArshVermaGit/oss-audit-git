#!/bin/bash
# =============================================================
# Script 5  : Open Source Manifesto Generator
# Author    : Arsh Verma (24BCG10026)
# Course    : Open Source Software — CSE0002
# Software  : Git (chosen for OSS Audit)
# Purpose   : Interactively collects answers to three questions
#             and generates a personalised open-source philosophy
#             statement, saved to a .txt file.
# Date      : March 2026
# =============================================================

# --- ALIAS DEMONSTRATION (Comment) ---
# In bash, aliases let you create shorthand names for commands.
# For example:
#   alias ll='ls -la'        # ll now works like ls -la
#   alias gs='git status'    # gs now shows git status quickly
#   alias gcm='git commit -m' # gcm replaces a long git command
# Aliases are defined in ~/.bashrc for persistence across sessions.
# They embody the open-source philosophy of making tools work for you.
# (Aliases are shown here as a concept — not executed in this script.)

echo ""
echo "=============================================="
echo "    OPEN SOURCE MANIFESTO GENERATOR          "
echo "=============================================="
echo ""
echo "  Answer three questions to generate your"
echo "  personalised open-source philosophy statement."
echo "  Your answers will be saved to a .txt file."
echo ""
printf '%0.s-' {1..46}
echo ""
echo ""

# --- QUESTION 1 ---
# Use a while loop to validate input — keeps asking until a non-empty answer is given
TOOL=""    # Initialise to empty

while [ -z "$TOOL" ]; do
    # -z tests if a string has zero length (is empty)
    read -p "  1. Name one open-source tool you use every day: " TOOL
    if [ -z "$TOOL" ]; then
        # Answer was empty — prompt the user to try again
        echo "     (Please enter an answer to continue)"
    fi
done

echo ""

# --- QUESTION 2 ---
FREEDOM=""    # Initialise to empty

while [ -z "$FREEDOM" ]; do
    read -p "  2. In one word, what does 'freedom' mean to you?: " FREEDOM
    if [ -z "$FREEDOM" ]; then
        echo "     (Please enter one word to continue)"
    fi
done

echo ""

# --- QUESTION 3 ---
BUILD=""    # Initialise to empty

while [ -z "$BUILD" ]; do
    read -p "  3. Name one thing you would build and share freely: " BUILD
    if [ -z "$BUILD" ]; then
        echo "     (Please enter an answer to continue)"
    fi
done

echo ""
printf '%0.s-' {1..46}
echo ""
echo ""
echo "  Generating your manifesto..."
echo ""

# --- VARIABLES FOR MANIFESTO ---
DATE=$(date '+%d %B %Y')                 # Formatted date, e.g. 22 March 2026
CURRENT_USER=$(whoami)                   # Get the current username for the filename
OUTPUT="manifesto_${CURRENT_USER}.txt"   # Dynamic filename based on who is running the script

# --- COMPOSE THE MANIFESTO ---
# Build a multi-sentence paragraph using string concatenation
# Each sentence is stored in a variable, then combined into MANIFESTO

LINE1="Every day, I rely on $TOOL — a tool built not for profit, but for the freedom to build without barriers."
LINE2="To me, freedom in software means $FREEDOM: the right to read, modify, and share the code that runs our world."
LINE3="If I could give one thing back to the world, it would be $BUILD — open, documented, and freely available to anyone who needs it."
LINE4="Open source is not just a licence — it is a philosophy that says knowledge grows fastest when it is shared."
LINE5="This is my commitment: to use open tools, to contribute where I can, and to never build a wall around knowledge."

# Concatenate all lines into a single manifesto paragraph
# The sentences flow together as one cohesive paragraph
MANIFESTO="$LINE1 $LINE2 $LINE3 $LINE4 $LINE5"

# --- WRITE TO FILE ---
# Use > to create/overwrite the output file with the header
echo "============================================" > "$OUTPUT"
echo "  OPEN SOURCE MANIFESTO" >> "$OUTPUT"            # >> appends to the file
echo "  By: $CURRENT_USER" >> "$OUTPUT"
echo "  Date: $DATE" >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the manifesto paragraph to the file
echo "$MANIFESTO" >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "--------------------------------------------" >> "$OUTPUT"
echo "  Tool I rely on     : $TOOL" >> "$OUTPUT"
echo "  Freedom means      : $FREEDOM" >> "$OUTPUT"
echo "  What I would build : $BUILD" >> "$OUTPUT"
echo "  Generated on       : $DATE" >> "$OUTPUT"
echo "--------------------------------------------" >> "$OUTPUT"

# --- DISPLAY THE MANIFESTO ---
echo "  Your manifesto has been generated:"
echo ""
printf '%0.s=' {1..46}
echo ""
cat "$OUTPUT"    # cat prints the entire file contents to the terminal
printf '%0.s=' {1..46}
echo ""
echo ""

# --- CONFIRM FILE SAVED ---
# Check if the file was actually created and has content
if [ -f "$OUTPUT" ] && [ -s "$OUTPUT" ]; then
    echo "  ✔ Manifesto saved to: $OUTPUT"
    echo "  ✔ Location: $(pwd)/$OUTPUT"
else
    echo "  ✘ Error: Manifesto could not be saved."
fi

echo ""
echo "=============================================="
echo "    End of Open Source Manifesto Generator   "
echo "=============================================="
echo ""

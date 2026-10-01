#!/bin/bash
# Linux Command Line Practical Task
# Reference command sequence. Review workflow/workflow.md before executing.
# Password and nano steps are intentionally interactive.

# Phase 1 — Account setup (run from an appropriately privileged account)
sudo useradd -m student01
sudo passwd student01
# If required:
# sudo usermod -aG sudo student01
# Switch manually:
# su - student01

# The remaining commands are intended to be run as student01.

cd ~
mkdir -p project/docs project/scripts project/bin

cd ~/project/docs
echo "This is the initial report by student01." > report.txt
ls -la
echo "Top Secret." > .secret.txt

# Edit report.txt with nano and add:
# Appended line using nano.
nano report.txt

cp report.txt ../scripts/report.txt
mv .secret.txt ../bin/classified.txt

cd ../scripts
nano install.sh
# Required content:
# #!/bin/bash
# echo "Installing project dependencies..."

chmod a+x install.sh

cd ../bin
chmod o-r classified.txt

cd ../docs
touch admin_notes.txt
chmod 600 admin_notes.txt

rm admin_notes.txt

cd ..
mkdir backup
cp -r docs backup/
cp -r scripts backup/

cd ~
# If tree is not installed:
# sudo apt install tree
tree project

ls -la project/docs
ls -la project/scripts
ls -la project/bin
ls -la project/backup/docs
ls -la project/backup/scripts

# Optional bonus:
# history
# history > ~/commands_used.txt

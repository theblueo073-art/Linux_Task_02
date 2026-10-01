# Linux Command Line Practical Task — Complete Workflow

> **Important:** This workflow follows the uploaded task. It does not add extra lab requirements.

## Phase 1 — Create and Switch to the New User

### Step 1 — Open the terminal

**Run as:** existing account with permission to create users.

Open the Kali Linux terminal.

### Step 2 — Create `student01`

A standard Linux user-creation command can be used:

```bash
sudo useradd -m student01
```

**Expected result:** A new user named `student01` is created with a home directory.

**Verification:**

```bash
id student01
```

### Step 3 — Set the password

```bash
sudo passwd student01
```

Enter and confirm the password when prompted.

**Expected result:** The password for `student01` is set.

### Step 4 — Add to sudo group if required

If the task environment requires `student01` to have sudo access:

```bash
sudo usermod -aG sudo student01
```

**Expected result:** `student01` is added to the `sudo` group.

**Verification:**

```bash
groups student01
```

### Step 5 — Switch to `student01`

```bash
su - student01
```

**Expected result:** The shell changes to the `student01` account.

### Step 6 — Confirm the active user

**Run as:** `student01`

```bash
whoami
```

**Expected result:**

```text
student01
```

**Evidence:** Capture a screenshot showing the `whoami` result.

---

## Phase 2 — Directory and File Management

### Step 1 — Create the project directories

**Run as:** `student01`

From the new user's home directory:

```bash
cd ~
mkdir -p project/docs project/scripts project/bin
```

**Expected result:**

```text
~/project/
├── docs/
├── scripts/
└── bin/
```

**Verification:**

```bash
ls -la project
```

**Evidence:** Capture the directory listing.

### Step 2 — Create `report.txt` with `echo`

```bash
cd ~/project/docs
echo "This is the initial report by student01." > report.txt
```

**Expected result:** `report.txt` contains the required first line.

**Verification:**

```bash
cat report.txt
```

### Step 3 — View hidden files and directories

```bash
ls -la
```

**Expected result:** The listing includes hidden entries such as `.` and `..`.

### Step 4 — Create the hidden file

```bash
echo "Top Secret." > .secret.txt
```

**Verification:**

```bash
ls -la
cat .secret.txt
```

**Expected result:** `.secret.txt` exists and contains `Top Secret.`.

**Evidence:** Capture the `ls -la` and content verification.

---

## Phase 3 — Edit and Move Files

### Step 1 — Edit `report.txt` with nano

```bash
nano report.txt
```

Add the second line exactly:

```text
Appended line using nano.
```

Save the file and exit nano.

**Verification:**

```bash
cat report.txt
```

**Expected result:**

```text
This is the initial report by student01.
Appended line using nano.
```

**Evidence:** Capture the final file content after saving.

### Step 2 — Copy `report.txt` to `scripts`

```bash
cp report.txt ../scripts/report.txt
```

**Verification:**

```bash
ls -la ../scripts
```

**Expected result:** `report.txt` exists in `project/scripts`.

### Step 3 — Move and rename `.secret.txt`

From `project/docs`:

```bash
mv .secret.txt ../bin/classified.txt
```

**Verification:**

```bash
ls -la .
ls -la ../bin
```

**Expected result:** `.secret.txt` is no longer in `docs`, and `classified.txt` is present in `bin`.

### Step 4 — Create `install.sh`

```bash
cd ../scripts
nano install.sh
```

Enter exactly:

```bash
#!/bin/bash
echo "Installing project dependencies..."
```

Save and exit.

**Verification:**

```bash
cat install.sh
```

---

## Phase 4 — Permissions with chmod

### Step 1 — Make `install.sh` executable by all users

From `project/scripts`:

```bash
chmod a+x install.sh
```

**Expected result:** Execute permission is set for user, group, and others.

**Verification:**

```bash
ls -la install.sh
```

### Step 2 — Remove read permission for others from `classified.txt`

```bash
cd ../bin
chmod o-r classified.txt
```

**Expected result:** The `other` class no longer has read permission.

**Verification:**

```bash
ls -la classified.txt
```

### Step 3 — Create `admin_notes.txt`

```bash
cd ../docs
touch admin_notes.txt
```

Set permission so only the owner can read and write:

```bash
chmod 600 admin_notes.txt
```

**Verification:**

```bash
ls -la admin_notes.txt
```

**Expected permission pattern:** `-rw-------` (subject to normal file-type display).

**Evidence:** Capture the permission listing.

---

## Phase 5 — Clean-Up and Final Touches

### Step 1 — Delete `admin_notes.txt`

```bash
rm admin_notes.txt
```

**Verification:**

```bash
ls -la
```

**Expected result:** `admin_notes.txt` is absent.

### Step 2 — Create `backup`

From `project/docs`:

```bash
cd ..
mkdir backup
```

**Expected result:** `project/backup` exists.

### Step 3 — Copy the entire content of `docs` and `scripts` into `backup`

Use:

```bash
cp -r docs backup/
cp -r scripts backup/
```

**Verification:**

```bash
ls -la backup
ls -la backup/docs
ls -la backup/scripts
```

**Expected result:** The contents of `docs` and `scripts` are represented under:

```text
project/backup/docs/
project/backup/scripts/
```

---

## Phase 6 — Final Checks

### Step 1 — Return to the home directory

```bash
cd ~
```

### Step 2 — Run `tree project`

If `tree` is not installed, follow the task instruction:

```bash
sudo apt install tree
```

Then:

```bash
tree project
```

**Expected result:** The command displays the project directory hierarchy.

**Evidence:** Capture a screenshot of the final tree.

### Step 3 — Check permissions and locations

Use `ls -la` as required:

```bash
ls -la project/docs
ls -la project/scripts
ls -la project/bin
ls -la project/backup/docs
ls -la project/backup/scripts
```

**Expected result:** Files are in their required locations and the permission changes can be verified.

**Evidence:** Capture clear screenshots of the final permission listings.

---

## Phase 7 — Optional Bonus: Command History

The task makes this optional.

List commands used:

```bash
history
```

To redirect history to the required file in the home directory:

```bash
history > ~/commands_used.txt
```

Verify:

```bash
ls -la ~/commands_used.txt
cat ~/commands_used.txt
```

**Expected result:** `commands_used.txt` contains the shell history captured by the command.

---

## Final Checklist

- [ ] `student01` created.
- [ ] Password set.
- [ ] Added to sudo group if required.
- [ ] Switched to `student01`.
- [ ] `whoami` confirms `student01`.
- [ ] `project/docs`, `project/scripts`, and `project/bin` created.
- [ ] `docs/report.txt` created with `echo`.
- [ ] Second report line added using `nano`.
- [ ] `report.txt` copied to `scripts`.
- [ ] `.secret.txt` moved to `bin` and renamed `classified.txt`.
- [ ] `scripts/install.sh` created with the required content.
- [ ] `install.sh` made executable by all users.
- [ ] Read permission for others removed from `classified.txt`.
- [ ] `admin_notes.txt` created with owner-only read/write permission.
- [ ] `admin_notes.txt` deleted.
- [ ] `backup` created.
- [ ] `docs` and `scripts` contents copied into `backup`.
- [ ] Final `tree project` performed.
- [ ] Final `ls -la` checks performed.
- [ ] Optional `commands_used.txt` created if completing the bonus.

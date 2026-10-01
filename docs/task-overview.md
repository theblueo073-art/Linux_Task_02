# Task Overview

## Objective

Demonstrate understanding of basic Linux commands by completing the activity as a newly created user in Kali Linux.

## Required Account

- Username: `student01`
- Set a password.
- Add the user to the sudo group if required.
- Switch to the new user.
- Verify with `whoami`.

## Required Project Structure

Create:

```text
project/
├── docs/
├── scripts/
└── bin/
```

Later create:

```text
project/backup/
```

## Required Files and Operations

### `docs/report.txt`

Create with `echo` using:

```text
This is the initial report by student01.
```

Then open it with `nano` and add:

```text
Appended line using nano.
```

### `docs/.secret.txt`

Create with:

```text
Top Secret.
```

Then move it to `bin` and rename it:

```text
classified.txt
```

### `scripts/install.sh`

Required content:

```bash
#!/bin/bash
echo "Installing project dependencies..."
```

Make it executable by all users.

### `docs/admin_notes.txt`

Create it and set permissions so only the owner can read and write it. Then delete it during cleanup.

## Final Checks

From the home directory:

```bash
tree project
ls -la
```

The task also requires checking that permissions and file locations are correct.

## Optional Bonus

Use:

```bash
history
```

and redirect the history to:

```text
commands_used.txt
```

in the home directory using `>`.

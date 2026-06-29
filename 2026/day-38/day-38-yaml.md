## Challenge Tasks

### Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (a boolean)

**Verify:** Run `cat person.yaml` — does it look clean? No tabs?

```bash
# person.yml file

name: Khushi
role: Devops Engineer
experience_years: senior level
learning: true
```
---

### Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using the inline format `[item1, item2]`

Write in your notes: What are the two ways to write a list in YAML?
```bash
# person.yml file

name: Khushi
role: Devops Engineer
experience_years: senior level
learning: true
tools:
    - linux
    - shell scripts
    - docker
    - ci/cd
    - kubernetes
hobbies: ["Reading","Playing badminton","Drawing"]
```

---

### Task 3: Nested Objects
Create `server.yaml` that describes a server:
- `server` with nested keys: `name`, `ip`, `port`
- `database` with nested keys: `host`, `name`, `credentials` (nested further: `user`, `password`)

**Verify:** Try adding a tab instead of spaces — what happens when you validate it?
```bash
If tab is used instaed of adding spaces than it will likely throw a syntax error
```

```bash
# server.yml file

server: 
    name: Khushi
    ip: 173.62.0.0
    port: 80
database:
    host: khushi
    name: khushigoel
    credentials:
        user: khushigoel44
        password: test123@
```
---

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
2. The `>` fold style (folds into one line)
```bash
# server.yml file

server: 
    name: Khushi
    ip: 173.62.0.0
    port: 80
database:
    host: khushi
    name: khushigoel
    credentials:
        user: khushigoel44
        password: test123@
startup_script: |
    echo "starting server"
    npm install
    npm run
startup_script_folded: >
    echo" This is a very long script
    that is using up multiple lines
    of cade and therefore is the 
    perfect example of using ">" symbol"
```

Write in your notes: When would you use `|` vs `>`?
```bash
1. "|": It is used when the line breaks matter.
Mainly used with shell scripts.
2. ">": It is used when the line breaks don't matter.
Mainly used for long descriptions.
```

---

### Task 5: Validate Your YAML
```bash
Validated both the yml files 
```

---

### Task 6: Spot the Difference
Read both blocks and write what's wrong with the second one:
```bash
As for the 2nd block, the indentation block for docker is not accurate.
It is not in accordance with the kubernetes block rather it is in accordance with the tools block, which is wrong!
```

```yaml
# Block 1 - correct
name: devops
tools:
  - docker
  - kubernetes
```

```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```

---

## Hints
- YAML uses **spaces only** — never tabs
- Indentation is everything — 2 spaces is standard
- Strings don't need quotes unless they contain special characters (`:`, `#`, etc.)
- `true`/`false` are booleans, `"true"` is a string
- Validate online: yamllint.com

---

## What I Learnt
```bash
1. How to write simple yml files
2. How to validate yml file using online tools like yamllint.com
3. How to frame key-value pairs in yml file
```


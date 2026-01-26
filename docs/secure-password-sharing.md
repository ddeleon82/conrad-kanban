# Secure Password Sharing with AI Assistants

*Research Document — January 2026*

## 1. Problem Analysis

### The Core Issue
When working with an AI assistant (like Conrad/Clawdbot), there are legitimate needs to share credentials:
- Logging into services on the user's behalf
- Automating tasks that require authentication
- Managing infrastructure and deployments

**The problem:** Pasting passwords directly in chat creates multiple security risks:

1. **Chat Log Persistence** — Conversation history is stored (locally and/or remotely), creating a permanent record of plaintext passwords
2. **Context Window Exposure** — Passwords remain in the AI's context, potentially leaking into summaries or memories
3. **Shoulder Surfing** — Passwords are visible on screen during the conversation
4. **Log Aggregation** — System logs, debugging tools, or telemetry might capture the conversation
5. **Backup Exposure** — Chat logs get included in system backups, cloud syncs, etc.

### Current Setup
- **Password Manager:** Proton Pass (no CLI available as of January 2026)
- **Platform:** macOS (Apple Silicon)
- **AI Assistant:** Clawdbot (runs locally with shell access)

---

## 2. Proposed Solutions

### Solution Comparison Matrix

| Solution | Security | Practicality | Setup Effort | Proton Pass Compatible |
|----------|----------|--------------|--------------|------------------------|
| macOS Keychain | ★★★★☆ | ★★★★★ | Low | Manual entry |
| 1Password CLI | ★★★★★ | ★★★★☆ | Medium | Requires migration |
| Bitwarden CLI | ★★★★☆ | ★★★★☆ | Medium | Requires migration |
| SOPS + age | ★★★★☆ | ★★★☆☆ | Medium | Manual entry |
| Environment Variables | ★★☆☆☆ | ★★★★★ | Low | Manual entry |
| Encrypted Secrets File | ★★★☆☆ | ★★★☆☆ | Low | Manual entry |

---

### 2.1 Environment Variables Approach

**How it works:** Store secrets in environment variables that Clawdbot can read at runtime.

```bash
# In ~/.zshrc or ~/.bashrc (NOT RECOMMENDED - see below)
export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"

# Better: Load from a file not in version control
source ~/.secrets/credentials.env
```

**Pros:**
- Simple to implement
- Native to shell workflows
- Clawdbot has immediate access via `$VARIABLE`

**Cons:**
- ⚠️ Environment variables are visible to all child processes
- ⚠️ Can leak into process listings (`ps aux`)
- ⚠️ Persists in shell history if set inline
- ⚠️ `.env` files are plaintext

**Security Rating:** ★★☆☆☆ (Acceptable only for non-critical secrets)

---

### 2.2 macOS Keychain (RECOMMENDED)

**How it works:** Use the built-in macOS Keychain to store secrets, retrievable via the `security` command.

```bash
# Store a password
security add-generic-password -a "conrad" -s "github-token" -w "ghp_xxxxxxxxxxxx"

# Retrieve a password (prompts for Touch ID / password)
security find-generic-password -a "conrad" -s "github-token" -w
```

**Integration with Clawdbot:**

```bash
# Conrad can retrieve secrets without them appearing in chat
GITHUB_TOKEN=$(security find-generic-password -a "conrad" -s "github-token" -w)
```

**Pros:**
- ✅ Built into macOS — no additional software
- ✅ Protected by system security (Touch ID, password)
- ✅ Secrets never appear in chat logs
- ✅ Can control per-app access permissions
- ✅ Encrypted at rest with Secure Enclave

**Cons:**
- Manual entry required (no sync from Proton Pass)
- Limited to macOS
- First access from Terminal requires one-time authorization

**Security Rating:** ★★★★☆

**Setup Instructions:**

```bash
# 1. Create a dedicated keychain for Conrad (optional but recommended)
security create-keychain -p "" conrad.keychain-db

# 2. Add to keychain search list
security list-keychains -s ~/Library/Keychains/conrad.keychain-db login.keychain-db

# 3. Store secrets (using login keychain for simplicity)
security add-generic-password -a "conrad" -s "service-name" -w "your-secret-here"

# 4. Test retrieval
security find-generic-password -a "conrad" -s "service-name" -w
```

---

### 2.3 1Password CLI (BEST-IN-CLASS)

**How it works:** 1Password's CLI (`op`) provides secret references that inject credentials at runtime without exposing them.

```bash
# Install
brew install 1password-cli

# Sign in (biometric with 1Password app)
eval $(op signin)

# Read a secret
op read "op://Personal/GitHub/password"

# Inject into environment
export GITHUB_TOKEN="op://Personal/GitHub/token"
op run -- your-command
```

**Key Features:**
- **Secret References:** `op://vault/item/field` syntax keeps secrets out of code
- **Biometric Unlock:** Touch ID integration
- **Service Accounts:** For automation without interactive login
- **Shell Plugins:** Auto-authenticate CLIs (AWS, GitHub, etc.)

**Pros:**
- ✅ Industry-leading security model
- ✅ Secrets never appear in plaintext
- ✅ Works across teams
- ✅ Excellent CLI documentation
- ✅ Automatic secret rotation support

**Cons:**
- Requires 1Password subscription ($36/year)
- Migration from Proton Pass needed
- Adds dependency on external service

**Security Rating:** ★★★★★

**Setup Instructions:**

```bash
# 1. Install 1Password CLI
brew install --cask 1password
brew install 1password-cli

# 2. Enable CLI integration in 1Password app
# Settings > Developer > Enable CLI integration

# 3. Sign in
op signin

# 4. Store secrets (via app or CLI)
op item create --category=login --title="GitHub API" \
  --vault="Personal" \
  password="your-token-here"

# 5. Use in scripts
#!/bin/bash
GITHUB_TOKEN=$(op read "op://Personal/GitHub API/password")
```

---

### 2.4 Bitwarden CLI

**How it works:** Similar to 1Password, Bitwarden offers a CLI (`bw`) for secrets management.

```bash
# Install
brew install bitwarden-cli

# Login and unlock
bw login
export BW_SESSION=$(bw unlock --raw)

# Retrieve a password
bw get password "GitHub"

# Or by item ID
bw get item 12345678-1234-1234-1234-123456789012 | jq -r '.login.password'
```

**Pros:**
- ✅ Open source
- ✅ Free tier available
- ✅ Self-hosting option
- ✅ Good CLI support

**Cons:**
- Session tokens required (less seamless than 1Password)
- No biometric unlock in CLI (requires master password)
- Less polished than 1Password CLI

**Security Rating:** ★★★★☆

---

### 2.5 SOPS + age (Encrypted Files)

**How it works:** SOPS encrypts YAML/JSON files with `age` keys. Secrets are stored encrypted in your repo/filesystem and decrypted at runtime.

```bash
# Install
brew install sops age

# Generate an age key
age-keygen -o ~/.config/sops/age/keys.txt

# Create encrypted secrets file
sops secrets.yaml
# Opens editor, saves encrypted

# Decrypt at runtime
sops -d secrets.yaml

# Extract single value
sops -d --extract '["github_token"]' secrets.yaml
```

**Example `secrets.yaml` (encrypted):**
```yaml
github_token: ENC[AES256_GCM,data:abc123...,type:str]
database_password: ENC[AES256_GCM,data:xyz789...,type:str]
sops:
    age:
        - recipient: age1...
          enc: |
            -----BEGIN AGE ENCRYPTED FILE-----
            ...
```

**Pros:**
- ✅ Files can be safely committed to git
- ✅ Works with any infrastructure
- ✅ Supports multiple encryption backends
- ✅ No external service dependency

**Cons:**
- More complex setup
- Manual secret entry/update
- Key management responsibility

**Security Rating:** ★★★★☆

---

### 2.6 Proton Pass CLI Status

**Current State (January 2026):** No official CLI exists.

- Proton Pass is available as desktop app via `brew install --cask proton-pass`
- Browser extensions available for major browsers
- No API or CLI for programmatic access

**Workarounds:**
1. Manually copy secrets from Proton Pass to macOS Keychain for CLI access
2. Export from Proton Pass and import to 1Password/Bitwarden
3. Use browser automation (not recommended for security)

---

### 2.7 Hardware Security Keys

**YubiKey Integration:**

For highly sensitive operations, a YubiKey can add physical 2FA:

```bash
# With 1Password
op signin --account personal  # Requires YubiKey touch

# With GPG/age (SOPS)
gpg --card-edit  # Configure YubiKey for GPG
```

**Pros:**
- Physical possession required
- Immune to remote attacks
- Works offline

**Cons:**
- Additional hardware cost (~$50)
- Not convenient for frequent access
- Doesn't solve the "sharing with AI" problem directly

---

## 3. Recommended Solution

### Primary: macOS Keychain

For your setup (Proton Pass + macOS + Clawdbot), **macOS Keychain is the best starting point**:

1. **Zero additional cost or software**
2. **Native system security** (Touch ID)
3. **Simple integration** with shell commands
4. **Clawdbot can access secrets** without them appearing in chat

### Setup Guide

#### Step 1: Organize Your Secrets

Create a naming convention:
```
Account: conrad
Service: {provider}-{purpose}

Examples:
- github-token
- aws-access-key
- openai-api-key
- database-production
```

#### Step 2: Add Secrets to Keychain

```bash
# Add each secret
security add-generic-password -a "conrad" -s "github-token" -w

# You'll be prompted to enter the password (won't appear on screen)
```

Or with the password inline (less secure, visible in history):
```bash
security add-generic-password -a "conrad" -s "github-token" -w "ghp_xxx"
```

#### Step 3: Grant Terminal Access

The first time you retrieve a secret, macOS will prompt:
> "Terminal wants to use your confidential information stored in 'github-token' in your keychain."

Click **"Always Allow"** to enable future access without prompts.

#### Step 4: Create a Helper Script

Save as `~/.local/bin/get-secret`:
```bash
#!/bin/bash
# Usage: get-secret github-token

SERVICE="$1"
if [ -z "$SERVICE" ]; then
  echo "Usage: get-secret <service-name>" >&2
  exit 1
fi

security find-generic-password -a "conrad" -s "$SERVICE" -w 2>/dev/null
```

```bash
chmod +x ~/.local/bin/get-secret
```

#### Step 5: Use in Clawdbot Sessions

Instead of pasting passwords in chat:

```bash
# Conrad can run:
GITHUB_TOKEN=$(get-secret github-token) gh api /user
```

The password is **never visible** in the chat log or command output.

### Secondary: Consider 1Password (Future)

If you find yourself needing:
- Cross-device sync for CLI credentials
- Team sharing
- Service accounts for automation
- Better secret organization

Then migrating to 1Password is worth the $36/year investment. Their CLI is the most polished solution available.

---

## 4. Security Considerations

### ✅ Best Practices

1. **Never paste passwords in chat** — Use Keychain/CLI retrieval
2. **Use unique service names** — Avoid generic names like "password"
3. **Rotate secrets regularly** — Especially after any potential exposure
4. **Audit keychain access** — `security dump-keychain` shows metadata
5. **Use short-lived tokens** — Where possible (GitHub fine-grained tokens, AWS STS)
6. **Separate vaults** — Different keychains for different trust levels

### ⚠️ Risk Acknowledgments

Even with these protections:
- **Clawdbot has shell access** — Any secret it can retrieve, it can potentially misuse
- **Memory exposure** — Decrypted secrets exist in process memory briefly
- **Log files** — Ensure commands using secrets don't log them

### 🔒 Mitigation Strategies

```bash
# Don't log commands with secrets
HISTCONTROL=ignorespace  # Commands starting with space aren't saved
 GITHUB_TOKEN=$(get-secret github-token)  # Note leading space

# Use subshells to limit scope
(export TOKEN=$(get-secret github-token); sensitive-command)

# Clear environment after use
unset GITHUB_TOKEN
```

---

## 5. What NOT To Do (Anti-Patterns)

### ❌ Pasting Passwords in Chat
```
User: Hey Conrad, the password is hunter2
```
This creates a permanent record in chat logs.

### ❌ Storing Passwords in Plaintext Files
```bash
# ~/.secrets/passwords.txt
github=hunter2
```
No encryption, easily exposed.

### ❌ Hardcoding in Scripts
```bash
#!/bin/bash
curl -H "Authorization: token ghp_xxxxxxxxxxxx" ...
```
Will end up in git history, backups, etc.

### ❌ Inline Passwords in Commands
```bash
mysql -u root -pMySecretPassword
```
Visible in process lists and shell history.

### ❌ Environment Variables in .bashrc
```bash
export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxx"
```
Loaded in every shell, visible to all processes.

### ❌ Trusting "Delete After Reading" Messages
Chat histories are often retained even when "deleted" from view.

---

## 6. Quick Reference

### Add a Secret
```bash
security add-generic-password -a "conrad" -s "service-name" -w
```

### Retrieve a Secret
```bash
security find-generic-password -a "conrad" -s "service-name" -w
```

### List All Secrets
```bash
security dump-keychain | grep -A4 "class: \"genp\""
```

### Delete a Secret
```bash
security delete-generic-password -a "conrad" -s "service-name"
```

### Update a Secret
```bash
# Delete then re-add (no direct update command)
security delete-generic-password -a "conrad" -s "service-name"
security add-generic-password -a "conrad" -s "service-name" -w
```

---

## 7. Implementation Checklist

- [ ] Set up `get-secret` helper script
- [ ] Migrate critical API tokens to Keychain
- [ ] Test retrieval from Clawdbot session
- [ ] Grant Terminal "Always Allow" access
- [ ] Document which secrets are stored where
- [ ] Set calendar reminder for secret rotation review

---

*Document maintained by Conrad. Last updated: January 2026.*

# 🔐 Download Files from a Private GitHub Repository

This script allows you to securely download **one or more files** from a **private GitHub repository** using a **Personal Access Token (PAT)**. It preserves directory structure and supports an optional target directory for downloads.

---

## 📦 Features

- ✅ Download from **private** GitHub repositories
- 📁 Supports **multiple files** in one command
- 📂 Automatically creates necessary directories
- 📍 Optional **target download folder**
- ⚠️ Gracefully skips files that don't exist or fail to download

---

## 🧰 Requirements

- `bash`
- `curl`

---

## 🚀 Usage

```bash
./download-github-files.sh <token> <username> <repo> <branch> <target_dir> <file1> [file2 file3 ...]
```
## ✅ Example

```bash
./download-github-files.sh ghp_YourGitHubTokenHere your-username your-private-repo main ./downloads \
  config/app.conf \
  scripts/setup.sh \
  data/sample.json
```

### ✅ This will download:

- config/app.conf → ./downloads/config/app.conf
- scripts/setup.sh → ./downloads/scripts/setup.sh
- data/sample.json → ./downloads/data/sample.json

## 🧪 Parameters

| Parameter     | Required | Description                                                        | Example                          |
|---------------|----------|--------------------------------------------------------------------|----------------------------------|
| `token`       | ✅       | GitHub Personal Access Token (PAT) with `repo` scope               | `ghp_ABC123...`                  |
| `username`    | ✅       | GitHub username                                                    | `johnsmith`                      |
| `repo`        | ✅       | Name of the private GitHub repository                              | `my-private-repo`                |
| `branch`      | ✅       | Branch name where the files are located                            | `main`, `dev`, etc.              |
| `target_dir`  | 📍       | Local directory where files will be downloaded                     | `./downloads`                    |
| `file1..n`    | ✅       | One or more file paths to download (relative to repo root)         | `config/app.conf`, `scripts/x.sh` |

## 📥 How to use this script

You can download and execute this script directly using curl:

```bash
curl -sSL https://raw.githubusercontent.com/mohamedbenhariz/download-github-files/main/download-github-files.sh -o download-github-files.sh
chmod +x download-github-files.sh
```
Then run it:

```bash
./download-github-files.sh ghp_YourGitHubTokenHere your-username your-private-repo main ./downloads \
  config/app.conf \
  scripts/setup.sh \
  data/sample.json
```

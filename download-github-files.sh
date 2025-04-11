#!/bin/bash

# === ✅ Usage instruction ===
if [ "$#" -lt 5 ]; then
  echo "Usage:"
  echo "  $0 <github_token> <username> <repo> <branch> <target_dir (optional)> <file1> [file2 file3 ...]"
  echo
  echo "Example:"
  echo "  $0 ghp_XXXX user my-private-repo main ./downloads config/settings.conf scripts/setup.sh"
  exit 1
fi

# === 📥 Input Variables ===
GITHUB_TOKEN="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
GITHUB_BRANCH="$4"
TARGET_DIR="$5"
shift 5
FILES=("$@")

# === 🚀 Download each file ===
for FILE_PATH in "${FILES[@]}"; do
  FILE_URL="https://raw.githubusercontent.com/$GITHUB_USERNAME/$GITHUB_REPO/$GITHUB_BRANCH/$FILE_PATH"
  LOCAL_PATH="$TARGET_DIR/$FILE_PATH"

  echo "📥 Downloading $FILE_PATH → $LOCAL_PATH"

  mkdir -p "$(dirname "$LOCAL_PATH")"

  curl -sSL -H "Authorization: token $GITHUB_TOKEN" \
       -o "$LOCAL_PATH" \
       "$FILE_URL"

  if [ $? -eq 0 ] && [ -s "$LOCAL_PATH" ]; then
    echo "✅ Downloaded: $FILE_PATH"
  else
    echo "⚠️  Warning: Failed to download $FILE_PATH (skipping)"
    rm -f "$LOCAL_PATH"  # clean up if incomplete
  fi
done

echo "🎉 Done."

#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PUBLISH_DIR="${PUBLISH_DIR:-/tmp/ikujinavi-gh-pages}"

cd "$ROOT"

git fetch origin --prune >/dev/null

if ! git -C "$PUBLISH_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  rm -rf "$PUBLISH_DIR"
  git worktree prune >/dev/null
  git worktree add -f "$PUBLISH_DIR" gh-pages >/dev/null
fi

git -C "$PUBLISH_DIR" fetch origin --prune >/dev/null
git -C "$PUBLISH_DIR" checkout gh-pages >/dev/null
git -C "$PUBLISH_DIR" reset --hard origin/gh-pages >/dev/null

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

mkdir -p "$TMP_DIR/current" "$TMP_DIR/published"
cp "$ROOT/index.html" "$ROOT/styles.css" "$TMP_DIR/current/"
for optional_file in robots.txt sitemap.xml; do
  if [ -f "$ROOT/$optional_file" ]; then
    cp "$ROOT/$optional_file" "$TMP_DIR/current/"
  fi
  if [ -f "$PUBLISH_DIR/$optional_file" ]; then
    cp "$PUBLISH_DIR/$optional_file" "$TMP_DIR/published/"
  fi
done
rsync -a --delete "$ROOT/articles/" "$TMP_DIR/current/articles/"
cp "$PUBLISH_DIR/index.html" "$PUBLISH_DIR/styles.css" "$TMP_DIR/published/"
rsync -a --delete "$PUBLISH_DIR/articles/" "$TMP_DIR/published/articles/"

if diff -qr "$TMP_DIR/current" "$TMP_DIR/published"; then
  echo "OK: gh-pages matches master publishable files."
else
  echo "ERROR: gh-pages is behind master publishable files. Run ./scripts/publish-gh-pages.sh" >&2
  exit 1
fi

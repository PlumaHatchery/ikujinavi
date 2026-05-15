#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PUBLISH_DIR="${PUBLISH_DIR:-/tmp/ikujinavi-gh-pages}"

cd "$ROOT"

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "ERROR: working tree has uncommitted changes. Commit master changes first." >&2
  git status --short >&2
  exit 1
fi

git fetch origin --prune

if [ ! -d "$PUBLISH_DIR/.git" ]; then
  rm -rf "$PUBLISH_DIR"
  git worktree prune
  git worktree add -f "$PUBLISH_DIR" gh-pages
fi

git -C "$PUBLISH_DIR" fetch origin --prune
git -C "$PUBLISH_DIR" checkout gh-pages
git -C "$PUBLISH_DIR" reset --hard origin/gh-pages

cp "$ROOT/index.html" "$ROOT/styles.css" "$PUBLISH_DIR/"
rsync -a --delete "$ROOT/articles/" "$PUBLISH_DIR/articles/"

git -C "$PUBLISH_DIR" diff --check

git -C "$PUBLISH_DIR" add index.html styles.css articles
if git -C "$PUBLISH_DIR" diff --cached --quiet; then
  echo "No gh-pages changes to publish."
  exit 0
fi

git -C "$PUBLISH_DIR" commit -m "Publish latest site updates"
git -C "$PUBLISH_DIR" push origin gh-pages

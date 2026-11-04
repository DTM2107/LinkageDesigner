#!/usr/bin/env bash
# One-step publish: creates the GitHub repo, pushes this folder, turns on GitHub Pages.
# Usage: ./publish.sh [repo-name]     (needs git; the GitHub CLI "gh" makes it fully automatic)
set -e
REPO="${1:-linkage-sketcher}"
cd "$(dirname "$0")"
[ -d .git ] || git init -b main
git add -A
git commit -m "Add linkage sketcher" || true
if command -v gh >/dev/null 2>&1; then
  gh auth status >/dev/null 2>&1 || gh auth login
  gh repo create "$REPO" --public --source=. --remote=origin --push
  OWNER=$(gh api user --jq .login)
  gh api -X POST "repos/$OWNER/$REPO/pages" -f build_type=workflow || true
  gh workflow run pages.yml || true
  echo "Live in a minute or two at: https://$OWNER.github.io/$REPO/"
else
  echo "GitHub CLI (gh) not found. Follow the manual steps in README.md."
fi

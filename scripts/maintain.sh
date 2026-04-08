#!/usr/bin/env bash
# maintain.sh — Automated maintenance checks for My Brain knowledge base
# Usage: ./scripts/maintain.sh
# Outputs a report of issues found. Exit code 0 = clean, 1 = issues found.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ISSUES=0
TODAY=$(date +%Y-%m-%d)

red()   { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }
yellow(){ printf '\033[33m%s\033[0m\n' "$*"; }
bold()  { printf '\033[1m%s\033[0m\n' "$*"; }

issue() { ISSUES=$((ISSUES + 1)); red "  ✗ $*"; }
ok()    { green "  ✓ $*"; }

# ─── 1. Broken References ────────────────────────────────────────────
bold "1. Broken References (sources & related paths in frontmatter)"
PREV_ISSUES=$ISSUES

while IFS= read -r file; do
  in_frontmatter=false
  in_list=""
  while IFS= read -r line; do
    [[ "$line" == "---" && "$in_frontmatter" == false ]] && in_frontmatter=true && continue
    [[ "$line" == "---" && "$in_frontmatter" == true ]] && break

    if [[ "$line" =~ ^(sources|related): ]]; then
      in_list="${BASH_REMATCH[1]}"
      continue
    fi

    if [[ -n "$in_list" && ! "$line" =~ ^[[:space:]]*- ]]; then
      in_list=""
      continue
    fi

    if [[ -n "$in_list" && "$line" =~ ^[[:space:]]*-[[:space:]]*(.*) ]]; then
      ref="${BASH_REMATCH[1]}"
      filedir="$(dirname "$file")"
      resolved="$(cd "$filedir" && realpath -q "$ref" 2>/dev/null || echo "")"
      if [[ -z "$resolved" || ! -f "$resolved" ]]; then
        relfile="${file#$ROOT/}"
        issue "$relfile → $ref (file not found)"
      fi
    fi
  done < "$file"
done < <(find "$ROOT/wiki" -name '*.md' | sort)

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "No broken references"

# ─── 2. Orphan Pages ─────────────────────────────────────────────────
bold "2. Orphan Pages (wiki pages not referenced by any other wiki page)"
PREV_ISSUES=$ISSUES

while IFS= read -r file; do
  basename_file="$(basename "$file")"
  count=$(grep -rl "$basename_file" "$ROOT/wiki" 2>/dev/null | grep -cv "^$file$" || true)
  if [[ "$count" -eq 0 ]]; then
    idx_count=$(grep -c "$basename_file" "$ROOT/index.md" 2>/dev/null || echo 0)
    if [[ "$idx_count" -eq 0 ]]; then
      relfile="${file#$ROOT/}"
      issue "ORPHAN: $relfile (no incoming links from other wiki pages)"
    fi
  fi
done < <(find "$ROOT/wiki" -name '*.md' | sort)

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "No orphan pages"

# ─── 3. Stale Pages ──────────────────────────────────────────────────
bold "3. Stale Pages (updated 90+ days ago)"
PREV_ISSUES=$ISSUES

NINETY_DAYS_AGO=$(date -v-90d +%Y-%m-%d 2>/dev/null || date -d "90 days ago" +%Y-%m-%d 2>/dev/null || echo "")

if [[ -n "$NINETY_DAYS_AGO" ]]; then
  while IFS= read -r file; do
    updated=$(grep -m1 '^updated:' "$file" 2>/dev/null | sed 's/updated:[[:space:]]*//')
    if [[ -n "$updated" && "$updated" < "$NINETY_DAYS_AGO" ]]; then
      relfile="${file#$ROOT/}"
      issue "STALE: $relfile (last updated: $updated)"
    fi
  done < <(find "$ROOT/wiki" -name '*.md' | sort)
  [[ $ISSUES -eq $PREV_ISSUES ]] && ok "No stale pages"
else
  yellow "  ⚠ Could not compute 90-day threshold, skipping stale check"
fi

# ─── 4. Tag Consistency ──────────────────────────────────────────────
bold "4. Tag Consistency (must be lowercase, hyphenated)"
PREV_ISSUES=$ISSUES

ALL_TAGS=$(find "$ROOT/wiki" "$ROOT/sources" -name '*.md' -exec grep -h '^tags:' {} \; 2>/dev/null \
  | sed 's/tags:[[:space:]]*\[//;s/\]//' \
  | tr ',' '\n' \
  | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' \
  | sort -u)

while IFS= read -r tag; do
  [[ -z "$tag" ]] && continue
  if [[ "$tag" =~ [A-Z] ]]; then
    issue "Tag has uppercase: '$tag'"
  fi
  if [[ "$tag" =~ [[:space:]] && ! "$tag" =~ ^\".*\"$ ]]; then
    issue "Tag has spaces: '$tag'"
  fi
  if [[ "$tag" =~ _ ]]; then
    issue "Tag uses underscore (should be hyphen): '$tag'"
  fi
done <<< "$ALL_TAGS"

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "All tags are lowercase/hyphenated"

# ─── 5. Entity Coverage (source authors → wiki/people/) ─────────────
bold "5. Entity Coverage (every source author has a wiki/people page)"
PREV_ISSUES=$ISSUES

# Build a list of all people titles for matching
PEOPLE_TITLES=()
for people_file in "$ROOT"/wiki/people/*.md; do
  [[ ! -f "$people_file" ]] && continue
  title=$(grep -m1 '^title:' "$people_file" 2>/dev/null | sed 's/title:[[:space:]]*//')
  PEOPLE_TITLES+=("$title")
done

while IFS= read -r file; do
  # Extract author field, preserving spaces
  author_line=$(grep -m1 '^author:' "$file" 2>/dev/null || echo "")
  [[ -z "$author_line" ]] && continue
  author_value=$(echo "$author_line" | sed 's/^author:[[:space:]]*//')

  # Handle array-style authors: [Name1, Name2]
  if [[ "$author_value" =~ ^\[.*\]$ ]]; then
    # Strip brackets and split by comma
    stripped=$(echo "$author_value" | sed 's/^\[//;s/\]$//')
    IFS=',' read -ra authors <<< "$stripped"
  else
    authors=("$author_value")
  fi

  for author in "${authors[@]}"; do
    # Trim whitespace
    author=$(echo "$author" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    [[ -z "$author" ]] && continue

    # Strip parenthetical qualifiers: "Name (Org)" → "Name"
    clean_author=$(echo "$author" | sed 's/[[:space:]]*([^)]*)$//')

    # Skip organizational authors (no space = likely a single org name like "OpenAI", "Anthropic")
    if [[ ! "$clean_author" =~ [[:space:]] ]]; then
      continue
    fi

    found=false
    for ptitle in "${PEOPLE_TITLES[@]}"; do
      if [[ "$ptitle" == "$clean_author" ]]; then
        found=true
        break
      fi
    done

    if [[ "$found" == false ]]; then
      relfile="${file#$ROOT/}"
      issue "No wiki/people page for author '$clean_author' (from $relfile)"
    fi
  done
done < <(find "$ROOT/sources" -name '*.md' | sort)

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "All source authors have wiki/people pages"

# ─── 6. Index Sync ───────────────────────────────────────────────────
bold "6. Index Sync (index.md matches actual files)"
PREV_ISSUES=$ISSUES

# Files on disk but not in index
while IFS= read -r file; do
  relpath="${file#$ROOT/}"
  if ! grep -q "$relpath" "$ROOT/index.md" 2>/dev/null; then
    issue "File not in index.md: $relpath"
  fi
done < <(find "$ROOT/sources" "$ROOT/wiki" -name '*.md' | sort)

# Index entries pointing to missing files
while IFS= read -r ref; do
  if [[ ! -f "$ROOT/$ref" ]]; then
    issue "Index entry points to missing file: $ref"
  fi
done < <(grep -oE '\(([^)]+\.md)\)' "$ROOT/index.md" 2>/dev/null | tr -d '()')

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "Index is in sync with files on disk"

# ─── 7. Source Coverage in Wiki ───────────────────────────────────────
bold "7. Source Coverage (every source is referenced by at least one wiki page)"
PREV_ISSUES=$ISSUES

while IFS= read -r file; do
  basename_file="$(basename "$file")"
  count=$(grep -rl "$basename_file" "$ROOT/wiki" 2>/dev/null | wc -l | tr -d ' ')
  if [[ "$count" -eq 0 ]]; then
    relfile="${file#$ROOT/}"
    issue "Source not referenced by any wiki page: $relfile"
  fi
done < <(find "$ROOT/sources" -name '*.md' | sort)

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "All sources are referenced by wiki pages"

# ─── 8. Near-Duplicate Tags ──────────────────────────────────────────
bold "8. Near-Duplicate Tags (singular/plural, similar names)"
PREV_ISSUES=$ISSUES

SORTED_TAGS=$(echo "$ALL_TAGS" | sort -u)
while IFS= read -r tag; do
  [[ -z "$tag" ]] && continue
  if echo "$SORTED_TAGS" | grep -qx "${tag}s"; then
    issue "Possible singular/plural duplicate: '$tag' and '${tag}s'"
  fi
done <<< "$SORTED_TAGS"

[[ $ISSUES -eq $PREV_ISSUES ]] && ok "No obvious tag duplicates"

# ─── Summary ─────────────────────────────────────────────────────────
echo ""
bold "━━━ Summary ━━━"

SOURCE_COUNT=$(find "$ROOT/sources" -name '*.md' | wc -l | tr -d ' ')
CONCEPT_COUNT=$(find "$ROOT/wiki/concepts" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
PEOPLE_COUNT=$(find "$ROOT/wiki/people" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
PROJECT_COUNT=$(find "$ROOT/wiki/projects" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
SYNTHESIS_COUNT=$(find "$ROOT/wiki/synthesis" -name '*.md' 2>/dev/null | wc -l | tr -d ' ')

echo "  Pages: $SOURCE_COUNT sources, $CONCEPT_COUNT concepts, $PEOPLE_COUNT people, $PROJECT_COUNT projects, $SYNTHESIS_COUNT synthesis"
echo "  Date: $TODAY"

if [[ $ISSUES -eq 0 ]]; then
  echo ""
  green "  All checks passed! ✓"
  exit 0
else
  echo ""
  red "  $ISSUES issue(s) found"
  echo ""
  yellow "  Run this report, then ask Claude to fix the issues."
  exit 1
fi

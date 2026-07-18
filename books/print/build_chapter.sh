#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 || $# -gt 5 ]]; then
  printf 'Usage: %s SOURCE_MD OUTPUT_SLUG CHAPTER_TITLE RUNNING_TITLE [FIRST_SECTION_TITLE]\n' "$0" >&2
  exit 2
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"

SOURCE_MD="$1"
OUTPUT_SLUG="$2"
CHAPTER_TITLE="$3"
RUNNING_TITLE="$4"
FIRST_SECTION_TITLE="${5:-}"

if [[ "$SOURCE_MD" != /* ]]; then
  SOURCE_MD="$ROOT_DIR/$SOURCE_MD"
fi

PRINT_MD="$SCRIPT_DIR/${OUTPUT_SLUG}_print.md"
STYLE_TEX="$SCRIPT_DIR/chapter_style.tex"
FILTER_LUA="$SCRIPT_DIR/printify_chapter.lua"
OUTPUT_PDF="$SCRIPT_DIR/${OUTPUT_SLUG}.pdf"

pandoc "$SOURCE_MD" \
  --from=markdown+raw_html \
  --to=markdown \
  --wrap=preserve \
  --metadata="print-chapter-title:$CHAPTER_TITLE" \
  --metadata="print-running-title:$RUNNING_TITLE" \
  --metadata="print-first-section-title:$FIRST_SECTION_TITLE" \
  --lua-filter="$FILTER_LUA" \
  --output="$PRINT_MD"

pandoc "$PRINT_MD" \
  --from=markdown+raw_tex \
  --standalone \
  --pdf-engine=xelatex \
  --toc \
  --toc-depth=3 \
  --include-in-header="$STYLE_TEX" \
  --variable=documentclass:article \
  --variable=fontsize:10pt \
  --variable=mainfont:"TeX Gyre Pagella" \
  --variable=sansfont:"TeX Gyre Heros" \
  --variable=mathfont:"TeX Gyre Pagella Math" \
  --output="$OUTPUT_PDF"

printf 'Created %s\n' "$PRINT_MD"
printf 'Created %s\n' "$OUTPUT_PDF"

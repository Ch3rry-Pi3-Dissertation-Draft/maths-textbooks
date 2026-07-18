#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_14_second_order_applications.md" \
  "chapter_14_second_order_applications" \
  "Chapter 14 - Second-Order Applications" \
  "Second-Order Applications"

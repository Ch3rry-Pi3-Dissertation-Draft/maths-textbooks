#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_27_power_series_methods.md" \
  "chapter_27_power_series_methods" \
  "Chapter 27 - Power Series Methods" \
  "Power Series Methods"

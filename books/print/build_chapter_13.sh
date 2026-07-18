#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_13_linear_initial_value_problems.md" \
  "chapter_13_linear_initial_value_problems" \
  "Chapter 13 - Initial-Value Problems" \
  "Linear Initial-Value Problems"

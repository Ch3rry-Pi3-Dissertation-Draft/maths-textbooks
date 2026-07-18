#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_17_first_order_systems.md" \
  "chapter_17_first_order_systems" \
  "Chapter 17 - Reduction To First-Order Systems" \
  "Reduction To First-Order Systems"

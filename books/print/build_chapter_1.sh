#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_1_basic_concepts.md" \
  "chapter_1_basic_concepts" \
  "Chapter 1 - Basic Concepts" \
  "Basic Concepts" \
  "What Is A Differential Equation?"

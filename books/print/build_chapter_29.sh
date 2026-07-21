#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_29_classical_orthogonal_polynomials.md" \
  "chapter_29_classical_orthogonal_polynomials" \
  "Chapter 29 - Classical Orthogonal Polynomials" \
  "Classical Orthogonal Polynomials"

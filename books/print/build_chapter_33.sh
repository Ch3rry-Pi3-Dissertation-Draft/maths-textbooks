#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_33_harmonic_elliptic_boundary_problems.md" \
  "chapter_33_harmonic_elliptic_boundary_problems" \
  "Chapter 33 - Harmonic Functions And Elliptic Boundary Problems" \
  "Harmonic Functions And Elliptic Boundary Problems"

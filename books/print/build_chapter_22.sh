#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/../assets/chapter_22/generate_figures.sh"

"$SCRIPT_DIR/build_chapter.sh" \
  "books/ode_chapter_22_inverse_laplace_transforms.md" \
  "chapter_22_inverse_laplace_transforms" \
  "Chapter 22 - Inverse Laplace Transforms" \
  "Inverse Laplace Transforms"

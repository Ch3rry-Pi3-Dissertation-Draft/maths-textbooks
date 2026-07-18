# Mathematics Textbooks

Original, learner-focused mathematics notes and print-ready textbook chapters.

## Ordinary Differential Equations

The `books/` directory currently contains Chapters 1-10 of an introductory
ordinary differential equations text. The writing conventions are documented
in `books/note_style_guide.md`.

Each chapter has:

- a reading-copy Markdown source in `books/`
- a print-copy Markdown artifact in `books/print/`
- a generated PDF in `books/print/`
- a chapter-specific build script in `books/print/`

## Building A Chapter

The print pipeline uses Pandoc and XeLaTeX. For example, build Chapter 8 with:

```bash
bash books/print/build_chapter_8.sh
```

The shared print configuration is defined by:

- `books/print/build_chapter.sh`
- `books/print/printify_chapter.lua`
- `books/print/chapter_style.tex`

## Presentations

Presentation source files and generated visual assets are stored under
`presentations/`.

## Reference Material

External reference textbooks are intentionally excluded from version control.
They are used only as topic maps; the chapter structure, explanations,
examples, equations, and exercises in this repository are independently
written.

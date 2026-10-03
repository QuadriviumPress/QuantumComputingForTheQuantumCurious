# AGENTS.md

## Standard

This book follows the [QuadriviumPress MyST baseline](https://github.com/QuadriviumPress/bindery/blob/main/doc/myst-baseline.md) and the [presentation skill](https://github.com/QuadriviumPress/bindery/blob/main/skills/quadrivium-myst-presentation/SKILL.md).

## Commands

```bash
npm run start
npm run build
npm run verify
npm run check
npm run build:pdf
```

`npm run check` is the production-equivalent verification and HTML build.

## Intentional differences

- `verify` runs `python3 scripts/verify_book.py`.
- `build:pdf` generates the edited book from MyST using a local XeLaTeX
  template. It requires XeLaTeX, latexmk, `pdfinfo`, and `pdftotext`.

## Presentation gap

The converted edition keeps the source's numbered questions and immediate
answers in the narrative. Converting them wholesale to `{exercise}` and
dropdown `{solution}` directives would change that teaching sequence. Use the
shared presentation pattern for new standalone problems when it helps the
reader; review existing questions individually before converting them.

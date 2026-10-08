---
name: sheaffold-exercises
description: Create the directory structure and LaTeX files for problem sheets (problems, hints, solutions) that compile with or without solutions. Use when the user wants to scaffold exercises, a problem set, a course's weekly sheets, or exam questions.
---

# Sheaffold Exercises

Glue local pieces (one problem, its hint, its solution) into a global object (a sheet that compiles with or without solutions). Every problem lives in its own files, so problems can be reordered, reused across years, and assigned to sheets.

## Layout

```
course/
├── preamble.tex            # shared packages, macros, theorem styles
├── problems/
│   └── <topic>/
│       └── <slug>/
│           ├── problem.tex
│           ├── hint.tex      # optional
│           └── solution.tex
└── sheets/
    ├── sheet01.tex          # \input's a list of problems
    └── sheet01-solutions.tex
```

Name problem folders by content (`problems/group-theory/sylow-counting-order-pq/`), never by number: numbering belongs to the sheet.

## Solutions on and off

Pick one approach and use it everywhere:

- **The `exam` class** (CTAN `exam`): `\begin{questions} \question ... \begin{solution} ... \end{solution}`, with `\printanswers` in the solutions version.
- **A conditional in plain `article`**: `\newif\ifsolutions` in the preamble; the solutions sheet sets `\solutionstrue` before inputting the same problem list, and each problem file wraps `\input{.../solution}` in `\ifsolutions ... \fi`.

The two sheet files differ only in that one switch.

## Workflow

1. Ask for the course, the topics, and the sheet plan (or read it from a syllabus the user gives).
2. Create the folders and stub files. Each `problem.tex` starts with a comment: topic, intended difficulty, prerequisites, source if adapted (with a verified reference).
3. If the user wants draft problems, write them, and write full solutions. Check every computational answer with SymPy, PARI/GP, or SageMath, and every proof with the same care as research: a wrong model solution costs a whole class.
4. Compile each sheet in both modes (`latexmk -pdf sheets/sheet01.tex` and the solutions file), with no errors and no undefined references.
5. Report the tree and the compiled PDFs.

## Moving and reusing

To reuse a problem, add its `\input` line to another sheet; do not copy files. To retire one, move its folder to `problems/_retired/` so old sheets that reference it can be repointed.

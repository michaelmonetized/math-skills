---
name: wizard-of-odes
description: Generate an interactive bash wizard that walks a human through steps only they can perform. Use for arXiv registration and endorsement, journal submission portals, ORCID, institutional access to MathSciNet or journals, Overleaf git authentication, licensed software, or a one-off migration the user must drive. Don't use it for steps the agent can perform itself.
---

# Wizard of ODEs

Some steps belong to the human: logging in with their credentials, accepting terms, asking a colleague for an arXiv endorsement, pasting a token from a web page. A **wizard** is a bash script that walks them through those steps one stage at a time: it opens each URL, says exactly what to do there, captures any value needed, writes it where it belongs, and confirms before moving on.

Start from [template.sh](template.sh). It already handles stage progress, confirmation, URL opening, hidden input for secrets, and writing values to a `.env` file. Your job is to scope the procedure and write its stages below the `STAGES` marker. Do not edit the helper functions above it.

A wizard is single-use by default: save it to `scratch/` and delete it when done. Commit it only if the user wants a repeatable setup procedure (e.g. onboarding a new coauthor to the project).

## Process

### 1. Scope the procedure

List every manual step and every value captured. Read the project first: `README`, `AGENTS.md`, `docs/agents/tools.md`, any setup notes. Typical stages:

- Installing a Lean toolchain: the agent can usually do this itself (`elan`, then `lake new <name> math` or `lake exe cache get` in an existing project). Only wizard it if the user's machine needs admin rights.
- arXiv: create an account, link ORCID, request endorsement for a category if this is the user's first submission there.
- Overleaf git integration: generate an authentication token in Overleaf's account settings (a paid feature at the time of writing; confirm on Overleaf's site) and store it in the user's git credential helper.
- Institutional access: connect through the library's proxy or VPN so MathSciNet and journal PDFs work.
- Journal submission: the journal's portal, the files it wants, the cover letter.

Show the ordered list of stages and the value each produces, and confirm with the user.

**Done when** each stage is named and, for each captured value, you know where the human gets it, where it is written (a `.env` file, git's credential helper, nowhere), and whether it is secret.

### 2. Map each stage

Write the exact path through each site: which URL, what to click, what to copy. If you do not know the current interface, check the site's own help pages or ask; never invent menu items or URLs.

### 3. Write the wizard

Fill in the stages with the template's helpers. Secrets are read with hidden input and never echoed or logged. Keep `.env` out of git (check `.gitignore`).

### 4. Verify and hand off

Run `bash -n` on the script, then dry-run it yourself as far as possible without credentials. Give the user the one command to run it, and tell them what will happen at each stage.

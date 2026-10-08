Skills live in bucket folders under `skills/`:

- `mathematics/`: daily research work (promoted)
- `productivity/`: workflow tools not tied to one manuscript (promoted)
- `misc/`: kept around, rarely used, not promoted
- `in-progress/`: beta, not shipped in the plugin
- `deprecated/`: retired

Every promoted skill appears in `.claude-plugin/plugin.json` and in the top-level `README.md` table; each bucket `README.md` lists its skills with one-line descriptions. Run `scripts/check-skills.py` after adding, renaming, or editing a skill.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`) or model-invoked. `ask-math` is the router: update it whenever a user-reachable skill is added, renamed, or removed.

House rules for skill content:

- Name only tools, commands, tactics, databases, and papers that have been checked to exist. Agents run what skills say.
- No citation from memory, ever: arXiv id, DOI, zbMATH Open id, or MR number, looked up.
- Skill names are puns; skill bodies are earnest.
- No em-dashes in prose.

#!/usr/bin/env python3
"""Validate every skill: frontmatter, name/folder match, description, invocation policy
consistency with agents/openai.yaml, relative links, and plugin/README coverage."""
import json, pathlib, re, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
errors = []

def frontmatter(text):
    m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not m:
        return None
    fm = {}
    for line in m.group(1).splitlines():
        km = re.match(r"^([A-Za-z-]+):\s*(.*)$", line)
        if km:
            fm[km.group(1)] = km.group(2).strip()
    return fm

plugin = json.loads((ROOT / ".claude-plugin/plugin.json").read_text())
readme = (ROOT / "README.md").read_text()

for skill_md in sorted(ROOT.glob("skills/*/*/SKILL.md")):
    folder = skill_md.parent
    bucket = folder.parent.name
    rel = skill_md.relative_to(ROOT)
    text = skill_md.read_text()
    fm = frontmatter(text)
    if fm is None:
        errors.append(f"{rel}: missing or malformed frontmatter"); continue
    if fm.get("name") != folder.name:
        errors.append(f"{rel}: name '{fm.get('name')}' != folder '{folder.name}'")
    desc = fm.get("description", "").strip('"')
    if len(desc) < 30:
        errors.append(f"{rel}: description missing or too short")
    if len(desc) > 1024:
        errors.append(f"{rel}: description over 1024 characters")
    user_only = fm.get("disable-model-invocation") == "true"
    yaml = folder / "agents/openai.yaml"
    if not yaml.exists():
        errors.append(f"{rel}: missing agents/openai.yaml")
    else:
        y = yaml.read_text()
        if user_only != ("allow_implicit_invocation: false" in y):
            errors.append(f"{rel}: invocation policy mismatch with agents/openai.yaml")
    prose = re.sub(r"```.*?```", "", text, flags=re.S)
    for link in re.findall(r"\]\(([^)#]+?)\)", prose):
        if not link.startswith("http") and not (folder / link).exists():
            errors.append(f"{rel}: broken link {link}")
    for called in re.findall(r'Skill tool (?:with|for) "([^"]+)"', text):
        if not list(ROOT.glob(f"skills/*/{called}/SKILL.md")):
            errors.append(f"{rel}: calls unknown skill {called}")
    if "\u2014" in text:
        errors.append(f"{rel}: contains an em-dash")
    promoted = bucket in ("mathematics", "productivity")
    in_plugin = f"./skills/{bucket}/{folder.name}" in plugin["skills"]
    if promoted != in_plugin:
        errors.append(f"{rel}: plugin.json listing mismatch (promoted={promoted})")
    if f"./skills/{bucket}/{folder.name}/SKILL.md" not in readme:
        errors.append(f"{rel}: not linked from README.md")

count = len(list(ROOT.glob("skills/*/*/SKILL.md")))
if errors:
    print("\n".join(errors)); sys.exit(1)
print(f"OK: {count} skills valid")

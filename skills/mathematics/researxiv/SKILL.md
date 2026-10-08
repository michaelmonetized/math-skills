---
name: researxiv
description: Search the mathematical literature against primary sources and record the findings as a cited Markdown file, run as a background agent. Use before claiming anything is new, when the user asks "is this known?", needs references for a write-up, wants a literature survey, or needs a theorem's exact statement from its source.
---

Spin up a **background agent** for the reading, so the main session keeps working.

Its job:

1. **Search more than one index.** At minimum arXiv and zbMATH Open; add the OEIS when the question produces an integer sequence, MathOverflow for folklore, and Crossref to find the published version of a preprint. Search by the *concept* under several names (people rediscover things under other names), by the key example, and by the sequence of small values. Commands and query patterns are in [CITATIONS.md](CITATIONS.md).
2. **Read the primary source.** Go from the abstract to the paper, and quote the statement as it appears there, with its theorem number, hypotheses, and conventions. An abstract or a citing paper's paraphrase is a pointer, not a source.
3. **Compare carefully.** For each relevant result, say exactly how it relates to the user's statement: identical, special case, generalisation, same conclusion under different hypotheses, or a different normalisation of the same thing. Flag convention differences explicitly.
4. **Write one Markdown file** with the question, the search log (queries run, indexes hit, date), the findings with citations, and a verdict: *known* (where), *partly known* (what is missing), *not found* (where you looked). "Not found" is never "new"; it is "not found by these searches".
5. **Save it** where the project keeps notes (e.g. `notes/literature/`); if there is no convention, create `notes/literature/` and say so.

## The citation rule

Every reference in the file must have been retrieved during this run and carry an identifier that resolves: an arXiv id, a DOI, a zbMATH Open document id, or an MR number. Never construct a citation from memory: titles, years, journal names, and theorem numbers recalled without lookup are often wrong, and an agent's confident fake reference is the fastest way to lose a mathematician's trust. A reference you remember but could not find goes in a separate **Unverified leads** list, labelled as such.

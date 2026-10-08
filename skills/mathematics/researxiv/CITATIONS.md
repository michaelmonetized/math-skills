# Finding and verifying references

All endpoints below are public. Use the browser for sites without an API.

## Search

| Source | How |
| --- | --- |
| arXiv | `https://export.arxiv.org/api/query?search_query=ti:%22<phrase>%22+AND+au:<surname>&max_results=20` (fields: `ti`, `au`, `abs`, `cat`, `all`). By id: `?id_list=2303.09521`. New listings by category: `https://rss.arxiv.org/rss/math.CO` |
| zbMATH Open | Web: `https://zbmath.org/?q=<query>`. API: `https://api.zbmath.org/v1/document/_search?search_string=<query>&page=0&results_per_page=20` (supports `ti:`, `au:`, `py:`, `cc:` for MSC codes) |
| MathSciNet | Subscription; use it if the user's institution provides access. MR Lookup (`https://mathscinet.ams.org/mrlookup`) is free and returns the MR number and BibTeX for a known reference |
| Crossref | `https://api.crossref.org/works?query.bibliographic=<title words and author>&rows=5`, to find a DOI and the published version of a preprint |
| OEIS | `https://oeis.org/search?q=1,2,5,14,42&fmt=json` (terms, comma-separated), or `id:A000108` |
| MathOverflow | Stack Exchange API: `https://api.stackexchange.com/2.3/search/advanced?site=mathoverflow&q=<query>` |
| Semantic Scholar | `https://api.semanticscholar.org/graph/v1/paper/search?query=<query>`, useful for "who cites this" |
| Google Scholar | No public API; use the browser when available |

## Verify and export

- DOI to BibTeX: `curl -LH "Accept: application/x-bibtex" https://doi.org/<DOI>`
- arXiv to BibTeX: `https://arxiv.org/bibtex/<arXiv id>`
- zbMATH Open and MR Lookup both export BibTeX for their records.
- If an arXiv preprint has been published, cite the published version and keep the arXiv id (Crossref usually finds it). Example: arXiv:2303.09521 (Campos, Griffiths, Morris, Sahasrabudhe) appears in Crossref with DOI 10.4007/annals.2026.203.3.4, while arXiv's own BibTeX still says `@misc`.
- Check the latest arXiv version, and look for errata, corrigenda, or retraction notices on the journal page and in Crossref metadata before relying on a result.

## Quoting statements

Copy the statement from the PDF or source, with its number ("Theorem 1.2 of arXiv:xxxx.xxxxx v3"), and list every hypothesis, including the ones in a standing assumptions paragraph at the start of the section. Note the paper's conventions when they differ from the project's `NOTATION.md`.

## Search hygiene

- Record each query and index, with the date, in the findings file.
- Try synonyms and older terminology. Try the smallest nontrivial example as a search term. Try the first eight terms of any integer sequence in the OEIS.
- Check MSC2020 classes of the closest hits and browse neighbours in zbMATH Open by `cc:`.

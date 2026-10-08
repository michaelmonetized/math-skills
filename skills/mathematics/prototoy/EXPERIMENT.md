# Experiment branch

1. **Name the quantity** and the parameter range. Write the brute-force definition first, even if slow: it is the independent source of truth.
2. **Tabulate.** Print n, the value, and whatever comparison is being made (the conjectured formula, the ratio to a guessed main term, the difference). Columns, not prose.
3. **Look for structure.** Ratios of consecutive terms, differences, factorisations of the values (`factor` in PARI/GP or SymPy `factorint`), behaviour modulo small primes, log-log slope for growth rates.
4. **Sequence lookup.** If the values are integers, query the OEIS with the first terms (`https://oeis.org/search?q=<terms>&fmt=json`), starting from the first nontrivial term. A hit is a lead, not a proof; read the entry's references (call the Skill tool with "researxiv" when it matters).
5. **Guess, then test on fresh data.** If you guess a formula, compute terms that were not used to make the guess and check them. For guessing tools, see the `formula-finder` skill's GUESSING.md.
6. **Report** the range, the outcome, and the strongest statement the data supports.

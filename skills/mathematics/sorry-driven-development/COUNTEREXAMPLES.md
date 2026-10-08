# Hunting counterexamples

Spend real effort trying to break a statement before trying to prove it. Report each hunt as: what was searched, how (script path), how far, and what was found.

## Order of attack

1. **Degenerate cases.** n = 0, 1, 2; empty set; trivial group; the zero map; constant functions; dimension 0 or 1; characteristic 2.
2. **Drop one hypothesis at a time.** For each hypothesis, look for an example satisfying all the others and failing the conclusion. If you find one for every hypothesis, the statement is tight. If one hypothesis seems droppable, either the theorem is stronger than stated or the proof uses it silently.
3. **Standard families.** Cycles, paths, complete and complete bipartite graphs, Paley graphs, the Petersen graph; cyclic, dihedral, symmetric, and quaternion groups; the Cantor set, the topologist's sine curve; x ↦ x², x ↦ sin(1/x), the indicator of ℚ; diagonal and nilpotent matrices.
4. **Exhaustive small search.** Enumerate everything up to a size where it is cheap (estimate the count first; see the `wait-how-much` reference). Tools: SageMath `graphs(n)` or `graphs.nauty_geng(...)`, GAP `AllSmallGroups(n)`, itertools over integer partitions or permutations.
5. **Random and extremal search.** Random instances, then local search or hill-climbing on the quantity the conjecture bounds. For combinatorial existence questions, encode as SAT (PySAT) or an integer program.
6. **Databases.** LMFDB for number fields, elliptic curves, modular forms; House of Graphs for graphs with extreme invariants; FindStat for combinatorial statistics; KnotInfo for knots; the OEIS for anything that produces integers.

## When you find one

Verify it with an independent script (exact arithmetic), minimise it (the smallest instance), and report it with the verification code. Then ask: is the statement salvageable with an extra hypothesis that excludes it, and is that hypothesis natural?

## When you don't

"No counterexample among all graphs on ≤ 10 vertices" is evidence with a stated range. It is not a proof, and the handoff ledger should label it **Checked**, not **Proved**.

# Writing checks that can fail

## Independent expected values

| Claim type | Independent source |
| --- | --- |
| Closed form or recurrence for a counting sequence | Brute-force enumeration for small n; the OEIS entry (`https://oeis.org/search?q=<terms>&fmt=json`) |
| Identity between expressions | Exact evaluation at random rational points (SymPy `Rational`, PARI/GP, SageMath `QQ`), or symbolic simplification of the difference to 0 |
| Inequality | Exact or interval evaluation on a grid plus random points, with extra density near the boundary and the equality cases |
| Asymptotic | Ratio of exact value to the claimed main term at several n, which should drift towards 1 at the claimed rate |
| Statement about small groups, graphs, curves | The libraries and databases: GAP's SmallGroups library (`AllSmallGroups(n)`), SageMath `graphs(n)` or nauty `geng`, LMFDB (https://www.lmfdb.org), House of Graphs (https://houseofgraphs.org) |

## Exactness

- Prefer exact arithmetic: rationals, number fields, finite fields.
- When you must use floats, raise the precision and confirm the result is stable (mpmath: `mp.dps = 50`, then 100). For rigorous enclosures use ball arithmetic: python-flint's Arb types or SageMath's `RealBallField`.
- An identity "verified" to 15 digits is a conjecture with good evidence. Say so.

## Make the check a file

Save each check as a script under `scripts/` or `checks/` with a one-line header comment stating the claim and the range, seed any randomness, and make it exit non-zero on failure so it can run in a pre-commit hook or CI.

## Lean as a check

A Lean statement with `sorry` that compiles is a check on the *statement*: it typechecks, the coercions are what you meant, the hypotheses are expressible. For decidable statements over small finite ranges, `decide` can close them outright. The `plausible` tactic searches for counterexamples to a goal by random testing; it can find a counterexample but never proves anything.

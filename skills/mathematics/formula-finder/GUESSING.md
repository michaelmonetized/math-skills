# Guessing formulas

Guessing is cheap; proving is not. A guess is only worth proving after it predicts terms it was not fitted to.

## Pipeline

1. **Compute many exact terms**, from a definition you trust (brute force for small n). More terms make guessing more reliable and validation possible. Hold back the last several terms for validation.
2. **OEIS first.** `https://oeis.org/search?q=<terms>&fmt=json`. Try with and without the first term or two, and try simple transforms (differences, a(n)/n!, a(n) mod small primes) if nothing matches.
3. **Linear recurrences with constant coefficients.** SymPy: `from sympy.concrete.guess import find_simple_recurrence, guess_generating_function_rational`. SageMath: `berlekamp_massey` (from `sage.matrix.berlekamp_massey`) on terms in a field.
4. **Hypergeometric and similar closed forms.** SymPy's `sympy.concrete.guess.guess` (it found the Catalan numbers as a ratio of rising factorials in testing).
5. **Holonomic (P-recursive) sequences and D-finite generating functions.** The `ore_algebra` package for SageMath (Manuel Kauers and collaborators; https://github.com/mkauers/ore_algebra): `guess(data, OreAlgebra(ZZ['n'], 'Sn'))` for recurrences, or with a differential operator algebra for differential equations.
6. **Real constants.** If the answer is a number, compute it to high precision and try integer relation algorithms: mpmath `identify(x, ['pi', 'log(2)', ...])` (pass candidate constants: it does not guess them for you), `pslq`, and `findpoly`; PARI/GP `lindep` and `algdep` (raise `\p` first). Increase precision and check the relation persists.
7. **Validate** on the held-back terms or at doubled precision. A relation that survives is a conjecture with strong evidence. Then prove it, or open a ticket to.

## Traps

- With few terms, many formulas fit. A rational generating function of degree d needs well over 2d terms to be convincing.
- Floating-point "integer relations" at low precision are often spurious. Report the precision and the size of the coefficients found.
- Matching the OEIS on 8 terms is a lead. Read the entry, then check further terms.

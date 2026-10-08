# Back-of-envelope reference

Every entry below is standard; values marked with an OEIS id were checked against the OEIS. Re-derive or re-compute before putting any of it in a paper.

## Factorials and binomials

| Quantity | Asymptotic | Feel for it |
| --- | --- | --- |
| n! | √(2πn) (n/e)^n (Stirling) | log n! = n log n − n + O(log n) |
| C(2n, n) | 4^n / √(πn) | ratio to asymptotic ≈ 0.996 at n = 30 |
| Catalan C_n | 4^n / (√π n^{3/2}) | ratio ≈ 0.96 at n = 30 |
| Derangements D_n | n!/e (nearest integer, n ≥ 1) | |
| Bell numbers B_n (A000110) | log B_n ~ n log n | B_10 = 115975 |
| Partitions p(n) | e^{π√(2n/3)} / (4√3 n) (Hardy–Ramanujan) | p(100) = 190569292; asymptotic is ≈ 4% low there |

## Number theory

| Quantity | Asymptotic | Feel for it |
| --- | --- | --- |
| π(x) | x / log x, better li(x) | π(10^6) = 78498, π(10^9) = 50847534 |
| n-th prime p_n | n log n | |
| H_n = Σ_{k≤n} 1/k | log n + γ + 1/(2n) + O(1/n²), γ ≈ 0.5772 | |
| Σ_{p≤x} 1/p | log log x + M, M ≈ 0.2615 (Meissel–Mertens) | log log(10^100) ≈ 5.44: "grows" is generous |
| Average of d(n) for n ≤ x | log x | max d(n) is n^{o(1)} but far above average |

## Combinatorial explosions (check before you enumerate)

| Objects | Count |
| --- | --- |
| Labelled simple graphs on n vertices | 2^{n(n−1)/2} |
| Unlabelled simple graphs (A000088) | ~ 2^{n(n−1)/2} / n!; n = 10: 12005168; n = 11: 1018997864; n = 12: 165091172592 |
| Groups of order 2^k (A000001) | order 256: 56092; 512: 10494213; 1024: 49487367289 |
| Subsets of an n-set | 2^n; 2^64 ≈ 1.8 × 10^19 |

## Ramsey reality check

R(4,4) = 18; 43 ≤ R(5,5) ≤ 46 (upper bound: Angeltveit and McKay, arXiv:2409.15709). For diagonal R(k,k) the lower bound is (√2)^k up to polynomial factors (Erdős, 1947) and the upper bound is (4 − ε)^k for some fixed ε > 0 (Campos, Griffiths, Morris, Sahasrabudhe, arXiv:2303.09521). Exhaustive search over 2-colourings of K_43 means 2^903 colourings: not happening.

## Computation budgets

- ≈ 10^9 simple operations per core-second; ≈ 3.2 × 10^7 seconds per year, so ≈ 3 × 10^16 per core-year.
- IEEE double: 53-bit significand, ≈ 15.9 decimal digits, machine epsilon 2^−52 ≈ 2.2 × 10^−16. Cancellation eats digits: when subtracting nearly equal quantities, switch to exact rationals, mpmath with higher `mp.dps`, or ball arithmetic (Arb via python-flint, or SageMath's `RealBallField`).
- Birthday bound: first collision among uniform samples from N values after about √(πN/2) draws.
- Coupon collector: n H_n ≈ n log n draws to see all n coupons.

## Asymptotics that lie at small n

The asymptotic may be right and still useless at the n you can compute. Always print the ratio (exact / asymptotic) at a few n before using an asymptotic to predict a computation, and say which regime you are in.

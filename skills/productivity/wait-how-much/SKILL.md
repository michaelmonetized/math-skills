---
name: wait-how-much
description: "Stop. I lost the thread, and I can't tell how big anything is: re-pitch it with sizes. Use when a message didn't land or its quantities have no sense of scale."
disable-model-invocation: true
---

Wait, how much? I can't tell where you've got to, or how big any of the quantities you're juggling actually are. Re-pitch the last message:

1. **One sentence, plain words.** What is being claimed, in the vocabulary of `NOTATION.md` if the project has one. No new symbols.
2. **One concrete instance.** Plug in an actual small case and show the actual numbers.
3. **Sizes.** For every quantity that matters, give its order of growth and, when it is known, the constant: `~` for asymptotic equivalence, `O`/`Ω`/`Θ` only when you mean them. Then evaluate at one realistic parameter value so I can feel it ("at n = 10^6 that is about 1.4 × 10^7"). Say how good the asymptotic is at that value if you can check it.
4. **Is it feasible?** If the message implies a computation (a search, a sum, an enumeration), estimate its cost against a rough budget of 10^9 simple operations per core-second, and say whether it is seconds, a weekend, or the age of the universe.
5. **Label the rigour.** Mark each size as *proved*, *heuristic*, or *numerically observed (range checked)*.

Compute rather than recall: when a number can be produced by a one-line SymPy, mpmath, or PARI/GP call, produce it and show the call. The reference sheet in [ESTIMATES.md](ESTIMATES.md) is for orienting, not for quoting without a check.

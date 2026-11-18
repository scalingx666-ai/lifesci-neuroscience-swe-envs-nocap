# Issue

**Title:** Fix/infomax n iter

## Description

<!--

Thanks for contributing a pull request! Please make sure you have read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-python/blob/main/CONTRIBUTING.md)
and the [detailed contribution guidelines](https://mne.tools/dev/development/contributing.html)
before submitting.

If you used AI to help prepare this pull request, please pay special attention to
our **Policy on AI Assistance in Contributions** in
[CONTRIBUTING.md](https://github.com/mne-tools/mne-python/blob/main/CONTRIBUTING.md).
Here are some examples of what we expect for "tool, manner, and scope" disclosure:

- "I implemented the code changes myself, and Claude Sonnet 4.6 wrote the test."
- "I prompted Gemini 3.1 Pro to get a first draft implementation, then refined it
  manually until I was satisfied."
- "I wrote the code and asked Kimi K2.5 to write the docstring for me."
- "I fed GPT 5.4 the paper where the algorithm is described, and asked it to implement
  it for me. Then I had it write an example script using the `sample` dataset, and I
  wrote the narrative text of the tutorial myself."

Please be aware that we are a loose team of volunteers so patience is
necessary. Assistance handling other issues is very welcome. We value
all user contributions, no matter how minor they are. If we are slow to
review, either the pull request needs some benchmarking, tinkering,
convincing, etc. or more likely the reviewers are simply busy. In either
case, we ask for your understanding during the review process.

Again, thanks for contributing!

-->

#### Reference issue (if any)

--> Partially addresses #14335.

#### What does this implement/fix?

<!-- Explain your changes. -->

> `infomax` signals convergence by assigning the loop variable rather than
> breaking:
>
> ```python
> if step > 2 and change < w_change:
>     step = max_iter          # force `while step < max_iter` to fail
> ...
> return weights.T, step       # so the return value is the budget
> ```
>
> The returned count is therefore `max_iter` whenever that rule fires, however
> few iterations actually ran. The second exit — the small-angle branch —
> assigns `max_iter = step` instead and does report the true count, so which of
> the two fires decides whether `n_iter` means anything. That is data-dependent
> rather than a property of `extended`.
>
> On the reproduction in the issue:
>
> ```
>                   before    after
> fastica                3        3
> infomax              121      121     (small-angle path — already correct)
> infomax-extended     500      110     (w_change path — was reporting the budget)
> ```
>
> The extended fit converged at 110 and reported 500.
>
> **The solution is unchanged.** `step += 1` happens before the stopping rule, so
> `break` skips no work. The unmixing matrices are bit-identical before and after
> for `extended=True` and `False` across several budgets, and there is a test for
> that.
>
> It is a behaviour change for anyone reading `n_iter_` on an infomax fit, hence
> the changelog entry — though the old value was the budget, so it is hard to see
> what could have depended on it.


#### Additional information

<!-- Any additional information you think is important. -->

> `ICA.converged_` follows in a second PR, which needs this one.
>
> AI assistance: Claude helped diagnose the two exit paths and drafted the tests
> and changelog; I verified the behaviour against the reproduction in the issue
> and ran the test suite myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b781a620950`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
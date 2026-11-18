# Issue

**Title:** Enh/ica converged

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

<!-- Example:

.

--> . Follows #14366.


#### What does this implement/fix?

<!-- Explain your changes. -->

> Adds `ICA.converged_`, a `bool` recording whether the decomposition converged
> or stopped at `max_iter`, for all four backends:
>
> | backend | how convergence is determined |
> |---|---|
> | `fastica` | catches sklearn's `ConvergenceWarning`, then re-emits it |
> | `infomax` | reads the flag from the training loop (new `return_converged`) |
> | `picard` | `n_iter_ < fit_params["max_iter"]` |
> | `jamica` | catches `JamicaConvergenceWarning`, then re-emits it |
>
> The two warning-based backends share one context manager that records the
> warning and then **re-emits** it — silencing a warning users currently rely on
> would be a regression.
>
> It is written to and read from `-ica.fif` inside the existing misc-params
> string, so no new FIFF tag is needed. On read it is cast back to `bool`,
> because `_serialize` round-trips it as an int and `converged_ is False` should
> behave the same before and after saving.

#### Additional information

<!-- Any additional information you think is important. -->

> The motivation is in #14335: a decomposition that stopped at `max_iter` still
> produces components, those components are still used to choose `exclude`, and
> nothing downstream records that it was truncated. A warning at fit time does
> not survive `ica.save()`.
>
> AI assistance: Claude drafted the implementation, tests and changelog; I
> verified the behaviour across all four backends and ran the test suite myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db21534b248b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
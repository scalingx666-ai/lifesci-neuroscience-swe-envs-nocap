# Issue

**Title:** Fix apply weights linearly in _average_quats

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

-->

.

#### What does this implement/fix?

<!-- Explain your changes. -->

`_average_quats` (used by `compute_average_dev_head_t`) scaled each quaternion by its weight before forming the outer products, so the matrix being decomposed was `sum_i w_i^2 q_i q_i^T` rather than the `sum_i w_i q_i q_i^T` of the Markley et al. method. The rotation was therefore averaged with squared weights, while the translation used linear weights.

This PR scales each quaternion by `sqrt(w_i)` instead. For the example in the issue, the averaged rotation angle changes from 0.1801 rad to 0.1501 rad, consistent with the time-weighted mean translation.

I extended the existing `test_average_quats` with a weighted case.

#### Additional information

<!-- Any additional information you think is important. -->

AI disclosure: I used Claude Code to help draft the fix and the test assertion, and I reviewed the changes myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `379cfabd03db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
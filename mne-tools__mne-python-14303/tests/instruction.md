# Issue

**Title:** FIX: don't mutate cached ICA sources in plot_sources properties

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


#### What does this implement/fix?

Found a bug when right clicking the IC number on the left side (opening the ica_properties) when in `plot_sources`. There seems to have been a regression from the previous versions where on the first right click it works fine, but on the second it crashes with an index error:

```
IndexError: All picks must be < n_channels (1), got array([42]
```

It turns out that using the picks command was mutating the browser cached data in place and therefore only worked the first time. Regression test was also added. The fix was just adding a copy before doing the picks.

Let me know if you have any other questions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae90522cc64e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
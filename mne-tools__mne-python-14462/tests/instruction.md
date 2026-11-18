# Issue

**Title:** Curated head shape for FSAverage

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

MNE-Python ships a curated head shape for FSAverage that I used to use for coregistration (left-most picture). With the `fetch_fsaverage` function this head shape is not used anymore, and the result of watershed is used instead (middle). Was this change intentional? If not, this PR restores the old behavior by copying the curated head shape from mne-python in `fetch_fsaverage`, and using it in the coregistration GUI.

<img width="1500" height="500" alt="heads" src="https://github.com/user-attachments/assets/b7fcd7f0-d76a-4b0d-8225-5d13ca367960" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c16370a2b7e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
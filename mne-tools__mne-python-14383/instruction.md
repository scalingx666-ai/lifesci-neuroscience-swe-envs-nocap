# Issue

**Title:** Fix sorting in `_find_overlaps` for loading eyelink data

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

**Context:** I used `mne.io.read_raw_eyelink` to load my Eyelink eye-tracking data with the option to merge binocular events based on an overlap threshold using the internal function `_find_overlaps`.

**Problem (behaviour):** I noticed some cases where events were not merged even though they were within the overlap threshold (but they had the exact same onset/time).

**Problem (code):** When determining the overlap for the start and stop of an event in the `_find_overlaps`  function the dataframe is only sorted in the case of `overlap_start` and not for `overlap_end` since by default the operation is not in place. This leads to problems for unsorted df or df with equal values for which the sorting is not stable.

**Suggested solution:** I sorted the df first and saved the result and then calculated `overlap_start` and `overlap_end`.

#### Additional information
I used a OpenAI GPT-6 Luna prompt to search for other potential issues in the function apart from the sorting and
I think there are some other aspects in the function that could be changed to make it more robust for edge cases.
- There might be the case where there is one event detected in the right eye but the same event is split in 2 for the left eye. In principle the events could be merged, but since there are 3 candidate events not 2, none are merged.
- If there are any non-numeric columns in the df there will be an error when calculating the mean of those. (However, this might be prevented by how the input to the `_find_overlaps` function is prepared. I did not check.)

<!-- Any additional information you think is important. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f84b6710dce9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
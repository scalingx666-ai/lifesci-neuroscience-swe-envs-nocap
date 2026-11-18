# Issue

**Title:** BUG: Exclude bad channels in annotate_muscle_zscore

## Description

Reference issue

There is no existing issue for this bug but #13946 and  #12402 are linked. @drammock explicitly asked for this ()  during the API migration. This one was missed, I found it while working on my data. A similar fix was done here

What does this fix?

- Current main: https://github.com/mne-tools/mne-python/blob/7ab5922ca55db650e1c2f91315ecf46b623c8132/mne/preprocessing/artifact_detection.py#L120
- #11907 changed `raw_copy.pick_types(meg=ch_type, ref_meg=False)` (defaults to `exclude="bads"`) to `raw_copy.pick(ch_type)` (defaults to `exclude=()`)

Additional information

- I audited every library-code line #11907 changed. This function was the only place where bad channels were newly included..
- While at it, I found that `mne/gui/_dipolefit.py cov="baseline"` could have a similar issue (bad channels inflate the noise estimate). It's separate, not caused by #11907, and not fixed here. I could open a PR if this needs a fix.

AI disclosure
Claude Opus 5.5 was used for tracing the regression to #11907 through git history and the GitHub discussion + write the test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f498626a537`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
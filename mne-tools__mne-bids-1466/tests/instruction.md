# Issue

**Title:** Handle channel name mismatches

## Description

PR Description
--------------

Channels are renamed [here](https://github.com/mne-tools/mne-bids/blob/main/mne_bids/read.py#L851) without a warning or error when there is a mismatch between the raw data and BIDS `channels.tsv`. This can cause a possible mismatch between channel names and the underlying locations (`raw.info['chs'][i]['loc']`) and signal data (`raw._data`).

@larsoner proposed a fix  that was never implemented:
> Yikes so there's no real way to know. Maybe we should raise an error but allow people to pass `ch_name_mismatch='raise' (default) | 'reorder' | 'rename'`. We could even just start with the reorder case as that's the one we actually need here, unless people already have seen datasets that need to rename one.

So I implemented it, except using `'raise'` as the default. In my opinion, this makes more sense as this is a clear error in the BIDS dataset.

Maybe we should also:
- Provide an utility tool for overwriting BIDS channels.tsv files from the raw data files: [example for snirf](https://gist.github.com/Kallemakela/4cee95a58d5f176842bc9ca800769be6)
- Update the bids validator to check for channel mismatches.

Related issues:
#1360
#1117

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [ ] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `465dd55ff838`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
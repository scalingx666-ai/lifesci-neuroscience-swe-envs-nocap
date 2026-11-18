# Issue

**Title:** Optimize chunk sizes

## Description

# PR Description

On my computer running PyPREP typically slows everything down to a crawl, even causing occasional brief screen blackouts as macOS tries to cope with all its RAM being consumed. Obviously this expected to some extent, but I noticed that it will take as much RAM as possible even when not necessary: e.g. the chunk size being set to 57 for a 64-channel dataset when 32 would have produced the same number of chunks with less RAM consumption.

To address this, I've written a bit of code that figures out the smallest possible chunk size for each possible number of chunks for a file. e.g. for 32 channels, we get:

```python
chunk_sizes = [1, 2, 3, 4, 5, 6, 7, 8, 11, 16, 32]
chunk_counts = [32, 16, 11, 8, 7, 6, 5, 4, 3, 2, 1]
```
When the largest chunk size is too large, it falls back to the next-largest chunk size in the list, so 32 (1 chunk) -> 16 (2 chunks) -> 11 (3 chunks) -> 8 (4 chunks) etc.

In addition to freeing up some system RAM, this should also reduce the likelihood of an overzealous OS killing off the Python process mid-PREP because it's consumed too large a chunk of RAM (has happened to me twice on an 8GB MBP running Catalina, but never on the 24GB iMac running High Sierra or 16GB Hackintosh running Mojave that I've tested PyPREP extensively with)

# Merge Checklist

To merge your PR we need to first take the following points into account:

- [ ] the PR has been reviewed and all comments are resolved
- [ ] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [ ] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]

[contrib-guideline]: https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md

[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration

[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword

[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface

[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afb5167457f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
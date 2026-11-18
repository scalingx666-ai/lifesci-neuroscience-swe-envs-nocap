# Issue

**Title:** Fix RANSAC-breaking bug in RANSAC correlation window chunking code

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

Partially addresses #41 and #65. Basically, the existing code incorrectly splits the full EEG data into window-sized chunks for RANSAC correlation. For convenience I'm copying my explanation/illustration from #65 below:

> What we *want* it to do is take data like this (where A, B, and C are different channels):
> 
> ```
> [['A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8'],
>  ['B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8'],
>  ['C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8']]
> ```
> 
> ... and reshape it into this (where the number of correlation windows is 4, and there are 2 samples per window):
> 
> ```
> [[['A1', 'A2'],
>   ['B1', 'B2'],
>   ['C1', 'C2']],
> 
>  [['A3', 'A4'],
>   ['B3', 'B4'],
>   ['C3', 'C4']],
> 
>  [['A5', 'A6'],
>   ['B5', 'B6'],
>   ['C5', 'C6']],
> 
>  [['A7', 'A8'],
>   ['B7', 'B8'],
>   ['C7', 'C8']]]
> ```
> 
> ...such that when you iterate over the first axis, the windows of data look like the above chunks.
> 
> Instead, the PyPREP code above generates this:
> 
> ```
> [[['A1', 'A2', 'A3', 'A4'],
>   ['A5', 'A6', 'A7', 'A8']],
> 
>  [['B1', 'B2', 'B3', 'B4'],
>   ['B5', 'B6', 'B7', 'B8']],
> 
>  [['C1', 'C2', 'C3', 'C4'],
>   ['C5', 'C6', 'C7', 'C8']]]
> ```
> 
> ... which is then sliced along the *last* axis, resulting in windows of data like *this*:
> 
> ```
> [[['A1', 'A5'],
>   ['B1', 'B5'],
>   ['C1', 'C5']],
> 
>  [['A2', 'A6'],
>   ['B2', 'B6'],
>   ['C2', 'C6']],
> 
>  [['A3', 'A7'],
>   ['B3', 'B7'],
>   ['C3', 'C7']],
> 
>  [['A4', 'A8'],
>   ['B4', 'B8'],
>   ['C4', 'C8']]]
> ```

The current PR fixes things to work as intended.

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [x] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [x] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `032cad16793a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** cache __TYPE_MAP and init submodules

## Description

Related to:
fix: 
fix: 
prior pr: 

## Motivation

import slow

## How to test the behavior?

```python
import pynwb
# check ur watch meaningfully
```

## Checklist

I'VE DONE NONE OF THESE AND I CAN EXPLAIN

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Narrative

sorry for the incomplete PR, i have to run out the door RIGHT NOW and didn't want to forget. opening as a draft and i'll come back later.

finishing up nwb_linkml and wanted to read through to see if there was any special behavior i was missing and was like why the heck does the import take like an hour. 

on first import it's because `hdmf` imports the whole scipy sparse module and pynwb imports down that far in hdmf. that would be fixable using a `TYPE_CHECKING` check, but idk if that function signature decorator thing can handle delayed annotations like that. that's nbd it goes away.

most of the time is spent in the initial loading of the schema into `__TYPE_MAP` (and most of that is from probably unnecessary `deepcopy`s, but that's another day's perf to win), with the remaining ~1/3 from the side effects of importing the other modules. 

So i just mostly did what was talked about in the prior issues and pickled the `__TYPE_MAP` object before importing the rest of the modules bc i wasn't sure what the side effects were there, but if that's fine to also pickle then we could just copy/paste the module-level imports into the `load_namespaces` function.

I also was like "why the heck don't ya try to clone the submodules if you're gonna tell me i need to do it anyway" when i first imported so i also did that just bc it seems like a kind thing to do. 

anyway more later and i'll test this too xoxo

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9f9e5a3e9d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
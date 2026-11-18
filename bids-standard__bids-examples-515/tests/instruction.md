# Issue

**Title:** ENH: add ability to test examples PR against PR in bids-specification

## Description

Many PRs are developed to accompany WiP BEP PRs. It is beneficial to establish testing against likely a modified BIDS schema in those PRs.  In this solution we should expand matrix of runs with `bids-pr` run against that arbitrary PR if entered in a line with `bids-specification-pr:`.

TODOs
- test with proposed line in the template
- BIDS Specification PR: nothing
- BIDS Validator PR: NONE
- That was original testing -- now will need to redo for above both spec and validator being (not or specified): 
  - [x] should not run/fail if not a match
  - [x] should run correctly if number
  - ~~should run correctly if `#number` (TODO)~~ decided not to bother since would lead on github to local PR etc
  - [x] should run correctly if URL
  - [x] see what happens if schema is bad (according to https://github.com/bids-standard/bids-schema/tree/main/PRs 2140 is no good ATM): well -- it is kinda different point since there is a .json already, and #2140 was failing to build for us...
  - [x] should rerun when description edited
     - it is kinda needed to react when people edit/enter URL but annoying since even checkmarks would trigger it. May be not to do?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5333f831fd36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
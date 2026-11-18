# Issue

**Title:** [ENH] Recommend controlled vocabulary for age Units, clarify that it can be overloaded

## Description

Of high relevance to @bids-standard/bep032 effort, but also potentially to @bids-standard/bep036 and others.

- Most recent relevant discussion is in  
 - Ultimately 
- Reincarnated   which was partially addressed elsewhere
- and relates to freshly filed  as we might need to adjust this depending on the solution there. 

TODOs/Notes
- [x] it will make some bids-example datasets invalid since they use "years" for "Units" instead of "year", submitted 
- [x] Review/fix for that test fix.  ~~Unclear why NOW it became applicable/failing~~
   - we ran into this since this is presumably the first rule adding custom checks on the column definition (not sidecar) .json files? (according to claude).  But reworked test selection seems became  too cumbersome
   - no more changes to tests -- validating against .tsv
- [x] For BIDS 2.0 make 'warning' into 'error' there Units not being from allowed values. Added to TODOs of #1775

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6764039d06a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
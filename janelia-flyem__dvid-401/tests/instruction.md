# Issue

**Title:** simplify and fix neuronjson fields processing

## Description

This addresses an issue noticed by @stuarteberg regarding incorrect behavior for the `neuronjson` datatype's `/all` endpoint when only selecting fields with `_user` and `show=user` query string:

http://dvid-server/api/node/:master/segmentation_annotations/all?show=user&fields=type_user
http://dvid-server/api/node/:master/segmentation_annotations/all?show=user&fields=type_user,type

The first will only return a fraction of the second request. This error was caused by a bug in overly complicated code to handle the various options for returning neuronjson data. It was fixed by moving from a procedure that removed fields to one that added fields from stored data as needed. 

With the added tests I was able to verify the bad behavior between the two types of requests.

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/401)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b93c7ec05d09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
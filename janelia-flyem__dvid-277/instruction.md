# Issue

**Title:** Adds support for OpenStack Swift

## Description

As discussed, this is the PR for a new storage engine which runs on [OpenStack Swift](https://wiki.openstack.org/wiki/Swift).

Supported interfaces:

- `Engine`
- `Store`
- `KeyValueGetter`
- `KeyValueSetter`
- `OrderedKeyValueGetter`
- `OrderedKeyValueSetter`
- `KeyValueBatcher`
- `Batch`

My tests indicate that this is working as expected.

Once this is merged, I'm happy to provide a Markdown file with instructions for the Wiki.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/277)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6174cdd1877`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
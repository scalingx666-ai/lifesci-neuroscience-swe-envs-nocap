# Issue

**Title:** Raise on an id that Studyset.slice cannot resolve

## Description

slice() returned an empty studyset for an id that named nothing, so a typo, an id from a different studyset and an id already sliced away were all indistinguishable from "these analyses genuinely have no data". The partially-resolvable case was worse than the wholly unresolvable one: a list where one id is wrong came back with a plausible-looking subset and nothing said an analysis had gone missing. Selecting is a request for the analyses named, so any id naming none of them now raises ValueError, and the error names the ids that failed rather than just the count.

Resolution is checked against the studyset in hand, not the store behind it, so slicing a sub-studyset with an id belonging to a sibling raises too. Excluding is left alone -- exclude_study_ids() and View.drop_keys() still ignore an id that matches nothing, because what they were asked to remove is absent from the result either way.

Two ways the short analysis id was unreachable, both from deriving it as full_id.rsplit("-", 1)[-1] instead of reading the analysis_key the store already carries:

- a hyphenated analysis id: "mixed-a-b" derived to "b", so the analysis could not be selected by the id it declares, and the short ids handed back by get_analyses_by_label/_mask/_coordinate could not be fed back into slice(). Left unfixed, raising would have turned a silent miss into a confident error on an id that is genuinely there.
- the positional ids generated for a document that declares none: "analysis-0" derived to "0".

Resolving a short id also kept only the first matching row. NIMADS does not require an analysis id to be unique across studies -- the bundled pain studyset calls every analysis "1" -- so selecting on one silently dropped every match after the first, and an accurate report of which ids resolved needs all of them anyway. Range lookup replaces the first-match one, matching the stance already documented on note_row_resolver.

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Enforce accurate, studyset-local identifier resolution when selecting analyses and studies.

New Features:
- Make analysis and study selection reject identifiers that do not resolve within the current Studyset, with errors identifying missing ids.
- Support selecting all analyses that share a short analysis id, including hyphenated ids and ids returned by query helpers.

Bug Fixes:
- Correct short-id resolution for hyphenated analysis identifiers and documents without declared analysis ids.
- Prevent silently dropping duplicate short-id matches during selection.

Enhancements:
- Preserve permissive behavior for exclusion operations while improving missing-name formatting and lookup utilities.

Documentation:
- Document strict selection behavior, supported identifier forms, duplicate short-id matching, and exclusion semantics.

Tests:
- Add coverage for unresolved analysis and study ids, sliced-away ids, long missing-id lists, hyphenated ids, and repeated short ids.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** ENH: Report the real cause when an atlas XML file fails to parse

## Description

`AtlasDefinition::InitFromXML` replaced every parse failure with a generic "XML parsing error", dropping both expat's own diagnosis and the message of any exception thrown by an element handler (for example `Bad Weight given heavy`). A malformed atlas file said nothing about where or why. It now reports expat's error text and line number when the parser fails. When an element handler throws, it releases the read buffer and raises a new `itk::ExceptionObject` that names the file and carries the handler's description; any other exception type is reported with the file name as well. No raw `throw;` remains in `AtlasDefinition`.

<details>
<summary>Tests</summary>

Three tests added to `AtlasDefinitionGTest`, each checking the exception's description:

| Test | Expected text | Before this change |
|---|---|---|
| malformed XML | expat's `mismatched tag` and `line 3` | fails (generic message) |
| non-numeric weight | `Bad Weight given`, the bad value, and the XML file's path | fails (generic message) |
| unknown element | the element name | fails (generic message) |

11/11 in `AtlasDefinitionGTest`; every target builds. The full suite was not rerun for this PR: the only code changed is `InitFromXML`, which no registered test other than `AtlasDefinitionGTest` reaches, and the full suite passed (537/537) on #635, which has merged.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the change and tests; the tests were run against the previous code to confirm they fail. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `378dda19914d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
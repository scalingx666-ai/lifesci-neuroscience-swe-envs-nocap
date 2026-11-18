# Issue

**Title:** Keep integration results tied to their measured source

## Description

An Integrator could report its best measured candidate without a cumulative patch when integration did not beat an individual candidate. The native result reader then reconstructed the integration base instead of the measured source and rejected the result. That rejection could remain a final-delivery objection after an independently valid final evaluation.

Make `best` optional, but require its source patch whenever it is present, plus evaluation IDs for external objectives. A `no_improvement` result can reuse an existing individual patch when it reconstructs the candidate from the supplied integration base. Final review guidance now requires historical objections to remain applicable and unresolved for the delivered source, state and timing contract. Inherited correctness defects remain blocking; a passing finite test or a different source ID alone does not resolve them.

The existing result reader, ranking, selection and veto logic are unchanged. The correction uses the existing output schema and role guidance.

Validation:

- Focused external-primary, greedy-parity and simple-evolution tests passed; generated workflow and diff checks passed.
- The external-primary regression checks that a legal `no_improvement` result binds the retained patch and passes the checked native score into memory. Existing wrong-source and final-veto cases still pass.
- Independent Codex and actual-Claude source reviews completed; Claude independently ran the focused suites.
- Full L0 and CodeQL checks are being run against this exact commit through `ci/integration-source-binding-20261026`.

GPU workflow validation of this revision is pending. Ongoing full research runs retain their original source and will not be retroactively relabelled as tests of this correction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e0000d35886`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
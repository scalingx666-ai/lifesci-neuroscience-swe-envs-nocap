# Issue

**Title:** [Core] Index candidate.CandID

## Description

## Description

`CandID` is the candidate identifier the application keys on, but the `candidate` table doesn't carry an index for it. It indexes `PSCID`, `ExternalID`, `Active`, `RegistrationCenterID`, `flagged_reason`, `Sex` and `ProbandSex`, but not `CandID`. So every lookup by CandID is a full table scan.

That stays invisible until something does a lot of them at once. The dataquery run endpoint resolves CandID to `candidate.ID` once per result row, batched 2000 rows at a time, so each batch does 2000 scans. On a 32,487 candidate instance that is 65 million row reads per batch.

Measured there, a batch went from 74.89 s to 0.32 s.

The index is unique, which is what `CandIDGenerator` already assumes. It picks a random ID, checks the table for a collision, and returns it for insertion. The check and the insert are separate statements, so what stopped two concurrent registrations landing on the same CandID was the primary key the table used to carry on that column. Since #9556 moved the primary key to `candidate.ID`, nothing has.

## Changes

- Added `UNIQUE KEY \`CandID\` (\`CandID\`)` to the `candidate` table in the install schema.
- Added the matching patch for existing instances.

## Testing Instructions

1. Run `EXPLAIN SELECT ID FROM candidate WHERE CandID = <some CandID>`. It should report a full table scan.
2. Apply the patch.
3. Run the same EXPLAIN. It should now use the `CandID` index.
4. In the Data Query Tool, select PSCID and run the query.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `394d32a31d91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
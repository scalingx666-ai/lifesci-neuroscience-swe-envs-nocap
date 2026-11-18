# Issue

**Title:** Benchmark every pull request against its own merge base

## Description

Every pull request that touches `src/` gets a comment with what the change did to a scan: what Brain detects, and what the scan costs.

## Two kinds of number, kept apart

The counts (nodes, edges, tabs, routes, security issues, `parse()` calls, and a breakdown per node type) are deterministic. Both arms scan the same generated application, so a difference means Brain's output changed, not that the runner was busy. The benchmark checks that every repetition produced the same counts and the comment says so when they disagree. A moved count is not automatically a regression, since an analyzer that detects more will move one by design, but it should not move by accident without anyone noticing.

Timing is a median wall clock, and every delta is shown against a noise floor taken from the base arm's own repetitions. A delta inside that floor is labelled not measurable rather than reported as a result. Each phase gets a floor from its own repetitions, because a phase is noisier than the scan around it: the facade phase was measured ranging from 33 to 132 ms between repetitions of identical code, which reads as a 50% improvement if you give it the scan's floor instead.

## What it scans

`benchmark/generate-corpus.php` writes a deterministic synthetic Laravel application at two scales, roughly 400 and 1,200 PHP files: a service, repository and model layer shared by many entry points, chains four deep, private helpers and call-free getters. It is shaped to stress the scan rather than to look like an average app, so read the absolute times that way. No real application is involved, so there is nothing to keep private and nothing to keep in sync.

Both arms scan the same generated tree, which is why a count delta can only come from the code change.

## How the comparison runs

`benchmark.yml` checks out the pull request and its merge base, not the tip of the base branch (which would report other people's merges as this pull request's differences), installs both, generates the application once, and alternates the arms round by round so machine load lands on both. Five rounds of two timed repetitions per arm, each after a warmup.

The pull request's own copy of the harness measures both arms: `BRAIN_BENCH_AUTOLOAD` points `bootstrap.php` at each checkout's autoloader in turn. The harness code is therefore identical across arms, only `src/` differs, and the benchmark does not need to exist on the base ref, which is why this pull request can measure itself.

`benchmark-comment.yml` posts the result from a separate `workflow_run` job, because the job that runs pull request code holds a read-only token. Its artifact is untrusted input: the pull request number is validated as a number before it addresses anything, the body is passed as a file rather than interpolated into a command, and the comment to replace is found by a fixed marker rather than by text read out of the artifact.

## What it reported on an unchanged tree

Run against a merge base with identical `src/`, ten repetitions per arm:

- no count changed on either scale, including the per-node-type breakdown
- every timing delta came back within noise, the facade phase included: its 52% median difference sat inside a floor of the same size, so the comment marked it unreadable

The comparison logic has tests, and each was mutation-checked. Breaking the count diff, the noise floor, the per-phase floors, the stability warning or the comment marker fails a test.

## Running it locally

```
composer benchmark
```

`benchmark/README.md` covers the options, how to reproduce a CI comparison against a merge base, and how to read the two tables.

## Notes for review

- The comment needs one change outside this pull request. `workflow_run` workflows only run from the repository's default branch, and that is `v2.x` while work merges to `main`. Until `benchmark-comment.yml` sits on the default branch, pull requests get both tables on the run's summary page but no comment. `v2.x` is 34 commits behind `main` with nothing `main` lacks, so switching the default branch to `main` fixes it, and seems worth doing anyway.
- `benchmark/` is deliberately outside `phpstan.neon`'s paths. The harness feature-detects the caches it clears because it also runs against the merge base's `src/`, and analysing this checkout reads those guards as always true. The README says so where someone would go looking.
- No `.gitattributes` `export-ignore`, so `benchmark/` ships in the dist tarball, as `tests/` already does. If we want to trim the package, better to do it for both at once than for one directory here.
- Nothing at release time yet. The same runner would produce a table for release notes if that is wanted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55fcbd22cedf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
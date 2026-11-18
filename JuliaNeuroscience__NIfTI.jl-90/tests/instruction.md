# Issue

**Title:** CI: test the supported Julia range, update actions, drop dead cache i…

## Description

…nputs

Coverage. The matrix tested '1' and 'nightly' only, so the julia = "1.10" lower bound in Project.toml was never exercised. Adding 'min' and 'lts' makes the compat entry mean something.

Dead cache configuration. The cache step still carried path, key and restore-keys from the actions/cache it replaced. julia-actions/cache accepts none of those three, so they were inert and only produced "unexpected input" warnings. The accompanying env.cache-name existed solely to build the key expression that went with them.

Action versions. actions/checkout v4 to v7 and codecov/codecov-action v5 to v7 are the current majors. setup-julia, cache, buildpkg, runtest and processcoverage were already on their current majors, except cache which moves from v2 to v3.

Triggers. push is limited to master and tags, which stops branch pushes and their pull request from each running the full matrix, and a concurrency group cancels superseded pull request runs. The workflow declares contents: read, since nothing here needs write.

The codecov step now passes CODECOV_TOKEN. The upload is unauthenticated without that secret, as it is today; fail_ci_if_error defaults to false, so a failed upload does not fail the job either way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d1eed4ed0aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
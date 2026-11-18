# Issue

**Title:** rel: 25.1.0

## Description

Release prep, targeting tomorrow.

The plan is for 25.1.0 to be a LTS *candidate*, which means we'll spend more time than usual evaluating its quality and crash rate, rather than moving on to further development efforts

@jbwexler This release has `--fallback-total-readout-time` flag. We should set `--fallback-total-readout-time estimated` in general, so that we pick up datasets with `EstimatedTotalReadoutTime` or `EstimatedEffectiveEchoSpacing`. For SyN-SDC datasets that lack readout time information, we can pass a manual value (I'd suggest 0.03125) with the same flag. We should discuss this week how to identify the datasets that need the explicit value.

@claraelk @HippocampusGirl @pbellec @bpinsard Just a heads up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40e37708ddd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
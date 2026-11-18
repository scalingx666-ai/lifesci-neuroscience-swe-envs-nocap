# Issue

**Title:** Add IAC connectivity method to ft_connectivityanalysis (cfg.method = iac)

## Description

This PR adds an optional instantaneous amplitude coupling (IAC)
connectivity method to ft_connectivityanalysis.

The implementation is fully self-contained and follows the methodology
described in Wei et al. (2021) without introducing additional assumptions
or modifications. IAC is motivated by amplitude envelope correlation:
when two signals exhibit high amplitudes at the same time, their
amplitude envelopes covary. A time-resolved (instantaneous) measure can be formed from the Hadamard product of the two amplitude-envelope time series, followed by averaging over time/trials to obtain a scalar coupling estimate.

The method is only used when cfg.method = 'iac' is explicitly selected.
Existing functionality and defaults are unaffected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d50408118bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
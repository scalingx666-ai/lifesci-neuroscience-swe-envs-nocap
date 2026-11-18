# Issue

**Title:** Dcm timings from protocol file

## Description

Hi all, in the same spirit as PR #34, here is another minor enhancement that saves users from having to modify yet another `.m`-file, namely `setupProcParams`. Specifically, I added a field called `timings` to the `dcmdef` field of the DCM protocol file: 

```json
		"timings": {
			"trialLength": 108,
			"numberOfTrials": 7,
			"feedbackDisplayDurationInScans": 4,
			"feedbackEstimationDurationInScans": 38
		}
```

This is read by `setupProcParams` and the rest of the timing settings are created dynamically.
I tested this by running the DCM Demo Data example (NF_DCM_1060) and got identical feedback values to the default version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af9b9d225173`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
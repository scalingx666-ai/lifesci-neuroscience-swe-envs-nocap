# Issue

**Title:** [FIX] Add a timeout when trying to retrieve dcm2bids version

## Description

### Description
This PR adresses #149. 

There is a bug that causes dcm2bids to hang when your computer is connected via ethernet to another device, but that device does not provide internet. The bug occurs when fetching the version of dcm2bids or dcm2niix. To fix this, a timeout is added to prevent hanging. While investigating, I noticed the `internet()` function always returns `True` and is not necessary, so it was removed. In more details this PR:

- Adds a `timeout` option when calling `check_github_latest()` to prevent hanging indefinitely
- Removes the `internet()` function as it does nothing and is not useful
  - Removes all (1) tests of the `internet()` function

Note: 
We realized the problem does not occur for everyone, it happens when using a vpn, or at least on Cisco anyconnect.. See this  for more detail.
### To replicate the problem scenario
1. Connect your computer to your router using an ethernet cable
2. Disconnect from the router the cable providing internet to your router
3. Run dcm2bids

### Linked issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abd6994dde75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
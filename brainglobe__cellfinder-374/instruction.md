# Issue

**Title:** Test Keras is present

## Description

This PR:
- Updates the dependencies and dev dependencies to work with Keras 3.0
- Replaces the Tensorflow check with a Keras check (tested in CI).

**Notes:**
- To avoid TF [overwriting](https://keras.io/getting_started/#installing-keras-3) the Keras version to 2.x, I pinned the TF version to a specific 2.16-nightly for now (same as they do in the [keras repo](https://github.com/keras-team/keras/blob/master/requirements.txt)).
- Before migrating to Keras 3.0, we checked that cellfinder tools throw an error if Tensorflow is not present. This PR replaces this check with an equivalent check for Keras.
- The CI checks that are failing (running package tests, brainmapper tests and running tests without numba) are dealt with in a .

**Question for reviewer**: 
Keras still needs a backend to work (for now tensorflow) - should we also check that one backend is defined? More on setting the backend [here](https://keras.io/getting_started/#configuring-your-backend).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8953ceca72b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
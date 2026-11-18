# Issue

**Title:** add tests and test helpers

## Description

This PR adds a simple test for the model at index 11 in the drop down list (as an example). 

The test does the following:

- builds the project and starts a static web server
- parses console.log messages to collect timing info from the page console messages
- takes a snapshot of the canvas to compare with existing snapshots

I have also moved `vite` to `devDependencies`, and added a testing related scripts to `package.json` and added a github action to run tests using github on pushes to the `master` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20a87690ebe5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
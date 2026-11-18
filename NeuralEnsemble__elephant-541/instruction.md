# Issue

**Title:** Automated registration to ebrains knowledge graph

## Description

## Changes
This PR adds a `.codemeta.json` file to elephant.

## How it works
This is a new approach to registering new software releases in the ebrains KG.
The idea is to place a file called “codemeta.json” in the root of your Git repository, which you will update as part of the usual development process, e.g. with a CI action. We will set up a cron job to regularly check this file, and if a new version is detected, a new entry will be created in the KG automatically.

There are other benefits to adding this metadata file, see https://codemeta.github.io/

There is a web form to help you create valid files: https://codemeta.github.io/codemeta-generator/

## Notes
~~The current version is set to v0.11.2, since this version has not yet bin published in the KG.~~

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06e0cd128060`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
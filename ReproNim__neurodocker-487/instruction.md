# Issue

**Title:** [INFRA] test docker builds in CI

## Description

## aim

This PR aims to provide a CI workflow to evaluate what docker build will actually succeed for "some" versions of "some" of the main software that neurodocker supports.

## changes

The PR adds:
- a jinja template for a github workflow
- a script to 
  - create actual workflows from this
  - create a build dashboard (`docs/README.md`) to be rendered with github pages
- a workflow to run that script in CI and push to a branch to run the workflows

## explanation

the template + script allow to test:
- different linux distributions (split by the package manager they use)
- different softwares that neurodocker supports
- different versions for a given software
- different install method for a given software

all of those are defined in a python dictionary.

each workflow:
- installs the latest version of neurodocker
- builds a dockerfile for a combination of OS / software / version / install method
- `cat` the dockerfile
- attempts to build the corresponding image
- each workflow will run twice a month automatically

## other

This PR also adds a dashboard to let users know what are the builds that are valid.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56d5e721c7ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Matrix row spacing

## Description

# Overview

Fixed computed positions for matrix layout to display equally spaced regardless of the Window's aspect ratio. Rows and columns should appear the same distance apart.

## Ticket

[Link a pivotal ticket here](https://www.pivotaltracker.com/story/show/185935799)

## Contributions

- Updated the matrix layout module to account for the window aspect ration when computing spacing. Also added a parameter for max_spacing to allow.
- Added demo for visualizing different matrix layout parameters.
- Added code to log the position of each symbol stim in the matrix display

## Test

- Ran all unit tests
- Ran relevant demos

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd9e344bb00c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
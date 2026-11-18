# Issue

**Title:** Add support for `.bmp` and `.jpg` images.

## Description

# Overview

Modified `alphabet` to include images with extension `.bmp` and `.jpg`.
Added test case for checking only files with the correct extensions are included.

## Ticket

Link a pivotal ticket here

## Contributions

- Modified `alphabet` to include images with extension `.bmp` and `.jpg`.
- Added test case for checking only files with the correct extensions ares included.

## Test

- Run unit test `python -m unittest bcipy/core/tests/test_symbols.py`
- Modified parameters to to point to a folder with bmp images and executed 'python bcipy/demo/bci_main_demo.py'. Images were displayed correctly.

## Documentation

- Updated `helpTip` for `path_to_presentation_images` in `bcipy/parameters/parameters.json`

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? No

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8797642b3950`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
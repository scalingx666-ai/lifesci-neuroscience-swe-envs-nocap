# Issue

**Title:** Filter updates and small fixes to offline analysis

## Description

# Overview

Update the BciPy default filter to sosfiltfilt, which will perform better than sosfilt. Update integration tests to use valid device name (DSI-24). Update load method to catch file not found error stacktrace and alert user. 

## Ticket

[Link a pivotal ticket here
](https://www.pivotaltracker.com/story/show/183840733)

## Contributions

- `signal/process/filter.py`: update to use `sosfiltfilt` https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.sosfiltfilt.html
- `helpers/raw_data.py`: update load to catch FileNotFoundError and return BciPyCoreException describing the issue
- `signal/test/model/input` update the raw_data.csv file header with a registered device name

## Test

- `Make test-all`
- Run signal model integration tests
- Run offline analysis on collected data: It improved AUC slightly in my testing and changed the direction of ERP near the end of the response. 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? M/A

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? TODO

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c615be2e4dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
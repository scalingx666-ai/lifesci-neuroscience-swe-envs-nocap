# Issue

**Title:** Simulator Metrics

## Description

# Overview

Compile metrics summarizing all of the runs in a simulation.
* Outputs summary_data.json which collects the metrics from each session.json file in the run.
* Computes descriptive statistics for each field and outputs the results to the log files and console.
* Generates box plots for several statistics of interest.
* Outputs the mean duration of the runs.

## Ticket

https://www.pivotaltracker.com/story/show/188335185

## Contributions

- Also updated sim logging to use INFO, rather than DEBUG to clean up the log files.

## Test

- Unit tests
- Ran several simulations and inspected the output.

## Screenshots
<img width="1765" alt="Screenshot 2024-12-17 at 1 37 33 PM" src="https://github.com/user-attachments/assets/abdf3f2d-cd31-4464-8e69-0f336cdef044" />

<img width="1257" alt="Screenshot 2024-12-17 at 1 37 57 PM" src="https://github.com/user-attachments/assets/0b8facd0-3615-4735-886f-0796275fdf29" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c445d2fa0fde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
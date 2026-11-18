# Issue

**Title:** Multimodal simulator

## Description

# Overview

Refactoring necessary to support multimodal simulation.

### Data Loading and Processing

- Added a `data_process` module to the simulator. Re-structured the data processing code to support models other than EEG.
- Refactored the `DataEngine` code for loading and transforming data.
- Provided `DataEngine` with a query interface to allow the engine to abstract out the details about how the data is stored (ex. Dataframe, sqlite database, etc).
-  Refactored `Sampler` code to utilize common patterns and clarify the API for future multi-modal support.

### Simulation Task
- Created a new `SimulatorCopyPhraseTask` simulation task to more closely utilize the existing BciPy code whenever possible, including logging, session data, and metrics.
- Created TaskFactory for constructing the hierarchy of objects needed to initialize simulation tasks.
- Created a TaskRunner for running the simulation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `05859b93152a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
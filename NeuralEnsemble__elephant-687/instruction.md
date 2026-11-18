# Issue

**Title:** [Enh] Function to load example or test datasets

## Description

Currently, many tutorials contain boilerplate code to fetch data from the `elephant-data` repository at http://datasets.python-elephant.org, using the `download_datasets` function in module `elephant.datasets`. This also requires additional code to instantiate Neo IO objects and retrieve the required data (e.g., load `neo.Block` and access a specific `neo.Segment`). Altogether, this makes the initial parts of the notebooks verbose. Two examples are the ASSET and Unitary Events tutorial notebooks.

In addition, some tutorials may reuse data generation functions that are shared with unit tests (for example, the Granger Causality tutorial). This might result in code redundancy.

This PR implements a new `load_data` function into `elephant.datasets` that allows directly retrieving or generating the needed data using a single keyword (e.g., `load_data('asset')`). 

The function works with a mapping `ELEPHANT_DATA` dictionary defined in the module, where two options for a given keyword are possible:
- a dictionary, whose keys correspond to arguments for the `download_datasets` function (`repo_path` and `checksum`, allowing the download from `elephant-data`), and an additional `loader` key that can store an optional callable that is used to retrieve the correct data object (e.g., the first segment in the `neo.Block` stored in the dataset)
- a callable, that directly generates the needed data.

Unit tests were expanded for `download_datasets` to verify the expected behavior, and new tests were added to validate `load_data`. The corresponding tutorial notebooks or unit test modules that share data with tutorials were also changed. A new section `Example datasets` is added to the `Miscellaneous` part of the `Function Reference by Module` section of the Elephant documentation page.

This PR did not change any code that downloads datasets for the sole purpose of unit tests, such as the tests for spectral Granger causality functions. These can be expanded later, perhaps coupled to additional tutorial notebooks or improving the testing framework with Pytest fixtures.

This PR addresses #526.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a026da3267c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
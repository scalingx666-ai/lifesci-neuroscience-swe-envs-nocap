# Issue

**Title:** Add get_structures_at_hierarchy_level method to Atlas class

## Description

Implements method to query brain structures at specific hierarchy levels within descendants of a given structure. The method finds all leaf nodes in a structure's subtree and extracts structures at the specified level from their paths.

Features:
- Query by structure ID or acronym
- Return results as IDs or acronyms
- Support for querying all levels with hierarchy_level=None
- Comprehensive input validation and error handling



---

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Filter anatomical structures by their depth in the hierarchy tree. Currently, there's no built-in method to query structures at a specific hierarchy level within a given structure's descendants. This method addresses issue #623 and enables more flexible structure queries for neuroscience data analysis.

**What does this PR do?**

Adds a new `get_structures_at_hierarchy_level` method to the `Atlas` class that:
- Finds all leaf nodes (terminal structures) in a given structure's subtree
- Extracts structures at the specified hierarchy level from their paths
- Supports querying by structure ID or acronym
- Returns results as either IDs or acronyms based on the `as_acronym` parameter
- Handles `hierarchy_level=None` to return all structures in paths to leaves
- Includes robust input validation (type checking, bounds checking, structure existence)

## References



## How has this PR been tested?

**Testing performed:**
1. Added 6 comprehensive unit tests in `tests/atlasapi/test_core_atlas.py`:
   - `test_get_structures_at_hierarchy_level` - Basic functionality with acronyms, IDs, multiple levels
   - `test_get_structures_at_hierarchy_level_none` - Tests `hierarchy_level=None` behavior
   - `test_get_structures_at_hierarchy_level_invalid_structure` - KeyError handling
   - `test_get_structures_at_hierarchy_level_negative_level` - ValueError for negative levels
   - `test_get_structures_at_hierarchy_level_wrong_type` - ValueError for wrong types
   - `test_get_structures_at_hierarchy_level_too_deep` - ValueError for levels exceeding depth

2. All tests pass (28/28 tests in test_core_atlas.py)

3. Test coverage for `core.py` increased to 99%

4. Verified no existing functionality is broken - all 22 pre-existing tests continue to pass

5. Manual testing with the example_mouse_100um atlas confirmed correct behavior

## Is this a breaking change?

No. This PR only adds a new method and does not modify any existing functionality. All existing APIs remain unchanged.

## Does this PR require an update to the documentation?

The method includes comprehensive docstrings with:
- Full parameter descriptions
- Return value documentation
- Raises documentation for error conditions
- Usage examples

If the project maintains separate user-facing API documentation, the new method should be added there. I can create a follow-up PR for documentation updates if needed.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96f7a747e124`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
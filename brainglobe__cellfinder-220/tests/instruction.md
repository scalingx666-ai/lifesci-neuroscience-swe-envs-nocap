# Issue

**Title:** Improve performance of create_all_cell_csv

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
In the function create_all_cell_csv() of cellfinder/analyse/analyse.py a df.append() call is used in a for loop, which slows down the runtime of the program to a significant extend.
(from hours to seconds)  

**What does this PR do?**
Within the for loop over the points list a temporary matrix is constructed line by line by appending the following values separately (raw_coordinate[0],raw_coordinate[1],raw_coordinate[2],atlas_coordinate[0],atlas_coordinate[1],atlas_coordinate[2],structure,hemisphere). After the loop termination a dataframe is constructed via pd.DataFrame(temp_matrix, columns = list_of_colnames, index = None).


## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

The code has been tested manually and during several cell detection runs. 
So far i did not actively assure that any information is missing. I would be happy if you could assure that. 

## Is this a breaking change?

Strong improvement in run time 

## Does this PR require an update to the documentation?

No additional change in the handling of the tool.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

[analyse.py.zip](https://github.com/brainglobe/cellfinder/files/10521247/analyse.py.zip)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3b48c07cd69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
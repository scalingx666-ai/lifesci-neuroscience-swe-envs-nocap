# Issue

**Title:** readlocs: "eval" replaced with "dynamic field names"

## Description

Hello EEGLAB,

**"eval" vs "dynamic field names":**

Here are two MathWorks blogs explaining why the usage of "eval" should be avoided mostly because of its inefficiency:
[Evading eval](https://blogs.mathworks.com/loren/2005/12/28/evading-eval/), and [More on eval](https://blogs.mathworks.com/loren/2006/01/04/more-in-eval/).

One solution that can be employed in certain problems, as an "eval" alternative, is the "[dynamic field names](https://www.mathworks.com/help/matlab/matlab_prog/generate-field-names-from-variables.html)" method. 
Dynamic field names or “dot parens” notation in MATLAB allows to reference a field in a structure, e.g., myStruct.myField, by using a string variable enclosed by parentheses, i.e., myStruct.("myFieldString").
Therefore, the eval implementation, i.e., eval(['myStruct.',myFieldString,'']), can be replaced with the dynamic field names alternative, i.e., myStruct.("myFieldString"), which is much more efficient.

There are two "eval" functions in the "readlocs.m" that I replaced with their dynamic field names alternatives (obtaining the same results after testing).

I also ran a simple simulation to compare the running elapsed time of the two methods and got the following result:
![simulation](https://github.com/sccn/eeglab/assets/17143998/ef79e2f3-fd4b-4cc2-a5d7-33b61c144c97)

Best regards,
Fardin

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba3f8b80eb85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
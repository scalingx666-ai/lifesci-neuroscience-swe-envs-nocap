# Issue

**Title:** [struct_copy_fields] works with imbricated structure

## Description

Hello, 

This PR allows struct_copy_fields to works with imbricated structure. 

Here is an example: 

```matlab

a = struct();
a.ex = struct('x', 1);


b = struct();
b.ex = struct('y', 2);

c = struct_copy_fields(a,b,0); 
% Before : c.ex only contains the field x. 
% After: c.ex contains the fields x and y

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e3edc4a731b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
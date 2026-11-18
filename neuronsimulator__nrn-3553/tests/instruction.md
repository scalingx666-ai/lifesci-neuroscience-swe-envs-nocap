# Issue

**Title:** Fix nvc++ error: input file 'libnrnmech.so' is the same as output file

## Description

I see this only with nvc++ when nrnivmodl is run and libnrnmech.so already exists. It is mentioned in #3421. The problem can be worked around by creating a temporary output with ```-o ${mech_lib}.tmp``` and subsequently moving that to ```${mech_lib}```. The nvc++ otherwise seems to interact badly with the argument ```${_SONAME}``` which expands to ```-Wl,-soname,libnrnmech.so```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d1e2f1f6948`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
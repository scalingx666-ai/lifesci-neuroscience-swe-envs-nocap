# Issue

**Title:** Update lsl_c.h

## Description

I tried to generate the go bindings using the swig definition files.
Swig complains about the line
#define LIBLSL_COMPILE_HEADER_VERSION = 113;

More
I get two errors using the swig compiler.  
This patch corrects the warning ../liblsl/include/lsl_c.h:137: Warning 305: Bad constant value (ignored).


ubuntu:~/liblsl-Generic$ swig -go -cgo  -intgosize 64 liblsl_c.i 
../liblsl/include/lsl_c.h:137: Warning 305: Bad constant value (ignored).
../liblsl/include/lsl_c.h:148: Error: Syntax error in input(1).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d7195f552d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
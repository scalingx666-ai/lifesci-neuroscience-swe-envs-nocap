# Issue

**Title:** Fixed bug in FPGrowth when using newer versions of GCC

## Description

This PR is adapted from a commit on [fporrmann/FPG](https://github.com/fporrmann/FPG).

Commit: 

Tested with gcc 11.2.0.

Error without this fix on gcc 11.2.0 :
```
      running build_ext
      building 'elephant.spade_src.fim' extension
      creating build/temp.linux-x86_64-3.10
      creating build/temp.linux-x86_64-3.10/elephant
      creating build/temp.linux-x86_64-3.10/elephant/spade_src
      creating build/temp.linux-x86_64-3.10/elephant/spade_src/src
      x86_64-linux-gnu-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O2 -Wall -g -fstack-protector-strong -Wformat -Werror=format-security -g -fwrapv -O2 -g -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -fPIC -Ielephant/spade_src/include -I/usr/include/python3.10 -c elephant/spade_src/src/fim.cpp -o build/temp.linux-x86_64-3.10/elephant/spade_src/src/fim.o -DMODULE_NAME=fim -DUSE_OPENMP -DWITH_SIG_TERM -Dfim_EXPORTS -O3 -pedantic -Wextra -Weffc++ -Wunused-result -Werror -fopenmp -std=gnu++17
      In file included from elephant/spade_src/src/fim.cpp:41:
      elephant/spade_src/include/FPGrowth.h: In constructor ‘FPGrowth::FPGrowth(Transactions&, Support, uint32_t, uint32_t, ItemC, uint32_t, uint32_t, int32_t)’:
      elephant/spade_src/include/FPGrowth.h:198:37: error: loop variable ‘p’ of type ‘const RefPair&’ {aka ‘const std::pair<unsigned int, std::shared_ptr<FrequencyRef> >&’} binds to a temporary constructed from type ‘std::pair<const unsigned int, std::shared_ptr<FrequencyRef> >’ [-Werror=range-loop-construct]
        198 |                 for (const RefPair& p : F)
            |                                     ^
      elephant/spade_src/include/FPGrowth.h:198:37: note: use non-reference type ‘const RefPair’ {aka ‘const std::pair<unsigned int, std::shared_ptr<FrequencyRef> >’} to make the copy explicit or ‘const std::pair<const unsigned int, std::shared_ptr<FrequencyRef> >&’ to prevent copying
      cc1plus: all warnings being treated as errors
      error: command '/usr/bin/x86_64-linux-gnu-gcc' failed with exit code 1
      [end of output]

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `131d093d7051`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
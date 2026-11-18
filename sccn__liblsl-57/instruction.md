# Issue

**Title:** Replace boost.bimap with std::unordered_map

## Description

Boost.bimap is a bit heavy for a query LRU cache, replacing it with a std::unordered map reduces peak compilation memory usage and debug symbol size by ~10%.

This also adds unit tests for (in-)valid XPath expressions and small optional benchmarks (`LSL_BENCHMARKS`).

Note about speed: a typical XPath expression on a huge XML stream info takes about 2us, a cached query lookup ~0.3us and 1000 cache lookups with automatic pruning of the cache about 2us.

```
trivial query                                             100            23     5.4878 ms 
                                                     2.463 us      2.427 us      2.522 us 
                                                       228 ns        154 ns        325 ns 
                                                                                          
complicated query                                         100             1    130.242 ms 
                                                   1.29732 ms    1.28074 ms    1.32216 ms 
                                                   101.818 us     76.011 us    165.859 us 
                                                                                          
Cached query                                              100           143     5.4054 ms 
                                                       311 ns        307 ns        318 ns 
                                                        25 ns         16 ns         38 ns 
                                                                                          
partially cached queries                                  100             1    190.131 ms 
                                                   1.92042 ms    1.90525 ms    1.94761 ms 
                                                   101.345 us     63.304 us    158.718 us 
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba6bee4c4d99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** C++ Standalone time measurements

## Description

With @macauwet we realized a few months ago that C++ standalone simulations add significant overhead for measuring time (for profiling, and for deciding whether to print a status report). Of course, for complex simulations this overhead is negligible, but for simple models that run for a long time it can be quite wasteful. There are two issues that lead to this overhead:
1. We use `std::clock` and divide by `CLOCKS_PER_SEC` to get the time instead of using the `chrono` mechanism introduced with C++11
2. We determine the current time at every time step to compare against the maximum runtime. This happens even when the maximum runtime mechanism isn't used (which is usually the case, it is mostly useful for benchmarks).

The first point also had another side effect: since `std::clock` measures CPU not wall time, running Brian in a thread gave non-intuitive results.

Changing the two issues is rather trivial. Here's an extreme example that shows that it drives down runtime quite a bit:
```python
# Test code
G = NeuronGroup(1, "dv/dt = 0.001/second : 1", method="euler")
run(1000 * second)
```
| | `master` | this PR |
|-|------------ | ---------- |
|`run(report='text', profile=True)` | 7.96s | 0.68 s|
|`run(profile=True)` | 6.00s | 0.50 s|
|`run(report='text')` | 3.97s | 0.39 s|
|`run()` | 2.17s | 0.23 s|

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `128341bbc51b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
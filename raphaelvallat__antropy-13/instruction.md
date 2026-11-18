# Issue

**Title:** Allow readonly arrays for higuchi_fd

## Description

The current behavior of this method changes the datatype of `x` as `np.asarray` is a wrapper for `np.array` where `copy=False`. (see [here](https://stackoverflow.com/questions/14415741/what-is-the-difference-between-numpys-array-and-asarray-functions))

I believe that this is (kind of) unexpected behavior, e.g., a user would not expect that the datatype would change when calculating a feature. Therefore, I suggest giving the user the option of not changing the datatype by adding a `copy` flag to the `higuchi_fd` function parameters. By default this flag = False, resulting in the same behavior as now (i.e., datatype of `x` is changed).


When benchmarking the speed of the code, I observed no real difference. Perhaps we should even remove the flag and just use `np.array` instead of `np.asarray`?  

```python
In [11]: x = np.random.rand(10_000).astype("float32")

In [12]: %timeit ant.higuchi_fd(x)
246 µs ± 5.24 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)

In [13]: x = np.random.rand(10_000).astype("float32")

In [14]: %timeit ant.higuchi_fd(x, copy=True)
242 µs ± 93.4 ns per loop (mean ± std. dev. of 7 runs, 1000 loops each)
```


PS: I really like the fast functions in this library :smile:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `275216aaeb22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
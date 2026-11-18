# Issue

**Title:** Remove legacy LSL_CPP11

## Description

Before commit 62e5ad3dbc575093ad37348c49b230a9a0894e84:

```cpp
class stream_inlet {
	template <typename T>
	bool pull_chunk_multiplexed(std::vector<T> &chunk, std::vector<double> *timestamps = nullptr,
		double timeout = 0.0, bool append = false) {
            // ...
#if __cplusplus > 199711L || _MSC_VER >= 1900
			chunk.insert(chunk.end(), std::make_move_iterator(sample.begin()),
				std::make_move_iterator(sample.end()));
#else
			chunk.insert(chunk.end(), sample.begin(), sample.end());
#endif
            // ...
	}
}
```

In commit 62e5ad3dbc575093ad37348c49b230a9a0894e84 (2020-12-27), `LSL_CPP11` was introduced:

```cpp
#ifndef LSL_CPP11
#if __cplusplus > 199711L || _MSC_VER >= 1900 || defined(LSL_DOXYGEN)
/// Feature macro to conditionally enable C++11 features
#define LSL_CPP11 1
#else
#define LSL_CPP11 0
#endif
#endif


// ...

class stream_inlet {
	template <typename T>
	bool pull_chunk_multiplexed(std::vector<T> &chunk, std::vector<double> *timestamps = nullptr,
		double timeout = 0.0, bool append = false) {
            // ...
#if LSL_CPP11
			chunk.insert(chunk.end(), std::make_move_iterator(sample.begin()),
				std::make_move_iterator(sample.end()));
#else
			chunk.insert(chunk.end(), sample.begin(), sample.end());
#endif
            // ...
	}
}
```

In commit d5fcdf13368c9c7eb0ab7562c7c2210ddf002494 (2021-01-29), the definition of `LSL_CPP11` was removed.

At present, this is the only place in the entire codebase that still uses `LSL_CPP11`, and since `LSL_CPP11` is no longer defined, this function is effectively using:

```cpp
chunk.insert(chunk.end(), sample.begin(), sample.end());
```

rather than the move-semantics-optimized version that was originally introduced.

Given that the project now uses C++17, I think we can remove this conditional compilation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e651023ca679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
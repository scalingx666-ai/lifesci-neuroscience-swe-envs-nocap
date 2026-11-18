# Issue

**Title:** Branch 10: Typing fixes & NumPy-style docstrings (shapes required)

## Description

## Summary
- Add comprehensive type annotations using `numpy.typing.NDArray` with precise dtypes
- Convert docstrings to NumPy style with explicit array shapes and dtypes
- Create documentation style guide with consistent patterns and examples
- Add tooling configuration for type checking and documentation validation
- Enhance all major public APIs with detailed parameter and return specifications

## Key Improvements
- **Type Safety**: Full `NDArray` annotations with `complex128`, `float64`, etc.
- **Documentation**: NumPy-style docstrings with shapes like `(n_times, n_channels, n_frequencies)`
- **Examples**: Executable code examples in all major classes and functions
- **Tooling**: mypy, pydocstyle, numpydoc configuration for continuous validation
- **Style Guide**: `docs/STYLE.md` with patterns and best practices

## Test plan
- [x] All tests pass (same 3 pre-existing failures)
- [x] Type annotations validate with mypy (minimal warnings)
- [x] Docstrings follow NumPy convention (pydocstyle clean)
- [x] Enhanced IDE support and static analysis
- [x] Comprehensive examples and shape documentation

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e6638f8275d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
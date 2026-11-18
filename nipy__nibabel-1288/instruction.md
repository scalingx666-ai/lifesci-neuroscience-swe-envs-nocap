# Issue

**Title:** MNT: Apply Repo-Review suggestions

## Description

Apply some [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipy%2Fnibabel&branch=master) suggestions.

I went for the low-hanging fruits, other changes are more invasive and deserve a PR of their own, such as using a formatter like ruff of black.

Also update minimal Python version for blue. By the way, isn't blue able to understand `requires-python`?

### Fixed issues

* [MY103](https://learn.scientific-python.org/development/guides/style#MY103): MyPy warn unreachable
  Must have `warn_unreachable = true` to pass this check. There are occasionally false positives (often due to platform or Python version static checks), so it's okay to ignore this check. But try it first - it can catch real bugs too.
  ```toml
  [tool.mypy]
  warn_unreachable = true
  ```
* [MY104](https://learn.scientific-python.org/development/guides/style#MY104): MyPy enables ignore-without-code
  Must have `"ignore-without-code"` in `enable_error_code = [...]`. This will force all skips in your project to include the error code, which makes them more readable, and avoids skipping something unintended.
  ```toml
  [tool.mypy]
  enable_error_code = ["ignore-without-code", "redundant-expr", "truthy-bool"]
  ```
* [MY105](https://learn.scientific-python.org/development/guides/style#MY105): MyPy enables redundant-expr
  Must have `"redundant-expr"` in `enable_error_code = [...]`. This helps catch useless lines of code, like checking the same condition twice.
  ```toml
  [tool.mypy]
  enable_error_code = ["ignore-without-code", "redundant-expr", "truthy-bool"]
  ```
* [MY106](https://learn.scientific-python.org/development/guides/style#MY106): MyPy enables truthy-bool
 Must have `"truthy-bool"` in `enable_error_code = []`. This catches mistakes in using a value as truthy if it cannot be falsey.
  ```toml
  [tool.mypy]
  enable_error_code = ["ignore-without-code", "redundant-expr", "truthy-bool"]
  ```

### Issues ignored

Left for later because it requires extensive fixes:
* [MY101](https://learn.scientific-python.org/development/guides/style#MY101): MyPy strict mode
  Must have `strict` in the mypy config. MyPy is best with strict or nearly strict configuration. If you are happy with the strictness of your settings already, ignore this check or set `strict = false` explicitly.
  ```toml
  [tool.mypy]
  strict = true
  ```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7b9bc4c89f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
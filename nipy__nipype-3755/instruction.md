# Issue

**Title:** fix: DataGrabber._list_outputs TypeError when single file matches template

## Description

## Problem

`DataGrabber._list_outputs()` raises `TypeError: 'in <string>' requires string as left operand, not NoneType` when exactly one file matches the template and `template_args` is empty.

**Root cause:** When `glob.glob()` returns exactly one file and there are no template args, `simplify_list(filelist)` returns a string (not a list). The code at line 1251 assigns this string directly to `outputs[key]`:

```python
outputs[key] = simplify_list(filelist)
```

Later, the check `if None in outputs[key]:` fails because `None in "string"` raises `TypeError` — Python's `in` operator for strings requires a string as the left operand.

The same bug exists in `S3DataGrabber._list_outputs()` at line 976.

## Solution

Changed both `DataGrabber` and `S3DataGrabber` to use `outputs[key].append(simplify_list(filelist))` instead of `outputs[key] = simplify_list(filelist)`, consistent with the pattern already used in the template-args code path (line 1297). This keeps `outputs[key]` as a list throughout, so the later `None in outputs[key]` check works correctly.

## Verification

All existing DataGrabber tests pass, plus two new regression tests:

```
nipype/interfaces/tests/test_io.py::test_datagrabber PASSED
nipype/interfaces/tests/test_io.py::test_datagrabber_order PASSED
nipype/interfaces/tests/test_io.py::test_datagrabber_single_file PASSED
nipype/interfaces/tests/test_io.py::test_datagrabber_single_glob_match PASSED
```

---

**About the Author:** Raphael Malikian — Clinical AI Solutions Architect. I specialise in building and fixing AI/ML systems for healthcare, including vector databases, RAG pipelines, and clinical NLP. If you need help with your project or think I can add value to your organisation, feel free to reach out — I'd love to connect.

📧 rtmalikian@gmail.com
🔗 GitHub: https://github.com/rtmalikian
🔗 LinkedIn: http://www.linkedin.com/in/raphael-t-malikian-mbbs-bsc-hons-71075436a

---

**Disclosure:** This code was developed with assistance from **mimo-2.5-pro** (Xiaomi) via **Hermes Agent** (Nous Research). All changes were reviewed, tested against the actual codebase, and verified for correctness.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bc770765781`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
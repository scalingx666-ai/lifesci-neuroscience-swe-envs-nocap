# Issue

**Title:** BF: LineSplitter: do not split a CRLF that arrives in two chunks

## Description

With the default separator (`None`), `LineSplitter` uses `str.splitlines()`. That treats a bare `"\r"` as a line ending, so a `"\r\n"` split between two chunks becomes two line endings:

```python
>>> from datalad.runner.utils import LineSplitter
>>> s = LineSplitter()
>>> s.process("a\r"), s.process("\nb\n")
(['a'], ['', 'b'])
```

The expected result is `['a']`, `['b']`. Each chunk is whatever one `os.read()` returned, so this depends on where the reads happen to split a `"\r\n"` stream. `BatchedCommand` reads its replies through this splitter (`BatchedCommandProtocol`) and pairs one line with each request, so the extra empty line would be taken as the reply to the next request.

Changes:
- `LineSplitter` remembers when the last line it returned ended with a bare `"\r"`, and drops a `"\n"` at the start of the next chunk. Lines are still returned as soon as they are complete; nothing is held back.
- Add `test_line_splitter_crlf_across_chunks` to `datalad/runner/tests/test_utils.py`. It fails on `maint`.

The explicit-separator mode already handles this, since it splits the accumulated data. The bytes and reuse points in #7519 are separate and not touched here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc8a913203a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
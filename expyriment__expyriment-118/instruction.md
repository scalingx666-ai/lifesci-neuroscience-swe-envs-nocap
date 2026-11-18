# Issue

**Title:** Fix for serial port

## Description

The serial port did not work in Python 3. In short, PySerial with Python 3 expects and returns bytes objects, not strings. This should now have been fixed (tested on OS X only).

- `read_input` will return a list of integers, each representing a byte
- `read_line` will return a `str` (Py2) or a `bytes` (Py3) (**should this instead also return a list of integers?**)
- `poll` will return an integer, representing a single byte
- `send` gets an integer as input, representing a single byte (use `for x in list(b"Hello World"): s.send(x)` to send a whole byte string

Please test on Win/Linux before merging!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `688d3490f5fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
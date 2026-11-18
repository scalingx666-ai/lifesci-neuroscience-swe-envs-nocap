# Issue

**Title:** FIX: Handle non-UTF-8 output gracefully in run_subprocess

## Description

#### reference issue (if any)

none

#### what does this implement/fix?

in `mne.utils.run_subprocess`, the stdout and stderr are decoded using `decode("utf-8")`. when an external subprocess outputs non-utf-8 bytes (for example, localized tool output on non-UTF-8 terminals or legacy binaries), it raises `UnicodeDecodeError` and crashes the calling function.

in this pr i have added `errors="replace"` to both `out.decode("utf-8")` and `err.decode("utf-8")`. i have also added `test_run_subprocess_non_utf8` to check that non-utf-8 bytes on stdout and stderr are handled gracefully without raising an unhandled exception.

<details>
<summary>Demonstration</summary>

```python
import sys
from mne.utils import run_subprocess

# Subprocess emitting non-UTF-8 bytes on stdout:
cmd = [sys.executable, "-c", "import sys; sys.stdout.buffer.write(b'output: \\xff\\xfe\\n')"]

# main: raises UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 8: invalid start byte
# fix: gracefully decodes without crashing
out, err = run_subprocess(cmd)
print("Decoded stdout:", repr(out))  # 'output: \ufffd\ufffd\n'
```

</details>

#### additional information

i wrote the fix myself, and gemini helped me to draft the initial test. after that i reviewed it, formatted it and tested everything locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d1b35c3695f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
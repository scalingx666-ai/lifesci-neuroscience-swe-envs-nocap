# Issue

**Title:** TEST: Accommodate pytest 8 changes

## Description

In earlier pytest, the following would "xfail":

```
@pytest.mark.xfail(raises=SomeException)
def example:
    with pytest.warns(SomeWarning):
        raise SomeException
```

Now, the failure to raise `SomeWarning` prior to raising an exception causes the test to fail in an unexpected way, presumably due to the order of exception chaining.

This PR adjusts our expected warning check to be disabled if an exception is expected to come first.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d884bda234a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
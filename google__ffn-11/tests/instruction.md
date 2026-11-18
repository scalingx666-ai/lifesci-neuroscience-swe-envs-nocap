# Issue

**Title:** xrange() was removed in Python 3

## Description

[flake8](http://flake8.pycqa.org) testing of https://github.com/google/ffn on Python 3.7.1

$ __flake8 . --count --select=E901,E999,F821,F822,F823 --show-source --statistics__
```
./ffn/inference/resegmentation_analysis.py:256:7: F821 undefined name 'sampling'
      sampling, result.eval.from_a)
      ^
./ffn/inference/resegmentation_analysis.py:259:7: F821 undefined name 'sampling'
      sampling, result.eval.from_b)
      ^
./ffn/utils/bounding_box.py:374:17: F821 undefined name '_required'
          yield _required(self.start_to_box((x, y, z)))
                ^
./ffn/utils/bounding_box.py:392:20: F821 undefined name 'xrange'
    for i_begin in xrange(begin_index, end_index, batch_size):
                   ^
./ffn/utils/bounding_box.py:395:11: F821 undefined name '_required'
          _required(self.index_to_sub_box(i)) for i in xrange(i_begin, i_end))
          ^
./ffn/utils/bounding_box.py:395:56: F821 undefined name 'xrange'
          _required(self.index_to_sub_box(i)) for i in xrange(i_begin, i_end))
                                                       ^
6
```
__E901,E999,F821,F822,F823__ are the "_showstopper_" [flake8](http://flake8.pycqa.org) issues that can halt the runtime with a SyntaxError, NameError, etc. These 5 are different from most other flake8 issues which are merely "style violations" -- useful for readability but they do not effect runtime safety.
* F821: undefined name `name`
* F822: undefined name `name` in `__all__`
* F823: local variable name referenced before assignment
* E901: SyntaxError or IndentationError
* E999: SyntaxError -- failed to compile a file into an Abstract Syntax Tree

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44cd0314f413`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
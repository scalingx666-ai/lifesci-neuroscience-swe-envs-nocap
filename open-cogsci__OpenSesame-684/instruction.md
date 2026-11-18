# Issue

**Title:** Added ssl certificate finder for MacOS

## Description

When packaged as a MacOS app, the paths to ssl certificates, which are used by urlopen when connecting to *any* website (even not https ones), are somehow hardcoded into the ssl module and pointed to my local dir containing the ssl certificates in my conda environment . It may be worth to check this also under windows and fix this there too if necessary by removing the platform check part of this PR. You can check the ssl certificate paths by executing:

```python
import _ssl
_ssl.get_default_verify_paths()
```
this returns a dictionary with the default (hardcoded) locations.
I dove into the code of _ssl and saw that specifications of these locations in ENV have precedence over the hardcoded locations, so that's how I solved this problem, but elegance is another thing (I don't really like my local paths exposed in an app that goes everywhere 😅.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d6554f37ccf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
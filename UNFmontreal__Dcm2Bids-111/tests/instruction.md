# Issue

**Title:** Publish dcm2bids.scaffold's data files

## Description

`dcm2bids.scaffold` must've been added recently, but its data files were not published with the package to pypi. This addresses this by:

1. Replaces `package_data` glob patterns with [`setuptools_scm`](https://pypi.org/project/setuptools-scm/) + `include_package_data` which should be a lot easier to maintain

It also makes these related changes:

2. Migrates to [`importlib.resources`](https://docs.python.org/3/library/importlib.html#module-importlib.resources)
3. Drops "tests/" from the package

### Output

This successfully includes the files you want, and drops the files I don't want. Compare:

`master`:

```
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
$ rm -rf dist/ build/  # setuptools doesn't do clean builds by default
$ python3 setup.py bdist_wheel
[...]
$ unzip -vl dist/dcm2bids-*.whl 
Archive:  dist/dcm2bids-2.1.5-py3-none-any.whl
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
     277  Defl:N      172  38% 2021-02-01 16:56 36c3a144  dcm2bids/__init__.py
    9042  Defl:N     2752  70% 2021-02-01 17:07 b073d05e  dcm2bids/dcm2bids.py
    3286  Defl:N     1028  69% 2021-02-01 16:56 186f4aa9  dcm2bids/dcm2niix.py
    1115  Defl:N      528  53% 2021-02-01 17:07 b349c873  dcm2bids/helper.py
     674  Defl:N      318  53% 2021-02-01 16:56 f7ef716e  dcm2bids/logger.py
    8435  Defl:N     2272  73% 2021-02-01 17:07 957cdd8b  dcm2bids/sidecar.py
    6795  Defl:N     1604  76% 2021-02-01 16:56 0b38256e  dcm2bids/structure.py
    2668  Defl:N     1114  58% 2021-02-01 17:07 2d195415  dcm2bids/utils.py
    4280  Defl:N     1465  66% 2021-02-01 17:07 1c81b9b9  dcm2bids/version.py
    1417  Defl:N      639  55% 2021-02-01 17:34 6ea949ce  dcm2bids/scaffold/__init__.py
      24  Defl:N       24   0% 2021-02-01 16:56 0768ea75  tests/__init__.py
    5770  Defl:N     1250  78% 2021-02-01 17:07 44c9ed35  tests/test_dcm2bids.py
    1163  Defl:N      501  57% 2021-02-01 16:56 4451d49b  tests/test_dcm2niix.py
     852  Defl:N      338  60% 2021-02-01 17:07 c737364c  tests/test_sidecar.py
     952  Defl:N      355  63% 2021-02-01 16:56 389d7d9a  tests/test_structure.py
     223  Defl:N      144  35% 2021-02-01 16:56 37ce99c4  tests/test_version.py
    3171  Defl:N     1278  60% 2021-02-01 17:35 b6780f0f  dcm2bids-2.1.5.dist-info/DESCRIPTION.rst
     130  Defl:N       70  46% 2021-02-01 17:35 cb918665  dcm2bids-2.1.5.dist-info/entry_points.txt
    1463  Defl:N      633  57% 2021-02-01 17:35 590e0215  dcm2bids-2.1.5.dist-info/metadata.json
      15  Defl:N       17 -13% 2021-02-01 17:35 f35e39c7  dcm2bids-2.1.5.dist-info/top_level.txt
      92  Defl:N       92   0% 2021-02-01 17:35 0e3f9433  dcm2bids-2.1.5.dist-info/WHEEL
    4265  Defl:N     1669  61% 2021-02-01 17:35 84f3273a  dcm2bids-2.1.5.dist-info/METADATA
    1846  Defl:N     1072  42% 2021-02-01 17:35 49889d15  dcm2bids-2.1.5.dist-info/RECORD
--------          -------  ---                            -------
   57955            19335  67%                            23 files

```

PR:


```
$ git checkout ng/pkg-data-files
Switched to branch 'ng/pkg-data-files'
Your branch is up to date with 'origin/ng/pkg-data-files'.
$ rm -rf dist/ build/  # setuptools doesn't do clean builds by default
$ python3 setup.py bdist_wheel
[...]
$ unzip -vl dist/dcm2bids-*.whl 
Archive:  dist/dcm2bids-2.1.6.dev1+gb2f2975-py3-none-any.whl
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
     277  Defl:N      172  38% 2021-02-01 16:56 36c3a144  dcm2bids/__init__.py
    9042  Defl:N     2752  70% 2021-02-01 17:07 b073d05e  dcm2bids/dcm2bids.py
    3286  Defl:N     1028  69% 2021-02-01 16:56 186f4aa9  dcm2bids/dcm2niix.py
    1115  Defl:N      528  53% 2021-02-01 17:07 b349c873  dcm2bids/helper.py
     674  Defl:N      318  53% 2021-02-01 16:56 f7ef716e  dcm2bids/logger.py
    8435  Defl:N     2272  73% 2021-02-01 17:07 957cdd8b  dcm2bids/sidecar.py
    6795  Defl:N     1604  76% 2021-02-01 16:56 0b38256e  dcm2bids/structure.py
    2668  Defl:N     1114  58% 2021-02-01 17:07 2d195415  dcm2bids/utils.py
    4280  Defl:N     1465  66% 2021-02-01 17:07 1c81b9b9  dcm2bids/version.py
      75  Defl:N       74   1% 2021-02-01 16:56 bdb4c2b1  dcm2bids/scaffold/CHANGES
     870  Defl:N      280  68% 2021-02-01 16:56 9e60559b  dcm2bids/scaffold/README
    1494  Defl:N      686  54% 2021-02-01 17:36 fee70366  dcm2bids/scaffold/__init__.py
     258  Defl:N      134  48% 2021-02-01 16:56 aff55589  dcm2bids/scaffold/dataset_description.json
     528  Defl:N      272  49% 2021-02-01 16:56 da79758c  dcm2bids/scaffold/participants.json
     110  Defl:N       76  31% 2021-02-01 16:56 62e243c9  dcm2bids/scaffold/participants.tsv
    3171  Defl:N     1278  60% 2021-02-01 17:36 b6780f0f  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/DESCRIPTION.rst
     130  Defl:N       70  46% 2021-02-01 17:36 cb918665  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/entry_points.txt
    1477  Defl:N      646  56% 2021-02-01 17:36 0a3bd5dc  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/metadata.json
       9  Defl:N       11 -22% 2021-02-01 17:36 14f4d4ae  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/top_level.txt
      92  Defl:N       92   0% 2021-02-01 17:36 0e3f9433  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/WHEEL
    4279  Defl:N     1682  61% 2021-02-01 17:36 628ac811  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/METADATA
    1918  Defl:N     1070  44% 2021-02-01 17:36 b26accf0  dcm2bids-2.1.6.dev1+gb2f2975.dist-info/RECORD
--------          -------  ---                            -------
   50983            17624  65%                            22 files

```

### Caveats

This *doesn't* include `setuptools_scm`'s recommended "pyproject.toml":

```
# pyproject.toml
[build-system]
requires = ["setuptools>=42", "wheel", "setuptools_scm[toml]>=3.4"]

[tool.setuptools_scm]
```

but that's because I think pyproject.toml is unstable and overengineered. But maybe, for future-proofing, it should include that too.

`setuptools_scm` does more than just include git-tracked files; I think it also changes the naming convention for the package, e.g. in my testing it's been producing "dcm2bids-2.1.6.dev1+gb2f2975-py3-none-any.whl". But the idea is you should already be tracking your versions by git tags, and when you do a release from github it will tag it properly and distribute it as "dcm2bids-2.1.6-py3-none-any.whl"; but I don't know how to test that without publishing it, so if it's wrong maybe you'll have to do a "dcm2bids-2.1.7-none-any.whl" or a "dcm2bids-2.1.8-none-any.whl" too. I'm not sure what other changes it makes.

I hope dropping "tests/" is okay. It's still included in the sdist; but including it in the bdist -- in the actual installed package -- is a problem because it makes "import tests" work globally on any system that has dcm2bids installed, which is going to cause confusion somewhere.

### Related

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de8bc00ebf71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Pin ndx-optogenetics to 0.2.0 to fix import errors

## Description

# Description

Version 0.3.0 of `ndx-optogenetics` removed `OpticalFiberLocationsTable` and `OptogeneticVirusInjection` classes, breaking imports in spyglass.

- Fixes import error for optogenetics
    - `pyproject.toml`: Pin `ndx-optogenetics<=0.2.0` to ensure required classes remain available

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

----

*This section details on the original issue you should resolve*

<issue_title>import error for optogenetics</issue_title>
<issue_description>the current version of spyglass seems to require a package called ndx_optogenetics. when i tried to install this package via pip in my environment i still was not able to import its functions (OpitcalFiberLocationsTable and OptogeneticVirusInjection). thanks.
this is from the file common_optogenetics.py</issue_description>

<agent_instructions>Update pyproject.toml to pin "ndx-optogenetics<=0.2.0"</agent_instructions>

## Comments on the Issue (you are @copilot in this section)

<comments>
<comment_new><author>@MichaelCoulter</author><body>
this is an issue because importing spyglass.common includes this optogenetics file</body></comment_new>
<comment_new><author>@edeno</author><body>
`pip install ndx-optogenetics`</body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
right. after doing that it couldnt find the two functions within that package.
</body></comment_new>
<comment_new><author>@edeno</author><body>
@samuelbray32 thoughts?</body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
this is what i see in ipython
```python
ImportError                               Traceback (most recent call last)
Cell In [1], line 1
----> 1 from ndx_optogenetics import OpticalFiberLocationsTable

ImportError: cannot import name 'OpticalFiberLocationsTable' from 'ndx_optogenetics' (/home/mcoulter/anaconda3/envs/spyglass2/lib/python3.9/site-packages/ndx_optogenetics/__init__.py)

In [2]: from ndx_optogenetics import OptogeneticVirusInjection
---------------------------------------------------------------------------
ImportError                               Traceback (most recent call last)
Cell In [2], line 1
----> 1 from ndx_optogenetics import OptogeneticVirusInjection

ImportError: cannot import name 'OptogeneticVirusInjection' from 'ndx_optogenetics' (/home/mcoulter/anaconda3/envs/spyglass2/lib/python3.9/site-packages/ndx_optogenetics/__init__.py)

In [3]:
``` </body></comment_new>
<comment_new><author>@samuelbray32</author><body>
Not sure why you wouldn't have it.  What version of `ndx_optogenetics` is installed?
</body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
the one i found on pypi is 0.3.0</body></comment_new>
<comment_new><author>@samuelbray32</author><body>
can you check that's what's installed locally?</body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
this is what i see
ndx-ophys-devices         0.3.1                    pypi_0    pypi
ndx-optogenetics          0.3.0                    pypi_0    pypi
</body></comment_new>
<comment_new><author>@edeno</author><body>
are you in the correct environment?</body></comment_new>
<comment_new><author>@CBroz1</author><body>
Sometimes as a sanity check, I'll run

```python
import module
print(module.__version__)
print(module.__file__)
```

And then ...
1. Go to that version of that module on github and search (keyboard shortcut `/`) for the missing object
2. Open the relevant file in the module directory to confirm that it's there, and matches the version I see on github</body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
maybe my installation of ndx_optogenetics didnt work properly. this is what i see
```python
In [1]: import ndx_optogenetics
/home/mcoulter/anaconda3/envs/spyglass2/lib/python3.9/site-packages/pandas/core/computation/expressions.py:21: UserWarning: Pandas requires version '2.8.4' or newer of 'numexpr' (version '2.8.3' currently installed).
  from pandas.core.computation.check import NUMEXPR_INSTALLED
/home/mcoulter/anaconda3/envs/spyglass2/lib/python3.9/site-packages/pandas/core/arrays/masked.py:60: UserWarning: Pandas requires version '1.3.6' or newer of 'bottleneck' (version '1.3.5' currently installed).
  from pandas.core import (

In [2]: print(ndx_optogenetics.__version__)
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)
Cell In [2], line 1
----> 1 print(ndx_optogenetics.__version__)

AttributeError: module 'ndx_optogenetics' has no attribute '__version__'

In [3]: print(ndx_optogenetics.__file__)
/home/mcoulter/anaconda3/envs/spyglass2/lib/python3.9/site-packages/ndx_optogenetics/__init__.py

In [4]:
``` </body></comment_new>
<comment_new><author>@MichaelCoulter</author><body>
maybe other people won't run into this issue.</body></comment_new>
<comment_new><author>@rly</author><body>
Could you try downgrading to `ndx-optogenetics==0.2.0`? 0.3.0 introduced major changes that I think we have not yet propagated to ndx-franklab-novela, trodes-to-nwb, and spyglass. </body></comment_new>
<comment_new><author>@rly</author><body>
The latest ndx-franklab-novela pins ndx-optogenetics to 0.2.0 so that should have been installed, but maybe the environment solver prioritized installed a later version of ndx-o...

</details>

- Fixes LorenFrankLab/spyglass#1457

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `407cd6624ac4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
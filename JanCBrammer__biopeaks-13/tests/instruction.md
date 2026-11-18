# Issue

**Title:** complete install instructions for users who already have python

## Description

related to JOSS review ()

the installation worked well for me. Just two minor extensions here.

1. using link formatting instead of just pasting a URL
1. telling the users who already have python how to open the application

Furthermore some questions/hints:

1. In the installation you specify minimum versions for each package, why are you not specifying them in your `environment.yml` file?
1. Did you know that you can use `setup.py` to automatically install dependencies upon `pip install biopeaks`? See [`install_requires`](https://packaging.python.org/discussions/install-requires-vs-requirements/#id5) and an example [here](https://github.com/sappelhoff/remedian/blob/4a93705b52111663eab626002c6579cbef3f6973/setup.py#L40) --> that could simplify the installation for users ... but I am also fine with your current advertised installation procedure.
1. It seems like you indicate the current "version" of biopeaks  in `setup.py` --> it tells me [1.4.0 right now](https://github.com/JanCBrammer/biopeaks/blob/89fe7c8c80de29549951e6f7fed75fb21506903a/setup.py#L7). However, you are already some commits behind the version of the code when `1.4.0` was released. One convention to deal with this is to after each release, make the next commit immediately as a version increment to the next version you want to develop, but with an `.dev0` appendix. For example your version would now be `1.5.0.dev0` if you are expecting to develop 1.5.0 ... or `1.4.1.dev0` if you are developing 1.4.1 --> the advantage of this is that you can always pin bugs down to the exact version of your software ... with the situation as it is currently you don't know if a bug comes from the `master` (development) version, or from the stable version from pypi. See [pep440](https://www.python.org/dev/peps/pep-0440/) for more info

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89fe7c8c80de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
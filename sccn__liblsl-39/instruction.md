# Issue

**Title:** Use sphinx+breathe for documentation

## Description

A colleague sent me some outdated documentation while we were troubleshooting build issues and it feels like Chad and I are explaining the same things in the slack channel over and over. Also, the docstrings in the liblsl headers are nice, but not really used right now, so I've started a documentation prototype with [sphinx](http://www.sphinx-doc.org/en/master/) and [breathe](https://breathe.readthedocs.io/en/latest/).
 
Breathe takes the docstrings in the header files and makes it easy to include them in the documentation, while Sphinx is the default documentation system for Python projects.

Some examples: [this simple document](https://github.com/tstenner/liblsl/blob/docs/doc/ref/freefuncs.rst) is turned into this: https://lsl.dienstli.ch/html/ref/freefuncs.html

The parameters and everything else is taken directly from the comments in the header file

Then, [an another document](https://github.com/tstenner/liblsl/blob/docs/doc/usersguide.rst) can just reference the functions and the links to the reference pages are created automatically: https://lsl.dienstli.ch/html/usersguide.html

This should enable us to explain the concepts while keeping the references to the code up to date without duplicating the effort.

As a side-effect, it's quite easy to let [readthedocs](https://readthedocs.org/) build and host the documentation, so there's one place for the up-to-date documentation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b601525b6ff1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
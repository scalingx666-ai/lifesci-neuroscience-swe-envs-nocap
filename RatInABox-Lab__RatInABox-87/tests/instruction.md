# Issue

**Title:** Add Sphinx-based website

## Description

This PR adds a simple website using the [PyData Sphinx Theme](https://pydata-sphinx-theme.readthedocs.io/en/stable/) generated from the [NIU Python cookiecutter template](https://github.com/neuroinformatics-unit/python-cookiecutter). 

To give an idea of a future website structure, I've copied the README information along with the mission statement. I've restructured this a bit, mostly to give a sense of what the final website could look like. Some of the links may be a bit brittle (I did a find and replace for local links). Eventually all the gifs etc should probably be in `docs/source/_static` or equivalent. 

All files are in `docs/` and there is a `README.md` with some information, but to render locally, you only need to install the dependencies (`pip install -r docs/requirements.txt`) and build the docs `sphinx-build docs/source docs/build`). To view, open `docs/build/index.html` in a browser.

This PR also includes a GitHub action that will build the docs into a seperate branch (`gh-pages`) whenever a tag is released. Enabling GitHub pages in settings will host this website at https://ratinabox-lab.github.io/ratinabox.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `678918743992`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Feature: CI with GitHub actions

## Description

### Continuous Integration with GitHub Actions (Travis ⟶ GitHub actions)
In this workflow several runners are setup to run tests on elephant.

Many ideas from the old Travis CI workflow have been recycled to create the following runners:

## 1. build-and-test-pip
- OS: Ubuntu
- Python: [3.6, 3.7, 3.8, 3.9] 
- `pip install requirements,` (_requirements-tests.txt, requirements.txt, requirements-extras.txt_)
- `pip install -e .`
- test with `pytest`

**Runners:**
- build-and-test-pip (3.6, ubuntu-latest)
- build-and-test-pip (3.7, ubuntu-latest)
- build-and-test-pip (3.8, ubuntu-latest)
- build-and-test-pip (3.9, ubuntu-latest)

## 2. test-conda
- OS: Ubuntu 
- Python: [3.9] 
- install conda enviroment using _enviroment-tests.yml_
- `pytest` 

**Runners:**
- test-conda (ubuntu-latest)

## 3. test-pip
- OS: Windows
- Python: [3.8] 
- `pip install requirements` (_requirements-tests.txt, requirements.txt, requirements-extras.txt_)
- `pip install -e .`
- test with `pytest`

**Runners:**
- test-pip (3.8, windows-latest)

## 4. test-pip-MPI:
- OS: Ubuntu 
- Python: [3.6] 
- `pip install requirements` (_requirements-tests.txt, requirements.txt, requirements-extras.txt_)
- `pip install -e .`
- test with `pytest` (for MPI use: `mpiexec -n 1 python -m mpi4py -m pytest --cov_elephant`)

**Runners:**
- test-pip-MPI (3.6, ubuntu-latest)

## 5. docs:
- OS: Ubuntu, Python: [3.9] 
- install openmpi
- `pip install requirements` (_requirements-docs.txt, requirements-tutorials.txt_)
- install conda enviroment using _enviroment-docs.yml_
- install pandoc with conda
- `make html`

**Runners:**
- docs (ubuntu-latest)

- [x] change link to status badge in README.md (current: INM-6/elephant) 
- [x] restructure `environment.yml`, separate environment files for tests and building docs
- [ ] add specific triggers to run different tests, i.e. do not run all tests on "PR open" 
- [ ] remove Travis (`.travis.yml` and `requirements/environment.yml`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0d39206a5a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
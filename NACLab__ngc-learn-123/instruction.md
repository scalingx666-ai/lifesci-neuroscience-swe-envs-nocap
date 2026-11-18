# Issue

**Title:** Refactoring neuronal and synaptic components

## Description

# Refactoring components TODO-list

**NOTE:** Please don't merge this to the v3 upstream until we finish all TODO items and carefully review the code.

## The following files will be refactored

### 1. Graded Neurons:
- [x] [`bernoulliErrorCell.py`](/ngclearn/components/neurons/graded/bernoulliErrorCell.py)
- [x] [`gaussianErrorCell.py`](/ngclearn/components/neurons/graded/gaussianErrorCell.py)
- [x] [`laplacianErrorCell.py`](/ngclearn/components/neurons/graded/laplacianErrorCell.py)
- [x] [`rateCell.py`](/ngclearn/components/neurons/graded/rateCell.py)
- [x] [`rewardErrorCell.py`](/ngclearn/components/neurons/graded/rewardErrorCell.py)

### 2. Patched Synapses:
- [x] [`hebbianPatchedSynapse.py`](`/ngclearn/components/synapses/patched/hebbianPatchedSynapse.py`)
- [x] [`patchedSynapse.py`](`/ngclearn/components/synapses/patched/patchedSynapse.py`)

### 3. Hebbian Synapses:
- [x] [`BCMSynapse.py`](/ngclearn/components/synapses/hebbian/BCMSynapse.py)
- [x] [`eventSTDPSynapse.py`](/ngclearn/components/synapses/hebbian/eventSTDPSynapse.py)
- [x] [`expSTDPSynapse.py`](/ngclearn/components/synapses/hebbian/expSTDPSynapse.py)
- [x] [`hebbianSynapse.py`](/ngclearn/components/synapses/hebbian/hebbianSynapse.py)

### 4. Others:
- [x] [`expKernel.py`](/ngclearn/components/other/expKernel.py)
- [ ] [`REINFORCESynapse.py`](ngclearn/components/synapses/modulated/REINFORCESynapse.py) (for the next PR)

### 5. Spiking Neurons:
- [x] [`sLIFCell.py`](/ngclearn/components/neurons/spiking/sLIFCell.py)

## The following test cases will be modified (for the next PR)

### 1. Graded Neurons:
- [ ] [`test_bernoulliErrorCell.py`](/tests/components/neurons/graded/test_bernoulliErrorCell.py)
- [ ] [`test_gaussianErrorCell.py`](/tests/components/neurons/graded/test_gaussianErrorCell.py)
- [ ] [`test_laplacianErrorCell.py`](/tests/components/neurons/graded/test_laplacianErrorCell.py)
- [ ] [`test_RateCell.py`](/tests/components/neurons/graded/test_RateCell.py)
- [ ] [`test_rewardErrorCell.py`](/tests/components/neurons/graded/test_rewardErrorCell.py)

This PR should be merged when all items in the checklist are completed and carefully reviewed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6cb319a94289`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
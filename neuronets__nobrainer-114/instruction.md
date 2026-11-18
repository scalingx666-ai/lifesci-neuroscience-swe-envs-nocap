# Issue

**Title:** Add progressiveGAN for 3D brain MR images

## Description

## Types of changes
<!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
- [ ] Bug fix (non-breaking change which fixes an issue)
- [x] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to change)

## Summary
<!--- What does your code do? -->
Adds a generative adversarial network which uses a progressively growing generator and discriminator to generate high resolution brain MR images. Trained using a wasserstein loss with gradient penalty.

## Checklist
<!--- Please, let us know if you need help-->
- [ ] All tests passing
- [x] I have added tests to cover my changes
- [x] I have updated documentation (if necessary)
- [x] My code follows the code style of this project
(we are using `black`: you can `pip install pre-commit`,
run `pre-commit install` in the `pydra` directory
and `black` will be run automatically with each commit)

## TODO
- [x] Add networks
- [x] Add losses for training
- [x] Add multi-resolution tfrecord writing
- [x] Add trainer component
- [x] Add example guide to run training
- [x] Add inference using saved model
- [x] Add cli for generation
- [x] Add tests for the networks
- [ ] Add visual evaluation tools (interpolation, nearest neighbor etc)

## Acknowledgment
- [x] I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4919ea1e722e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
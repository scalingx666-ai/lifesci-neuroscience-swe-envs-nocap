# Issue

**Title:** Support 2D classification

## Description

Adds 2D classification via a depth-1 cube. A helper validates the 2D/3D processing mode, and the ResNet classifier accepts both 2D and 3D inputs. Standalone: detection, training, and napari support follow in later PRs of this stack.

**Stack:** first of six.

Progresses #298 (2D ResNet and 2D CubeGenerator).

## Changes
- Accept 2D and 3D inputs in the ResNet classifier.
- Add a helper to validate the 2D/3D processing mode.
- Support classification on a depth-1 cube.
- Unit tests for the classifier build, the mode helper, and cube generation.

## Design
- One ResNet builder resolves the convolution and pooling rank from the input shape, so the same code emits a 2D or 3D network with no duplicated builder.
- Classification reuses the existing cube generator with a depth-1 cube and squeezes the z axis; it accepts 2D or 3D signal/background arrays.
- `dimensions` defaults to 3, so no existing 3D behaviour changes at the defaults.

## Testing
Unit tests cover the added lines: the 2D and 3D classifier builds, the mode validator, and depth-1 cube generation. Run under `KERAS_BACKEND=torch`.

## Results

ResNet-50, 100 epochs, 10,756 held-out test cubes.

| Model | Test acc | F1 | Precision | Recall | ROC-AUC | AP |
|-------|----------|-----|-----------|--------|---------|-----|
| 3D 2-channel (existing default) | 0.979 | 0.978 | 0.971 | 0.984 | 0.997 | 0.995 |
| 2D 2-channel | 0.974 | 0.973 | 0.953 | 0.994 | 0.995 | 0.993 |
| 2D 1-channel | 0.964 | 0.963 | 0.951 | 0.974 | 0.992 | 0.989 |

The 3D row is the existing default model, for reference; 2D trades a little accuracy for the reduced input. Nothing in this PR changes the 3D path.

### Training curves
![2ch training curves](https://raw.githubusercontent.com/aymuos15/cellfinder/pr-assets/01_classification/training_curves_2d_2ch.png)
![1ch training curves](https://raw.githubusercontent.com/aymuos15/cellfinder/pr-assets/01_classification/training_curves_2d_1ch.png)

### Confusion matrices
![2ch confusion](https://raw.githubusercontent.com/aymuos15/cellfinder/pr-assets/01_classification/confusion_matrix_2d_2ch.png)
![1ch confusion](https://raw.githubusercontent.com/aymuos15/cellfinder/pr-assets/01_classification/confusion_matrix_2d_1ch.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `481838830456`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
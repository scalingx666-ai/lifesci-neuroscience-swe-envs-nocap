# Issue

**Title:** Range param

## Description

# Overview

Added a new parameter type for inputing ranges of values.

## Ticket

https://www.pivotaltracker.com/story/show/184752380

## Contributions

- Added parser and serializer for a new range type in the parameters helper.
- Added a GUI widget and FormInput. The RangeWidget can support both float and int types. The numeric type is determined from the current value and the list of recommended values.
- Updated the params_form GUI to support the new range type.

## Test

- Added unit tests for the new parameter type.
- Ran all unit tests
- Tested the params_form GUI with a sample parameters file that included the range widget. Tested multiple scenarios including using int values, float values, limiting the ranges, ensuring that low value cannot be set to be greater than range max.

## Discussion

The widget is pretty basic at this point consisting of numeric inputs for the low and high values. The slider widget included in Qt5 only supports a single value. There is a RangeSlider widget available through another library (https://github.com/pyapp-kit/superqt) that we may want to consider using.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `542b190e3d07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
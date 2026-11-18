# Issue

**Title:** Add mock units table

## Description

## Motivation

Add a quick method to create mock units table
Is this something that would be of interest or useful to have?


## How to test the behavior?

Should we have tests for the mock methods?

```python
from pynwb.testing.mock.ecephys import mock_Units


units_table = mock_Units()
units_table.to_dataframe()
```

Produces the following output.

|   id | unit_name   | spike_times                                                                                                                                                                        |
|-----:|:------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    0 | unit_0      | [0.6369616873214543, 0.9067484010853246, 0.9477219250215193]                                                                                                                       |
|    1 | unit_1      | [0.8158535541215322, 0.8185920542916802, 1.6759963308792496, 1.709581906184714, 2.439237352614658]                                                                                 |
|    2 | unit_2      | [0.028319671145462966, 0.1526029476450269, 0.8232273623386572]                                                                                                                     |
|    3 | unit_3      | [0.6884467305709401, 1.0773681545500438, 1.212464659572455]                                                                                                                        |
|    4 | unit_4      | [0.5715298307297609, 0.8933992218057031, 1.4876992520053998, 1.825610477512533, 2.2172294780406943, 3.1075038300454865, 3.3346614235788663, 3.9578485682649087, 4.041863911847294] |
|    5 | unit_5      | [0.7870983074886834, 1.0264677504816355, 1.9029519812923392, 1.9615200160975337, 2.297637076643194, 2.447916543538033, 2.89825591018732, 3.694580180474614]                        |
|    6 | unit_6      | [0.4045518398215282, 0.6030648843307835]                                                                                                                                           |
|    7 | unit_7      | [0.6291081515397092, 1.5562627046075765, 1.9966398593233605, 2.9512303530140978, 3.4511261667017448, 3.8763547915508205, 4.496568243566198, 5.491664748801522, 6.440608423739287]  |
|    8 | unit_8      | [0.7577288453082914, 1.2551515407959104, 1.784463700992681, 2.5702494017064885, 2.9849052510621594, 3.7193888228508887, 4.430531700840638, 5.3625913874540165, 5.477524020734922]  |
|    9 | unit_9      | [0.9274239286245599, 1.8953501185492063, 1.9100564235145756]                                              

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `faa88847bdd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
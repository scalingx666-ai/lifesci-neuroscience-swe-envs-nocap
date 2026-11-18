# Issue

**Title:** WIP: query related regions (e.g. homologies)

## Description

n.b. needs brainscapes configuration branch feat_ebrainsRef https://jugit.fz-juelich.de/t.dickscheid/brainscapes-configurations/-/tree/feat_ebrainsRef PR (https://jugit.fz-juelich.de/t.dickscheid/brainscapes-configurations/-/merge_requests/115)

sample code (n.b. needs `feat_ebrainsRef` branch of configuration):

```python
import siibra
from concurrent.futures import ThreadPoolExecutor
from  itertools import repeat

wax_parc = "waxholm v3"
wax_reg = "cornu ammonis 1"

def foo():
    with siibra.QUIET:
        
        reg = siibra.get_region("2.9", "PGa")
        for ass in reg.related_regions:
            print(ass)

        print("now for mebrains")
        reg = siibra.get_region("monkey", "PG")
        for ass in reg.related_regions:
            print(ass)


        print(f"how about {wax_parc}? {wax_reg}")
        reg = siibra.get_region(wax_parc, wax_reg)
        with ThreadPoolExecutor() as ex:
            features = ex.map(
                siibra.features.get,
                [ass.assigned_structure for ass in reg.related_regions],
                repeat("ebrains")
            )

        print([f.name for fts in features for f in fts])
        
        for ass in reg.related_regions:
            print(ass)

foo()
```

expected output:

```
[siibra:WARNING] config.SIIBRA_USE_CONFIGURATION defined, use configuration at /home/xgui3783/dev/projects/brainscapes-configurations/
[siibra:INFO] Using custom configuration from LocalFileRepository at /home/xgui3783/dev/projects/brainscapes-configurations/
[siibra:INFO] Version: 0.4a62
[siibra:WARNING] This is a development release. Use at your own risk.
[siibra:INFO] Please file bugs and issues at https://github.com/FZJ-INM1-BDA/siibra-python.
'Area PGa (IPL)' is another version of 'Area PGa (IPL)'
'Area PGa (IPL)' is another version of 'Area PGa (IPL)'
'Area PGa (IPL)' is another version of 'Area PGa (IPL)'
'Area PGa (IPL)' is another version of 'Area PGa (IPL)'
'Area PGa (IPL)' is another version of 'Area PGa (IPL)'
'Area PGa (IPL)' is homologous to 'PG'
now for mebrains
'PG' is homologous to 'Area PGa (IPL)'
'PG' is homologous to 'Area PGa (IPL) left'
'PG' is homologous to 'Area PGa (IPL) right'
'PG' is homologous to 'Area PGa (IPL)'
'PG' is homologous to 'Area PGa (IPL) left'
'PG' is homologous to 'Area PGa (IPL) right'
'PG' is homologous to 'Area PGa (IPL)'
'PG' is homologous to 'Area PGa (IPL) right'
'PG' is homologous to 'Area PGa (IPL) left'
how about waxholm v3? cornu ammonis 1
['Ebrains Dataset: Multi-area recordings from visual and somatosensory cortices, perirhinal cortex and hippocampal CA1 (v1)', 'Ebrains Dataset: 3D reconstructions of pyramidal cells in rat hippocampal CA1 region (v1)', 'Ebrains Dataset: Density measurements of different receptors for CA, stratum moleculare (Hippocampus) [rat]', 'Ebrains Dataset: Density measurements of different receptors for CA, stratum cellulare (Hippocampus) [rat]', 'Ebrains Dataset: Density measurements of different receptors for CA1 (Hippocampus) [rat]', 'Ebrains Dataset: Wistar rat hippocampus CA1 pyramidal cell morphologies – Extension with additional reconstructions', 'Ebrains Dataset: Wistar rat hippocampus CA1 pyramidal cell morphologies']
'cornu ammonis 1' is another version of 'cornu ammonis 1'
```

edit 2023-10-11: updated example

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfba45871929`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
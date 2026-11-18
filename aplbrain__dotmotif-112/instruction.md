# Issue

**Title:** Add node attribute bracket syntax

## Description

Adds support for "bracket" syntax for node attributes. An attribute like `XYZ(ABC)` or `ABC DEF` used to be disallowed because of illegal characters in the attribute name, particularly when using the "dot-attribute" notation:

```c
# broken:
A -> B
A.ABC DEF > 10
```

The new syntax uses bracket-attribute notation to "escape" these names:

```python
# working:
import dotmotif
from dotmotif.executors.NeuPrintExecutor import NeuPrintExecutor

HOSTNAME = "neuprint.janelia.org"
DATASET = "hemibrain:v1.2.1"
TOKEN = "[YOUR TOKEN HERE]"

motif = dotmotif.Motif("""
A -> B
A['AVLP(R)'] = True
""")

E = NeuPrintExecutor(HOSTNAME, DATASET, TOKEN)

E.find(motif, limit=2)
```

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f30f243351c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
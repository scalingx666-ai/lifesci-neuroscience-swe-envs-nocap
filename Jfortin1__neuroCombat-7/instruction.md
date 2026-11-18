# Issue

**Title:** added neuroCombatFromTraining

## Description

Reimplements neuroCombatFromTraining from R version in python. So
```R
library(neuroCombat)
data  <- combatExampleData
scanner <- combatExampleScanner
indices.training <- c(1:10)
indices.test     <- c(1,2,6,7)
data.training    <- data[, indices.training]
data.test        <- data[, indices.test]
scanner.training   <- scanner[indices.training]
scanner.test       <- scanner[indices.test]
data.training.harmonized <- neuroCombat(data.training, batch=scanner.training)
data.test.harmonized <- neuroCombatFromTraining(data.test, batch=scanner.test, estimates=data.training.harmonized$estimates)
sum(data.test.harmonized$dat.combat)
```
should be equivalent to
```py
import pandas as pd
data = pd.read_csv("../data/combatExampleData.csv") # write.csv(combatExampleData, "combatExampleData.csv", row.names = F)
scanner = pd.read_csv("../data/combatExampleScanner.csv")
indices_training = range(10)
indices_test = [0, 1, 5, 6]
data_training = data.iloc[:, indices_training]
data_test = data.iloc[:, indices_test]
scanner_training = scanner.iloc[indices_training, :]
scanner_test = scanner.iloc[indices_test, :]
import neuroCombat as nc
training_harmonized = nc.neuroCombat(data_training, scanner_training, 'x')
test_harmonized = nc.neuroCombatFromTraining(data_test, batch=scanner_test, estimates=training_harmonized['estimates'])
print(test_harmonized['combat'].sum().sum())
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8855c9a5e142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
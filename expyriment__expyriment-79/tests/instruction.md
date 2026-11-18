# Issue

**Title:** Stimulation protocol updates

## Description

Stimulation protocols can now create an experimental block.

Hence, fMRI experiments can now simply be run somehow like this:

```
import expyriment as x
from expyriment.design.extras import StimulationProtocol

exp = x.control.initialize()
protocol = StimulationProtocol()
protocol.import_from_brainvoyager("run1.prt", unit="msec")
exp.add_block(protocol.get_as_experimental_block("Run1"))

fixcross = x.stimuli.FixCross()
# CREATE EXPERIMENTAL STIMULI HERE

exp.keyboard.wait()  # Wait for first volume (USBtoKeyboard trigger)
exp.clock.reset_stopwatch()

for block in exp.blocks:
    for trial in block.trials:
        fixcross.present()
        while exp.clock.stopwatch_time < trial.get_factor("begin"):
            pass
        # PRESENT STIMULUS HERE
        exp.clock.wait(trial.get_factor("end") - trial.get_factor("begin"))

x.control.end()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7c8ff5fe536`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
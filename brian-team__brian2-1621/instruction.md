# Issue

**Title:** Interrupt hook (graceful stop with Ctrl+C)

## Description

This interrupts a "graceful stop" if you interrupt a simulation with Ctrl+C (or e.g. use the interrupt mechanism in a Jupyter notebook). During a simulation run, pressing Ctrl+C will not trigger the usual interrupt (or `KeyboardInterrupt`), but instead do the equivalent of a `Network.stop()`, i.e. finish the current time step and then stop the simulation. This means that in particular for scripts that the code after the simulation run will still be run and can analyse/save/plot results. This works for both runtime and C++ standalone simulations.

@thesamovar @bdevans could you please test this on Windows/macOS? I'd use an example that takes a while to run, e.g. [COBAHH](https://brian2.readthedocs.io/en/stable/examples/COBAHH.html). After it shows "Starting simulation at t=0. s for a duration of 1. s", you can press Ctrl+C which should output a warning and gracefully shut down the simulation at a time < the requested runtime, e.g.:
```
Starting simulation at t=0. s for a duration of 1. s
WARNING    Simulation stop requested. Press Ctrl+C again to interrupt. [brian2]
0.5314 s (53%) simulated in 3s, estimated 3s remaining.
```

If you could test this both in the default runtime mode and with an added `set_device('cpp_standalone')`, this would be great. In particular for the C++ standalone mechanism, I am not 100% sure whether it works the same on all OSes.
Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b7c13d19091`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
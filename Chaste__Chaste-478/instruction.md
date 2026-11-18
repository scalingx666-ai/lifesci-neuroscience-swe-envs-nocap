# Issue

**Title:** Adaptive timestep loop

## Description

This pull request relates to Issue #448 ().

In some rare instances, vertex mesh simulations would infinitely loop and never reached completion or exit due to any error. Initially thought to be a soft crash this was actually being caused due to the following lines of code in OffLatticeSimulation.cpp when adaptive time step was turned on (Starts on line 137).

```
        catch (StepSizeException& e)
        {
            // Detects if a node has travelled too far in a single time step
            if (mpNumericalMethod->HasAdaptiveTimestep())
            {
                // If adaptivity is switched on, revert node locations and choose a suitably smaller time step
                RevertToOldLocations(old_node_locations);
                present_time_step = std::min(e.GetSuggestedNewStep(), target_time_step - time_advanced_so_far);
            }
            else
            {
                // If adaptivity is switched off, terminate with an error
                EXCEPTION(e.what());
            }
        }
```

In cases where adaptive time step was turned on but a terminal error was never received, the catching of exceptions led to the incrementally decreasing time-step being called infinitely. As a way to fix this I suggest changing the code in the following way: 

```
catch (StepSizeException& e)
        {
            int adaptive_timer = 0;
            // Detects if a node has travelled too far in a single time step
            if (mpNumericalMethod->HasAdaptiveTimestep())
            {
                // If adaptivity is switched on, revert node locations and choose a suitably smaller time step
                RevertToOldLocations(old_node_locations);
                if (adaptive_timer < 5 ){
                present_time_step = std::min(e.GetSuggestedNewStep(), target_time_step - time_advanced_so_far);
                adaptive_timer += 1;
                } else {
                // If adaptivity is not improving the issue, terminate with an error to prevent infinite loop
                EXCEPTION(e.what());
                }
            }
            else
            {
                // If adaptivity is switched off, terminate with an error
                EXCEPTION(e.what());
            }
        }
```

 By adding the variable **adaptive_timer** and only allowing the loop to be called a pre-determined number of times (in this case 5) it prevents the possibility of the adaptive time step leading to infinite loops. 5 attempts at reducing the time-step feels like a reasonable number for attempting to save a simulation. This could even be made into a parameter the user could control.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec4f1bc70cd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
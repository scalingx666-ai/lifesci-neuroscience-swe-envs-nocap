# Issue

**Title:** Agent vector cells

## Description

In this PR there is a new AgentVectorCells. These cells are very similar to the OVCs with one main difference that they detect other agents. 


Agents will now have unique names. These can either be passed from the user or will be automatically decided based on the length of the `Agent` list in the env.  

I have also incorporated a lookup based on the agent names (although this is not required for the cells to work-just as a convenience function)

Also made some changes to the trajectory colors for the agents so that the colors are the same for the VectorCells as that of the trailing trajectory of the agents(See the demo for vector cells). These were implicitly based on the position in the `Agents` list in the Environment. I just made it to be explicitly on the `agent_idx` 

Another Idea is to have agents itself of different colors (similar to the object type), but I quite like the agent to be RED :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da617c09ae8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
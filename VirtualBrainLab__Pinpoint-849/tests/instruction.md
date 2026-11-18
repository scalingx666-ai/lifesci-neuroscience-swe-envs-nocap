# Issue

**Title:** Fix memory leak in demo loop by eliminating Redux state thrashing

## Description

The demo loop visualization polling EphysLink every 10ms dispatched Redux state updates at the same rate, overwhelming the GC.

## Changes

**ProbeController.cs**
- Added local fields for visualization position updates bypassing Redux:
  - `VisualizationLocalAPMLDV`, `VisualizationLocalDepth`, `VisualizationLocalAngles`, `VisualizationLocalForwardT`
  - `HasVisualizationUpdate` flag
- Added `UpdateVisualizationProbePosition()` to apply buffered updates

**CartesianProbeController.cs, SagittalCoronalProbeController.cs**
- Call `UpdateVisualizationProbePosition()` in `Update()` to render buffered positions at frame rate

**EphysLinkService.cs**
- `UpdateVisualizationProbePosition()` writes directly to ProbeController local fields instead of dispatching to Redux
- Removed bulk dispatch that was triggering state updates every 10ms

## Result

EphysLink polls at 10ms for responsive hardware tracking, ProbeController applies updates at Unity frame rate (~60Hz), Redux only updates on user actions. Position threshold (0.0001f) prevents redundant updates.

```csharp
// Before: 100 Redux dispatches/sec per probe
_storeService.Store.Dispatch(SceneActions.BULK_SET_PROBE_POSITION_AND_ANGLES_BY, requests);

// After: Direct field write, Unity renders at frame rate
probeController.VisualizationLocalAPMLDV = transformedAPMLDV;
probeController.HasVisualizationUpdate = true;
```

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>Memory leak in automation demo (take 2)</issue_title>
> <issue_description>I think there's a memory leak during the demo loop (in ephyslinkservice) visualizing the probe's position creates too many state updates than the GC can clean up. First, identify if this true, then solve this by creating a local field in probecontroller that ephys link service will write APMLDV to and then in probe controller if the probe is a visualization probe have it update its position based on the local position field instead of the state one. Consider doing this with the update() function in probe controller so it will update every frame (if it's a visualization probe). Ephyslinkservice should poll ephys link with a 10 ms delay to give fast updates.</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

- Fixes VirtualBrainLab/Pinpoint#848

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6ce18125065`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Add unsaved ProbeWorldState slice for subscribable world-space probe positions

## Description

Creates an unsaved Redux state slice exposing computed world-space probe values (tip position/orientation, surface coordinates, recording region) that components can subscribe to for reactive updates when probes move.

## Changes

### New State Model
- **ProbeWorldState.cs** - Record containing world-space tip position (WorldU/WorldT), orientation vectors (right/up/forward), surface coordinates (T/WorldT/WorldU), recording region bounds, and brain presence flag
- **ProbeWorldStateSlice.cs** - Container with `List<ProbeWorldState>` and helper to retrieve specific probe by name
- **ProbeWorldReducers.cs** - Redux reducers for UPDATE/REMOVE/CLEAR operations

### Redux Integration
- **SliceNames.cs** - Added `PROBE_WORLD_SLICE` constant
- **StoreService.cs** - Registered slice in store, initialized as transient (not persisted to localStorage)

### Update Hook
- **ProbeManager.cs** - Added `DispatchProbeWorldState()` called from `UpdateSurfacePosition()` after all transforms computed, dispatches `REMOVE_PROBE_WORLD_STATE` on destroy

## Usage

```csharp
// Subscribe to all probe world states
_subscription = PinpointApp.StoreServiceStore.Subscribe(
    state => state.Get<ProbeWorldStateSlice>(SliceNames.PROBE_WORLD_SLICE),
    OnProbeWorldStateChanged,
    new SubscribeOptions<ProbeWorldStateSlice> { fireImmediately = true }
);

void OnProbeWorldStateChanged(ProbeWorldStateSlice worldState) {
    foreach (var probe in worldState.ProbeWorldStates) {
        if (probe.IsProbeInBrain) {
            Vector3 surface = probe.SurfaceCoordinateWorldT;
            // React to surface coordinate
        }
    }
}
```

- Fixes VirtualBrainLab/Pinpoint#839

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>world-space probe position subscribable object</issue_title>
> <issue_description>Create an unsaved state slice that reflects the world-space computed values from Probe Manager and Probe controller. Other things can then subscribe to this slice and update based on its computed values after probe manager and controller run thier updates on the CCF coordinates (APMLDV). It should look like scene state (be a list of world-space probe states) and expose the common positional fields inside Probe manager and probe controller like the surface coordinate and world-space position and orientation of the tip (which is computed after the transform game objects is updated by probe controller).</issue_description>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>

- Fixes VirtualBrainLab/Pinpoint#839

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98d4677d633e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Fix L/R orientation issue in front/back brain views

## Description

## Problem

The left/right (L/R) orientation was incorrect when viewing brain connectivity plots from the front and back perspectives. This was caused by improper coordinate transformations in the `build_plot()` function, where:

- **Front view** used `x.mni <- data$x.mni` (no negation)
- **Back view** used `x.mni <- data$x.mni*-1` (negation)

This resulted in left brain regions appearing on the right side of front view plots, violating standard neuroimaging visualization conventions.

## Solution

Swapped the x-coordinate transformations for front and back views in `R/build_plot.R`:

```r
# Front view - now negates x coordinates (mirrors for viewing from front)
if (view =="front"){
  x.mni<-data$x.mni*-1  # Changed from data$x.mni
  y.mni<-data$z.mni
  depth <- data$y.mni
  # ... rest unchanged
}

# Back view - now preserves x coordinates (direct view from back)
if (view =="back"){
  x.mni<-data$x.mni     # Changed from data$x.mni*-1
  y.mni<-data$z.mni
  depth <- data$y.mni*-1
  # ... rest unchanged
}
```

## Verification

The fix ensures proper L/R orientation in both views:

- **Front view**: Left brain regions (-40 MNI) → display position +40 (viewer's left)
- **Back view**: Left brain regions (-40 MNI) → display position -40 (anatomical left)

This matches standard neuroimaging conventions where front views are mirrored for the observer's perspective, while back views maintain anatomical orientation.

## Testing

- ✅ All existing tests continue to pass
- ✅ Added comprehensive test to verify L/R coordinate transformations
- ✅ Verified with sample brain regions across different MNI coordinates
- ✅ No breaking changes to existing functionality

> [!WARNING]
>
> <details>
> <summary>Firewall rules blocked me from connecting to one or more addresses (expand for details)</summary>
>
> #### I tried to connect to the following addresses, but was blocked by firewall rules:
>
> - `esm.ubuntu.com`
>   - Triggering command: `/usr/lib/apt/methods/https` (dns block)
>
> If you need me to access, download, or install something from one of these locations, you can either:
>
> - Configure [Actions setup steps](https://gh.io/copilot/actions-setup-steps) to set up my environment, which run before the firewall is enabled
> - Add the appropriate URLs or hosts to the custom allowlist in this repository's [Copilot coding agent settings](https://github.com/sidchop/brainconn/settings/copilot/coding_agent) (admins only)
>
> </details>

<!-- START COPILOT CODING AGENT SUFFIX -->

<!-- START COPILOT CODING AGENT TIPS -->
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5c70ecc3cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Add pinch-to-zoom support for trackpads and touchscreens

## Description

## Summary
This PR adds comprehensive pinch-to-zoom support for both trackpad and touchscreen devices, while improving the overall zoom handling to be more intuitive and consistent across different input methods.

## Key Changes
- **New pinch zoom method**: Added `pinch()` function that uses exponential scaling for multiplicative zoom, making zoom behavior consistent regardless of current camera distance
- **Trackpad pinch support**: Detects ctrl+wheel events (how most browsers report trackpad pinches) and routes them through the new pinch handler instead of linear zoom
- **Safari gesture event support**: Added handlers for Safari's native `gesturestart`, `gesturechange`, and `gestureend` events for native trackpad pinch handling
- **Touchscreen pinch support**: Implemented two-finger pinch detection on touchscreens using `touchstart`, `touchmove`, and `touchend` events
- **Wheel delta normalization**: Created `wheelDelta()` function to normalize wheel events across browsers (pixels, lines, pages) for consistent behavior
- **Event listener improvements**: Updated touch and wheel event listeners to use `{passive: false}` where needed to allow `preventDefault()` calls
- **Documentation**: Added new "Mouse and Trackpad Controls" section to user guide documenting all zoom methods

## Implementation Details
- The new `pinchZoomSpeed` constant (0.005) is tuned separately from regular wheel zoom speed (0.002) because trackpad pinches arrive with finer granularity
- Pinch delta is clamped to [-100, 100] to prevent extreme zoom jumps from actual ctrl+wheel events
- Exponential scaling (`Math.exp()`) ensures proportional zoom movement at any camera distance
- Safari gesture events and touch pinches use a saved radius reference to calculate relative scale changes
- Touch pinch handling cancels any ongoing single-touch drag to prevent conflicting gestures

https://claude.ai/code/session_01MgiGcAuPw8gVCAuPbUe5ig

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fa99b3b0a12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
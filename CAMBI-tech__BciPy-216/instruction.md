# Issue

**Title:** Clear events before getting key presses in inquiry preview

## Description

# Overview

Clear events before getting key presses in inquiry preview. Add better psychopy unit definitions and 'return' as a recommended option

## Ticket

[Link a pivotal ticket here](https://www.pivotaltracker.com/story/show/182003375)

## Contributions

- [bcipy/display/paradigm/rsvp/display.py](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...ip_key_events_fix?expand=1#diff-f8e158b8f1a845ab686c646708cb8c4a800f1d79672253a42861e3802e00eb12) - added events.clearEvents() before waiting for key events
- [bcipy/parameters/parameters.json](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...ip_key_events_fix?expand=1#diff-cdfbb7d72199b3190811241422513c89f1e0b3ae42c9f5d11eb56b8abc7b3d33) - add psychopy documentation for units and a better default stim height. Add return as an inquiry preview key press recommended value.

## Test

- `Make test-all`
- Ran Copy Phrase in fake data mode with inquiry preview on, press to confirm & skip, key as return --> ensure any presses to return did not trigger the Inquiry Preview.

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here. N/A

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d41b6bb7633a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
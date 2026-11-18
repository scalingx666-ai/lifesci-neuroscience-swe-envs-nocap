# Issue

**Title:** Support all registered loaders in the GUI unless explicitly excluded

## Description

Suggestions for #1191

- Switches to opt-out policy when including new loader in GUI: by default, all registered loaders are included in GUI dropdown, unless explicitly specified in `GUI_UNSUPPORTED_SOURCE_SOFTWARE` in `movement.napari.loader_widgets`.
- `movement.napari.loader_widgets` uses `get_supported_source_software` which also provides the supported extensions, instead of repeating in a separate dict.
- Fixes `test_register_loader_decorator` where StubSoftware leaked into the loader registry

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a443a6017adc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
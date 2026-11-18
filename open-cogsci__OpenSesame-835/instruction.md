# Issue

**Title:** Make safe_yaml_load actually safe

## Description

`safe_yaml_load()` in `libopensesame/py3compat.py` currently calls `yaml.load(s, Loader=yaml.UnsafeLoader)`. `UnsafeLoader` honors `!!python/object/apply`, `!!python/object/new`, and `!!python/name` tags, so any caller that passes attacker-controllable YAML through this function gets arbitrary code execution on load. The most obvious reachable path is `Syntax.parse_front_matter`: opening (or importing) an `.osexp` with crafted front matter is enough to execute code as the OpenSesame process user.

This PR replaces the loader with `yaml.safe_load`, which rejects those tags with a `ConstructorError`.

### Patch

```diff
 def safe_yaml_load(s):
-    return yaml.load(s, Loader=yaml.UnsafeLoader)
+    return yaml.safe_load(s)
```

### Verification

Repro before patch: front matter containing `!!python/object/apply:os.system ['touch /tmp/MARKER']` executes `os.system` during `Syntax.parse_front_matter` and the marker file appears.

After patch:
- Three payload variants (`!!python/object/apply:os.system`, `!!python/object/new:collections.OrderedDict`, `!!python/name:os.system`) all raise `yaml.constructor.ConstructorError`. No marker file is created.
- Legitimate front matter (`API: 2.1 / OpenSesame: 4.1.21 / Platform: posix` and the 3.3.x equivalent) parses to the same dict, with `StrictVersion` keys intact, byte-equivalent to `UnsafeLoader` output on safe input.
- `tests/test_syntax.py` and `tests/test_readandwrite.py` still pass.

### Call sites audited

Every current caller of `safe_yaml_load` loads plain metadata, not Python object graphs:

- `openexp/backend.py:49`: packaged `backend_info.yaml`
- `libopensesame/misc.py:35`: `environment.yaml` (consumers only accept strings or lists)
- `libopensesame/plugins.py:207`: plugin `info.yaml`
- `libopensesame/syntax.py:148`: experiment front matter (producer at `syntax.py:174` writes ordinary YAML)
- `libopensesame/experiment.py:255`: transitive caller via `Syntax`, no direct `safe_yaml_load` use

None rely on `!!python/*` construction, so this is a drop-in replacement.

### Residual

Not addressed by this PR: `yaml.safe_load` on an unbounded input is still susceptible to generic parser-resource exhaustion (deep nesting raises `RecursionError`). That is a pre-existing DoS surface, not an RCE bypass, and is out of scope for this one-liner.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eb12bb7c070`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
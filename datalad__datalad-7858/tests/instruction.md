# Issue

**Title:** BF: propagate `-c` config overrides (and DATALAD_* env) to subprocesses

## Description

### Disclaimer -- AI created for the goal of transferring the fix from datalad-next!

Configuration overrides specified via `datalad -c key=value` were only
stored in `datalad.cfg.overrides` (a Python dict) and never propagated
to the process environment. This meant subprocesses spawned by commands
like `datalad run` could not see these overrides.

For example, `datalad -c user.name=Test run git config user.name`
would not return `Test` because the subprocess's git did not know
about the override.

This PR adapts datalad-next's `cli_configoverrides.py` patch
near-verbatim, plus the companion env-helper utilities it relies on.

- **Patch source**:
  [`datalad-next/datalad_next/patches/cli_configoverrides.py @ 904ca6e`](https://github.com/datalad/datalad-next/blob/904ca6e/datalad_next/patches/cli_configoverrides.py)
- **Helper source** (also ported into
  [`datalad/config.py`](https://github.com/datalad/datalad/blob/bf-cli-config-override-propagation/datalad/config.py)):
  [`datalad-next/datalad_next/config/utils.py @ 904ca6e`](https://github.com/datalad/datalad-next/blob/904ca6e/datalad_next/config/utils.py)

## Structure (mirrors upstream)

The existing parser `_parse_overrides_from_cmdline` is left untouched
as the parsing-only primitive. A new wrapper
`parse_overrides_from_cmdline` is added alongside it (matching
upstream's two-name split). The wrapper:

1. Calls `_parse_overrides_from_cmdline` to obtain CLI overrides.
2. Merges in `DATALAD_*` env vars via core's existing
   `_update_from_env` (CLI wins, in line with Git semantics).
3. Superimposes the merged dict on any pre-existing
   `GIT_CONFIG_COUNT|KEY|VALUE` env vars and re-posts via Git's
   native env-based mechanism so subprocesses inherit it.
4. Returns `{}`.

The CLI caller in `datalad/cli/main.py` is updated to call the new
wrapper. Returning `{}` matches upstream:
`datalad.cfg.reload(force=True)` runs immediately after and pulls the
values back in via `git config -l` (which respects `GIT_CONFIG_*`)
plus `_update_from_env`. This reduces the scope of
`datalad.cfg.overrides` to instance-level overrides only, rectifying
the long-standing mismatch between appearance and actual impact of
that mapping in the `ConfigManager`.

## Why a wrapper, not in-place modification?

Upstream's `parse_overrides_from_cmdline` *calls* the original
`_parse_overrides_from_cmdline` for parsing rather than re-deriving
the parser body, then `apply_patch`-replaces the original symbol on
the module. We translate that pattern one-to-one into core: keep the
parsing primitive intact, add the wrapper that calls it, and update
the caller to invoke the wrapper. No monkey-patch glue needed when
the code lives inside core itself.

## Diff vs upstream — `cli_configoverrides.py` patch

<details>
<summary>Diff vs <a href="https://github.com/datalad/datalad-next/blob/904ca6e42663823d87b46ae7d4d0b6382b24a6bf/datalad_next/patches/cli_configoverrides.py">datalad-next datalad_next/patches/cli_configoverrides.py @ 904ca6e4</a></summary>

```diff
--- datalad-next:datalad_next/patches/cli_configoverrides.py (904ca6e4)
+++ datalad:/tmp/our_cli_configoverrides_extract.py
@@ -1,22 +1,20 @@
-"""Post DataLad config overrides CLI/ENV as GIT_CONFIG items in process ENV
-
-This enables their propagation to any subprocess. This includes the
-specification of overrides via the ``datalad -c ...`` option of the
-main CLI entrypoint.
-"""
-
-from datalad.config import _update_from_env as _update_from_datalad_env
-from datalad.cli.helpers import _parse_overrides_from_cmdline
-
-from datalad_next.config.utils import (
-    get_gitconfig_items_from_env,
-    set_gitconfig_items_in_env,
-)
+def parse_overrides_from_cmdline(cmdlineargs):
+    """Post CLI/env config overrides as ``GIT_CONFIG_*`` items in process ENV.
 
-from . import apply_patch
+    This enables their propagation to any subprocess (most importantly
+    commands spawned by ``datalad run``). The CLI's
+    ``datalad.cfg.reload(force=True)`` then picks them back up via
+    ``git config -l`` (which respects ``GIT_CONFIG_*``) plus
+    ``_update_from_env``, so process-wide config still reflects them.
+
+    Adapted near-verbatim from datalad-next; the body mirrors the upstream
+    wrapper one-to-one (no ``apply_patch`` glue is needed when this lives
+    inside core):
 
+      https://github.com/datalad/datalad-next/blob/904ca6e/datalad_next/patches/cli_configoverrides.py
 
-def parse_overrides_from_cmdline(cmdlineargs):
+    Might exit(3) the entire process if value is not assigned.
+    """
     # read from cmdlineargs first to error on any syntax issues
     # before any other processing
     cli_overrides = _parse_overrides_from_cmdline(cmdlineargs)
@@ -48,10 +46,3 @@
     # in the ConfigManager
     return {}
 
-
-apply_patch(
-    'datalad.cli.helpers', None, '_parse_overrides_from_cmdline',
-    parse_overrides_from_cmdline,
-    msg='Enable posting DataLad config overrides CLI/ENV as '
-    'GIT_CONFIG items in process ENV',
-)
```

</details>


## Diff vs upstream — `config/utils.py` helpers

The block ported into `datalad/config.py` is byte-identical to
upstream apart from:

1. Module-level imports replaced by a header comment (we live inside
   `datalad/config.py`, which already imports `os`; `environ`, `Dict`,
   `Mapping`, and `Tuple` are added to the existing import block at
   the top of the file rather than re-imported here).
2. Two docstring typo fixes: *"includes an message"* →
   *"includes a message"*; *"aggregated in reported"* →
   *"aggregated and reported"*.

Logic, type signatures, f-strings, and public API are preserved
verbatim.

<details>
<summary>Diff vs <a href="https://github.com/datalad/datalad-next/blob/904ca6e42663823d87b46ae7d4d0b6382b24a6bf/datalad_next/config/utils.py">datalad-next datalad_next/config/utils.py @ 904ca6e4</a></summary>

```diff
--- datalad-next:datalad_next/config/utils.py (904ca6e4)
+++ datalad:/tmp/our_config_utils_extract.py
@@ -1,13 +1,7 @@
-from __future__ import annotations
-
-from os import environ
-from typing import (
-    Dict,
-    Mapping,
-    Tuple,
-)
-
-
+# Adapted near-verbatim from datalad-next/datalad_next/config/utils.py
+# (https://github.com/datalad/datalad-next/blob/904ca6e/datalad_next/config/utils.py).
+# Used to round-trip CLI/env config overrides through Git's native
+# environment-based configuration mechanism so subprocesses inherit them.
 def get_gitconfig_items_from_env() -> Mapping[str, str | Tuple[str, ...]]:
     """Parse git-config ENV (``GIT_CONFIG_COUNT|KEY|VALUE``) and return as dict
 
@@ -18,15 +12,15 @@
     Raises
     ------
     ValueError
-      Whenever ``git-config`` would also error out, and includes an
-      message in the respective exception that resembles ``git-config``'s
-      for that specific case.
+      Whenever ``git-config`` would also error out, and includes a message
+      in the respective exception that resembles ``git-config``'s for that
+      specific case.
 
     Returns
     -------
     dict
       Configuration key-value mappings. When a key is declared multiple
-      times, the respective values are aggregated in reported as a tuple
+      times, the respective values are aggregated and reported as a tuple
       for that specific key.
     """
     items: Dict[str, str | Tuple[str, ...]] = {}
@@ -111,3 +105,4 @@
         environ.pop(f'GIT_CONFIG_VALUE_{i}', None)
 
     environ.pop('GIT_CONFIG_COUNT', None)
+
```

</details>

- 


TODOs
- [ ] if initial 'minimal change' testing pass, meld the two (wrapper + original) within a single function

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8244357ec9a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
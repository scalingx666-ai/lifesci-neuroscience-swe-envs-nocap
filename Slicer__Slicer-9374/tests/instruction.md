# Issue

**Title:** COMP: Spell the ITK autoload entry point via ITK_LOAD_FUNCTION_NAME

## Description

Preparatory and non-destructive: `itkMRMLIDIOPlugin` spells its ITK autoload entry point via `ITK_LOAD_FUNCTION_NAME` instead of the literal `itkLoad`, with a fallback for ITK releases that predate that macro. **No behavior change in any build today** — the exported symbol is `itkLoad` before and after, against every ITK Slicer currently builds against.

This lands ahead of  and does not depend on it. It can merge whenever convenient.

**Scope — this is one component, not the solution.** The problem it belongs to is loading the PyPI `itk` package into Slicer without its shared libraries conflicting with Slicer's own ITK. Solving that needs a namespace mechanism for ITK's C++ symbols (a Slicer-only mechanism is acceptable), which is much larger work and is not attempted here; the design discussion is . This PR only prepares the one `extern "C"` entry point that no namespace scheme can reach, because `extern "C"` names carry no C++ namespace. It is deliberately bite-sized and harmless on its own.

<details>
<summary>Why this is needed</summary>

`ObjectFactoryBase::LoadLibrariesInPath` looks the autoload symbol up by the name ITK was configured with, while this plugin exports it by literal name. The two agree only while that name is left at its default.

ITK#6787 makes the name a build option (`ITK_LOAD_FUNCTION_NAME`, default `itkLoad`) so that a build which renames ITK's symbols can reach this `extern "C"` entry point — `extern "C"` names carry no C++ namespace, so no namespace scheme reaches it. Slicer is the motivating consumer: it is the only project that both ships a plugin exporting this symbol and sets `ITK_AUTOLOAD_PATH` at runtime (`CMake/SlicerBlockCTKAppLauncherSettings.cmake`, and propagated into CLI module child processes by `Base/Logic/vtkSlicerCLIModuleLogic.cxx`).

If Slicer were later built against an ITK with a non-default name and this file were unchanged, ITK would look up a symbol the plugin does not export. `LoadLibrariesInPath` is silent when a library exports no entry point, so `MRMLIDImageIO` would simply never register — no error, no warning.

</details>

<details>
<summary>Evidence that it is non-destructive</summary>

The patched header was compiled against three ITK configurations and the exported symbol read out of the object file:

| ITK | `ITK_LOAD_FUNCTION_NAME` | exported symbol |
|---|---|---|
| Slicer's current ITK (predates ITK#6787) | absent | `_itkLoad` |
| ITK at PR #6787, default | `itkLoad` | `_itkLoad` |
| ITK with the name overridden | `slicer_itkLoad` | `_slicer_itkLoad` |

Rows 1 and 2 are the compatibility claim: the same symbol as today, whether or not ITK defines the macro. Row 3 shows the plugin follows a rename once ITK supports one.

</details>

<details>
<summary>On the <code>#ifndef</code> and its removal</summary>

The fallback is guarded on the macro rather than on `ITK_VERSION` because ITK `main` reports 6.0.0 both before and after ITK#6787 merges, so no version comparison separates an ITK that defines the macro from one that does not; a backport to `release-5.4` would add a second boundary. ITK releases without the macro always look up `itkLoad`, so that is its only correct value.

Because the shim is transient, the removal condition is stated in the comment in terms of `ITK_VERSION`, so it is found by the same search as the rest of Slicer's version-conditional code — it already greps out alongside the `ITK_VERSION VERSION_GREATER_EQUAL "5.3"` gate in the same directory's `CMakeLists.txt`.

</details>

<!--
provenance: claude-code session 2026-08-25
related: InsightSoftwareConsortium/ITK#6787 (configurable name), #6786 (namespace design)
evidence: three-way symbol matrix compiled in itk_forest_build_testbed
itk_integration_branch: hjmjohnson/ITK slicer-itk-integration-pr6787 (= pr/6787 head a54b6cd4f0)
not_yet_done: full Slicer SuperBuild against a renamed ITK
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5863505aa694`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** ENH: Changes for building Slicer libraries for WebAssembly

## Description

Three independent changes needed to build and run Slicer's core libraries in a web browser (SlicerWeb: Slicer's MRML, logic and displayable managers compiled to WebAssembly and used from Python in Pyodide). Each is its own commit.

### ENH: Allow skipping unavailable ITK IO modules in ITKFactoryRegistration

Adds the `ITKFactoryRegistration_SKIP_IO_MODULES` option (off by default). When it is on, IO modules that the ITK build does not include are left out of the registration instead of failing the configuration. A WebAssembly ITK build leaves some out (currently ITKIOTransformHDF5, ITKIOMINC and IOScanco). Desktop builds are unchanged.

### PERF: Cut only the cells a slice plane crosses for model intersections

`vtkMRMLModelSliceDisplayableManager` cut every cell of a model each time the slice moved, although only the cells the plane crosses contribute to the intersection. The crossed cells are now found with a `vtkStaticCellLocator`, built once per mesh and reused for every slice view and every slice move, so an update costs in proportion to the size of the intersection rather than the size of the model. Measured in a WebAssembly build, where there is one thread and the cost shows plainly: 15.6 ms → 3.6 ms per update for a 178,800-cell model, and 54.0 ms → 4.4 ms for 717,600 cells, cutting the same points.

This change applies to desktop builds too. So far it has been exercised only in the WebAssembly build.

### ENH: Carry out application logic tasks in the calling thread under Emscripten

A web page has a single thread, so `vtkSlicerApplicationLogic` cannot start its processing and networking threads. Without them, scheduled tasks never ran, and the read/write queues that carry results back to the application were never opened: `RequestReadFile` silently dropped its request, and a CLI module's output was never read in. Under Emscripten, a scheduled task now runs in the calling thread, the queues are opened without starting a thread, and a requested `Modified` is applied immediately. The code is inside `#ifdef __EMSCRIPTEN__`, so desktop builds are unchanged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `278b843e6664`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
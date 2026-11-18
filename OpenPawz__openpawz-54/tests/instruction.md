# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces a major update to the agent execution architecture, documentation, and test coverage. The most significant change is the integration of a 5-phase execution optimization pipeline, which streamlines agent tasks for improved speed, reliability, and scalability. The documentation has been updated to reflect these architectural enhancements, and test coverage has been expanded to validate each phase. Below are the most important changes grouped by theme:

**Agent Execution Architecture Enhancements**

* Introduced a 5-phase execution optimization pipeline for agent tasks, covering Action DAG Planning, Constrained Decoding, Embedding-Indexed Tool Registry, Binary IPC, and Speculative Execution. Each phase is described in detail and validated with 162 dedicated tests. [[1]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5R148-R178) [[2]](diffhunk://#diff-06572a96a58dc510037d5efa622f9bec8519bc1beab13c9f251e97e657a9d4edR9-R20)
* Added new SQLite tables for persistent tool embeddings and tool transition patterns, supporting phases 2 and 4.

**Documentation Updates**

* Updated `ARCHITECTURE.md`, `README.md`, and `CHANGELOG.md` to describe the new pipeline, increased test counts, and expanded backend modules for each phase. Includes detailed breakdowns of Rust and TypeScript test coverage, new modules, and phase-specific provider behavior. [[1]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL4-R4) [[2]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL23-R26) [[3]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL72-R75) [[4]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdR193-R210) [[5]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL286-R317) [[6]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL322-R353) [[7]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL577-R614) [[8]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5L166-R192) [[9]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5R746)
* Added `.AGENT_EXECUTION_ROADMAP.md` and linked it in documentation and navigation for full architectural details. [[1]](diffhunk://#diff-b7b4169fa5b2e02aa17d40553a73c5d9520086753c501eeb926c63b162bb6d9eL196-R197) [[2]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5R746)

**Frontend Improvements**

* Added `src/features/action-dag/` module for Action DAG plan visualization, supporting the new planning phase. [[1]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL72-R75) [[2]](diffhunk://#diff-06572a96a58dc510037d5efa622f9bec8519bc1beab13c9f251e97e657a9d4edR9-R20)

**User Experience**

* Enhanced the conversation start screen in `index.html` with keyboard shortcut hints for improved usability.

**Testing and Metrics**

* Increased automated test coverage to 3,174 tests (1,008 Rust + 2,166 TypeScript), with detailed breakdowns for each pipeline phase and expanded CI validation. [[1]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL4-R4) [[2]](diffhunk://#diff-8f6366fd8e7a5fa30f7f05879999195b7cf5fa1e3d157822eb37f0e91d226cfdL577-R614) [[3]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5L166-R192)

These changes collectively modernize the agent execution flow, improve reliability, and provide comprehensive documentation and test coverage for future development.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10a9548ac59e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Fix finite differences for composite NMODL function arguments

## Description

## Summary

This change corrects the nonlinear-solver Jacobian generation reported in #3622 while preserving the existing NMODL identifier grammar.

When SymPy differentiates an unknown function with a composite argument, such as `f(a*u + b)`, it may represent the result using `Subs` and a derivative with respect to a temporary argument. Applying the existing finite-difference conversion directly to that representation can introduce an undeclared step variable, such as `_xi_1_delta_`, into the generated NMODL. The resulting step also lacks a binding to the original solver state.

For each Jacobian entry containing `Subs`, the implementation processes the corresponding equation term by term. If a term's derivative contains `Subs`, it constructs an unevaluated derivative with respect to the original state variable. Other terms retain their existing symbolic derivatives. The existing conversion then uses the corresponding `dX_` entry for finite differences in the original state variable. Analytically differentiable additive contributions remain exact.

The production change adds 15 lines to `ode.py`. It does not modify the parser, nonlinear iteration, solver tolerances, or integrator.

## Regression coverage

The added tests cover composite and nested function arguments, products involving function calls, multivariate functions, coupled equations, indexed states, and the reported two-state system. They check that generated steps correspond to the correct state variable, compare generated Jacobians with independent complex-step or analytic derivatives, and verify that unaffected analytic contributions remain exact.

## Validation

The following checks were completed in a Linux x86_64 CPU configuration at commit `afcd4b1b723cc7c8aa6718f61668a8a61aa44d99`:

- The selected native targets `nrniv`, `hoc_module`, `nmodl`, `testvisitor`, `testnewton`, `testcrout`, and `nrnivmodl_dependency` built successfully.
- The `Ode` CTest passed all 16 Python cases, both before and after the negative-control run.
- All 78 registered native visitor CTests passed. The Newton test passed 16 assertions, and the Crout test passed one assertion.
- A two-state `derivimplicit` mechanism compiled and ran in the NEURON runtime built from the tested source. Across 350 `fadvance` steps at three time-step sizes, its trajectories agreed with a separately implemented backward-Euler solver using an analytic Jacobian, with a maximum absolute state error of approximately `5.881e-13`.
- Rebuilding with the exact unpatched embedded solver reproduced the original parser failure. Restoring the patch restored successful compilation and trajectory checks. The recorded patched binary hashes were identical before and after this control.

These results do not constitute a native validation run at the later `master` commit `1e5b4072efd132efc3bfee9b90ecbe5194029ed5`.

## Limitations

The NMODL contribution guide requests the full test suite; that suite has not been run here. The checks above cover selected CPU tests only. The full CI and supported-platform matrix, MPI, GUI, CoreNEURON/GPU, and optional NMODL AST bindings remain untested.

The finite-difference path continues to assume smooth, deterministic functions and suitable nonzero step sizes. These checks do not establish correctness for nonsmooth or stateful functions, or for cases involving extreme cancellation. The trajectory comparisons assess numerical integration and do not constitute biological validation.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e5b4072efd1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
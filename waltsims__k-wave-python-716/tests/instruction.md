# Issue

**Title:** Add dtype parameter to kspaceFirstOrder()

## Description

.

## What

Exposes precision control on the modern unified API. Pythonic / numpy-idiomatic naming and accepted input forms:

| input | resolved precision |
|---|---|
| ``None`` (default) | ``np.float64`` |
| ``np.float64`` / ``"float64"`` / ``"double"`` / ``float`` / ``np.dtype("f8")`` | ``np.float64`` |
| ``np.float32`` / ``"float32"`` / ``"single"`` / ``np.dtype("f4")`` | ``np.float32`` |
| ``"off"`` (legacy MATLAB alias) | ``np.float64`` |
| anything else (``np.float16``, ``np.complex64``, ``"quad"``, …) | ``ValueError`` |

The MATLAB aliases (``"off"``, ``"single"``, ``"double"``) are kept as compat shortcuts for users porting from the legacy ``SimulationOptions.data_cast`` or MATLAB k-Wave's ``DataCast``. Everything else uses ``np.dtype()`` for normalization, matching the broader numpy/scipy/torch convention.

## Why ``dtype`` instead of ``data_cast``

``data_cast`` is a MATLAB term. The numpy ecosystem (numpy, pandas, jax, torch) uses ``dtype`` and accepts dtype-like inputs broadly. The modern unified API is a fresh design — it should follow the Python idiom rather than the MATLAB one. The MATLAB-style strings still work, so MATLAB users lose nothing.

## How

**Python backend** plumbs ``dtype`` through ``Simulation``, which now stores ``self._dtype`` and uses it for every state-array allocation: ``p``, ``u``, ``rho_split``, sensor-data buffers, PML arrays, source signal buffers, and the ``_expand_to_grid`` helper for ``sound_speed`` / ``density`` / ``alpha_coeff`` / ``BonA`` / ``p0``. Default behavior unchanged (float64 everywhere).

**C++ backend** intentionally has no effect — the binary uses fixed internal precision regardless of HDF5 input dtype. Setting ``dtype`` to anything other than ``np.float64`` with ``backend='cpp'`` emits a ``UserWarning`` explaining this and pointing users at ``backend='python'`` for precision control.

## Test plan

New file ``tests/test_data_cast.py`` (22 tests):

- [x] ``test_python_backend_float64_inputs`` parametrized over ``[None, np.float64, "float64", "double", float, "off", np.dtype("f8")]`` — every form resolves to float64 output
- [x] ``test_python_backend_float32_inputs`` parametrized over ``[np.float32, "float32", "single", np.dtype("f4")]`` — every form resolves to float32 output
- [x] ``test_default_dtype_is_float64`` — calling without the kwarg gives float64 (back-compat)
- [x] ``test_invalid_dtype_raises`` parametrized over ``[np.float16, np.complex64, "float16", "complex64", "quad", 42, "garbage"]`` — all raise ``ValueError``
- [x] ``test_python_single_vs_double_numerical_agreement`` — single and double runs agree to within ``1e-4`` relative error
- [x] ``test_cpp_backend_warns_on_non_float64_dtype`` — ``UserWarning`` fires before binary runs
- [x] ``test_cpp_backend_silent_on_default_dtype`` — no warning on default

Wider suite verified (62 tests): ``test_native_solver``, ``test_ivp_homogeneous_medium``, ``test_issue_664_alpha_power_near_unity`` all pass.

- [x] CI green

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

This PR adds a `dtype` parameter to `kspaceFirstOrder()` that lets callers control state-array precision for the Python backend (`np.float32` or `np.float64`), with MATLAB-style string aliases (`"single"`, `"double"`, `"off"`) kept for migration compatibility. The C++ backend correctly ignores the parameter and emits a `UserWarning` when a non-float64 value is passed.

- `_resolve_dtype` normalises every dtype-like input form and raises `ValueError` with framework-specific hints for torch/jax objects. Default behaviour (float64 everywhere) is unchanged.
- `Simulation` now stores `self._dtype` and `self._complex_dtype`, plumbed through field allocation, PML arrays, k-vectors, sensor buffers, and source operators; several FFT round-trips gained explicit `.astype()` casts.
- Several numpy<2 scalar-promotion paths flagged in prior review rounds remain open: `kappa`/`source_kappa` not cast back to `self._dtype`; `dt_over_rho0` still `float(self.dt) / float32_rho`; `self.dt * self.rho0` on the `rho_split` update likewise uncast. On numpy>=2 all tests pass; on numpy 1.x these silently produce float64 arrays even when `dtype=np.float32`.

<h3>Confidence Score: 3/5</h3>

Safe to merge for numpy>=2 environments; float32 precision is not reliably enforced on numpy 1.x due to several uncast Python-scalar multiplications identified in prior review rounds.

The dtype-plumbing is thorough for array allocations, PML, k-vectors, and sensor buffers, and the FFT cast-back guards prevent most output-dtype drift. However, kappa/source_kappa construction (Python-float c_ref times float32 k_mag), dt_over_rho0 (Python float divided by float32), and the rho_split update (self.dt * self.rho0) still produce float64 intermediates on numpy 1.x, silently defeating the float32 promise on that platform.

kwave/solvers/kspace_solver.py — _setup_kspace_operators (kappa/source_kappa), dt_over_rho0 precomputation in _setup_fields, and rho_split update in step() all have uncast Python-scalar multiplications that defeat float32 precision on numpy 1.x.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| kwave/kspaceFirstOrder.py | Adds _resolve_dtype helper and dtype parameter to kspaceFirstOrder(); correctly warns when dtype != float64 with cpp backend. |
| kwave/solvers/kspace_solver.py | Plumbs _dtype/_complex_dtype through allocations and FFT casts; several numpy<2 scalar-promotion paths (kappa, dt_over_rho0, rho_split update) remain unresolved from prior rounds. |
| tests/test_data_cast.py | Comprehensive new test file covering all input forms, invalid inputs, numerical agreement, staggered velocity, BonA path, and C++ backend warnings. |

</details>

</details>

<!-- greptile_failed_comments -->
<details><summary><h3>Comments Outside Diff (7)</h3></summary>

1. `kwave/solvers/kspace_solver.py`, line 663 ([link](https://github.com/waltsims/k-wave-python/blob/22ec78dcd5282f1856f460b438aa6c1c57a33ed6/kwave/solvers/kspace_solver.py#L663))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=7" align="top"></a> **`dt_over_rho0` computed as Python `float` / `float32` → silently float64 on numpy < 2**

   `self.dt` is stored as `float(self.kgrid.dt)` (a Python float, equivalent to `float64`). Dividing by a `float32` array gives a `float64` result under numpy < 2 (NEP 50 changed this in numpy 2.0). As a consequence, on every `step()`: `self.dt_over_rho0[i] * grad_p_i` (line 706) is `float64 × float32 → float64`, so `self.u[i]` is rebound to a `float64` array after the very first step. The same Python-scalar promotion also affects line 716 (`self.dt * self.rho0 * div_u_i * nl_factor`), so `rho_split[i]` and, through `rho_total`, `self.p` also become `float64`. The sensor-data buffer (`sensor_data["p"]`) is pre-allocated `float32` and silently narrows values on in-place assignment, so `result["p"]` tests pass, but `result["p_final"]` (line 773) is `self.p[interior].copy()` — no narrowing — and will be `float64` even when `dtype=np.float32` is requested, breaking the dtype contract on numpy < 2.

2. `kwave/solvers/kspace_solver.py`, line 429-447 ([link](https://github.com/waltsims/k-wave-python/blob/22ec78dcd5282f1856f460b438aa6c1c57a33ed6/kwave/solvers/kspace_solver.py#L429-L447))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=7" align="top"></a> **Complex k-space operators still promote to `complex128` on numpy < 2**

   `k_list` entries are now correctly cast to `self._dtype` (float32 when requested), but `self.c_ref` and `self.dt` are Python floats (float64), so `self.c_ref * k_mag * self.dt / 2` is `float64` on numpy < 2, making `kappa` and `source_kappa` float64. The `1j *` Python complex literal then forces `op_grad_list` and `op_div_list` to `complex128` rather than `complex64`. Cast `kappa`/`source_kappa` to `self._dtype` and the final operators to `self._complex_dtype` after construction.

3. `kwave/solvers/kspace_solver.py`, line 661-663 ([link](https://github.com/waltsims/k-wave-python/blob/6920efb4eed7e40525b0f6c5f43c9afb4a79a15b/kwave/solvers/kspace_solver.py#L661-L663))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=8" align="top"></a> `self.dt` is stored as `float(self.kgrid.dt)` — a Python `float`, which numpy < 2.0 (pre-NEP 50) treats as `np.float64` in type promotion. Dividing a `float64` scalar by a `float32` array yields `float64` on numpy 1.x, so `dt_over_rho0` is float64 even when `self._dtype is np.float32`. On the first `step()`, `self.dt_over_rho0[i] * grad_p_i` (float64 × float32 → float64) and the outer `pml_sg * (...)` product make `self.u[i]` float64. The same Python-scalar promotion on line 716 (`self.dt * self.rho0 * div_u_i`) then forces `self.rho_split[i]` to float64, which propagates through `_array_sum(rho_split)` into `self.p`. Because `result["p_final"]` is a direct `.copy()` of `self.p` (no pre-allocated float32 buffer to narrow into), it will be float64 on numpy < 2 even when `dtype=np.float32` — causing `test_python_backend_float32_inputs` to fail on numpy 1.x. Pre-cast `dt` to `self._dtype` at setup time and reuse it in `step()`.

4. `kwave/solvers/kspace_solver.py`, line 716 ([link](https://github.com/waltsims/k-wave-python/blob/6920efb4eed7e40525b0f6c5f43c9afb4a79a15b/kwave/solvers/kspace_solver.py#L716))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=8" align="top"></a> Same Python-scalar promotion issue: `self.dt` is a Python `float` (float64), so `self.dt * self.rho0` (float64 × float32) → float64 on numpy < 2. `nl_factor = 1.0` (Python float) compounds this in the linear path. The result is `rho_split[i]` ends up as float64, which propagates through `rho_total` into `self.p`, making `p_final` float64 regardless of `self._dtype`. Replace `self.dt` with `self._dt_typed` (the dtype-cast scalar computed during setup).

5. `kwave/solvers/kspace_solver.py`, line 663 ([link](https://github.com/waltsims/k-wave-python/blob/693cb4625ae3fa2606b1759e017020981c45795c/kwave/solvers/kspace_solver.py#L663))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=8" align="top"></a> `dt_over_rho0` is computed by dividing a Python `float` (`self.dt = float(kgrid.dt)`) by a `float32` array. On numpy < 2 (pre-NEP 50), Python scalars are strong `np.float64`, so `self.dt / rho` yields a `float64` result for each element of the list. At line 706, `self.dt_over_rho0[i] * grad_p_i` (float64 × float32) then rebinds `self.u[i]` to float64 — there is no `.astype()` guard on that assignment, unlike the `_diff()` return path. `u_final` (line 777) is then `self.u[i][interior].copy()`, which will be float64 even when `dtype=np.float32`.

6. `kwave/solvers/kspace_solver.py`, line 716 ([link](https://github.com/waltsims/k-wave-python/blob/693cb4625ae3fa2606b1759e017020981c45795c/kwave/solvers/kspace_solver.py#L716))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=8" align="top"></a> `self.dt` is a Python `float` (float64). On numpy < 2, `float64 × float32` is a strong-type promotion to float64, so `self.dt * self.rho0 * div_u_i * nl_factor` evaluates to float64 and rebinds `self.rho_split[i]` to a float64 array — there is no `.astype()` narrowing guard here. Float64 `rho_split` entries then flow through `_array_sum(self.rho_split)` → `self.p`, making `p_final` float64 even when `dtype=np.float32`.

7. `kwave/solvers/kspace_solver.py`, line 429-431 ([link](https://github.com/waltsims/k-wave-python/blob/693cb4625ae3fa2606b1759e017020981c45795c/kwave/solvers/kspace_solver.py#L429-L431))

   <a href="#"><img alt="P1" src="https://greptile-static-assets.s3.amazonaws.com/badges/p1.svg?v=8" align="top"></a> `self.c_ref` and `self.dt` are both Python `float` (= float64). On numpy < 2, `float64 * float32_array` is a strong promotion, so `self.c_ref * k_mag * self.dt / 2` produces a float64 array even though `k_mag` was cast to `self._dtype`. `kappa` and `source_kappa` are therefore float64, which in turn forces `op_grad_list` / `op_div_list` to `complex128` (Python `1j` is also a strong complex128 on numpy < 2). Every call to `_diff()` then runs the FFT round-trip in float64 arithmetic even when `dtype=np.float32` was requested, defeating the purpose of the precision parameter.
</details>

<!-- /greptile_failed_comments -->

<sub>Reviews (10): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=30640288)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72608296258f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
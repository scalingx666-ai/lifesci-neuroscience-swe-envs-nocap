# Issue

**Title:** Add function for computing path straightness index

## Description

<html>
<body>
<!--StartFragment--><h1 class="text-text-100 mt-3 -mb-1 text-[1.375rem] font-bold">PR: Add <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">compute_straightness_index</code> to trajectory complexity module</h1>
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">What is this PR?</h2>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->Addition of a new feature</li>
</ul>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Why is this PR needed?</h2>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]">Straightness index is a foundational trajectory complexity metric used across
neuroscience and ethology. This PR adds a native, DataArray-centric
implementation to <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">movement</code> that supports both global and rolling
(temporally aware) computation — without requiring users to write for loops.</p>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]">Builds on #517 and #406.</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">What does this PR do?</h2>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]">Adds <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">compute_straightness_index</code> in
<code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">movement/kinematics/trajectory_complexity.py</code>.</p>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]"><strong>Global mode (default):</strong> S = D / L — Euclidean displacement over total path
length. Chains existing <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">compute_path_length</code> and <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">compute_norm</code>.</p>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]"><strong>Rolling mode (<code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">window_size</code> parameter):</strong> Computes a time series of local
straightness using fully vectorized xarray <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">.rolling()</code> — no Python loops.
Computing rolling SI for 100 individuals takes the same operations as for 1.</p>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]"><strong>Edge cases:</strong> Zero path length → NaN, NaN positions propagate, <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">window_size</code>
validated as positive integer.</p>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]"><strong>Module location:</strong> <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">movement/kinematics/trajectory_complexity.py</code>,
consistent with <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">compute_turning_angles</code> (#833).</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Files changed</h2>
<div class="overflow-x-auto w-full px-2 mb-6">
File | Change
-- | --
movement/kinematics/trajectory_complexity.py | New function
movement/kinematics/__init__.py | Export added
tests/test_unit/test_trajectory_complexity.py | 16 tests, all passing
examples/compute_straightness_index.py | Gallery example, EPM dataset

</div>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Tests (16 passing)</h2>
<p class="font-claude-response-body break-words whitespace-pre-wrap leading-[1.7]">Covers: straight line (SI=1.0), closed loop (SI=0.0), analytically verified
L-shaped path (SI=5/7), stationary animal (NaN), NaN at start/end/all,
output shape and metadata, multiple individuals, rolling window shape and NaN
padding, invalid window size, missing time dimension.</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Gallery example</h2>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]">Uses <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">DLC_single-mouse_EPM.predictions.h5</code> (18,485 frames, 30 fps).</p>
<ul class="[li_&amp;]:mb-0 [li_&amp;]:mt-1 [li_&amp;]:gap-1 [&amp;:not(:last-child)_ul]:pb-1 [&amp;:not(:last-child)_ol]:pb-1 list-disc flex flex-col gap-1 pl-8 mb-3">
<li class="whitespace-normal break-words pl-2"><strong>Global SI = 0.005</strong> — mouse barely moved net over 616 s</li>
<li class="whitespace-normal break-words pl-2"><strong>Rolling SI</strong> (30-frame windows): mean=0.531, 18.1% directed, 15.1% exploratory</li>
<li class="whitespace-normal break-words pl-2">Figure 1: Rolling SI time series + trajectory coloured by SI magnitude</li>
<li class="whitespace-normal break-words pl-2">Figure 2: Zone comparison — centre SI (0.589) vs arm SI (0.525)</li>
</ul>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">How has this PR been tested?</h2>
<p class="font-claude-response-body break-words whitespace-pre-wrap leading-[1.7]">Unit tests run locally with pytest. Pre-commit hooks (ruff, mypy, codespell,
check-manifest) all pass.</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Is this a breaking change?</h2>
<p class="font-claude-response-body break-words whitespace-normal leading-[1.7]">No. Adds a new function and does not modify existing APIs or behaviour.</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Does this PR require documentation updates?</h2>
<p class="font-claude-response-body break-words whitespace-pre-wrap leading-[1.7]">The function docstring is complete with Parameters, Returns, Raises, Notes,
See Also, and Examples sections following NumPy style. The gallery example
demonstrates intended usage on real data.</p>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">References</h2>
<ul class="[li_&amp;]:mb-0 [li_&amp;]:mt-1 [li_&amp;]:gap-1 [&amp;:not(:last-child)_ul]:pb-1 [&amp;:not(:last-child)_ol]:pb-1 list-disc flex flex-col gap-1 pl-8 mb-3">
<li class="whitespace-normal break-words pl-2">McLean &amp; Skowron Volponi (2018). trajr. <em>Ethology</em>, 124, 440–448.</li>
<li class="whitespace-normal break-words pl-2">Benhamou (2004). <em>Journal of Theoretical Biology</em>, 229, 209–220.</li>
</ul>
<hr class="border-border-200 border-t-0.5 my-3 mx-1.5">
<h2 class="text-text-100 mt-3 -mb-1 text-[1.125rem] font-bold">Checklist</h2>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->16 unit tests, all passing</li>
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->Pre-commit hooks pass (ruff, mypy, codespell, check-manifest)</li>
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->Gallery example runs on real data without error</li>
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->Exported from <code class="bg-text-200/5 border border-0.5 border-border-300 text-danger-000 whitespace-pre-wrap rounded-[0.4rem] px-1 py-px text-[0.9rem]">movement/kinematics/__init__.py</code></li>
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->NumPy-style docstring complete</li>
<li class="task-list-item"><input type="checkbox" disabled="" checked=""> <!-- -->No breaking changes</li>
<li class="task-list-item"><input type="checkbox" disabled=""> <!-- -->Linked to #517</li></ul><!--EndFragment-->
</body>
</html>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4341a917387`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
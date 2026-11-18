# Issue

**Title:** Bump the pip group across 2 directories with 1 update

## Description

Bumps the pip group with 1 update in the / directory: [torch](https://github.com/pytorch/pytorch).
Bumps the pip group with 1 update in the /docs directory: [torch](https://github.com/pytorch/pytorch).

Updates `torch` from 2.10.0 to 2.13.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytorch/pytorch/releases">torch's releases</a>.</em></p>
<blockquote>
<h1>PyTorch 2.13.0 Release Notes</h1>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#highlights">Highlights</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#backwards-incompatible-changes">Backwards Incompatible Changes</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#deprecations">Deprecations</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#new-features">New Features</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#improvements">Improvements</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#bug-fixes">Bug fixes</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#performance">Performance</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#documentation">Documentation</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#developers">Developers</a></li>
</ul>
<h1>Highlights</h1>
<!-- raw HTML omitted -->
<p>For more details about these highlighted features, you can look at the release blogpost. Below are the full release notes for this release.</p>
<h1>Tracked Regressions</h1>
<h3>ROCm wheels break <code>torch.compile</code> on CPU in environments without a GPU</h3>
<p>Running a <code>torch==2.13.0+rocm7.2</code> wheel in an environment where no GPU is available (<code>torch.cuda.is_available()</code> is <code>False</code>) breaks <code>torch.compile</code> on the CPU path: the first compile raises <code>RuntimeError: Can't detect vectorized ISA for CPU</code> (<a href="">#189194</a>). This is a regression from <code>torch==2.12.1+rocm7.2</code>, which compiles CPU code fine (detecting e.g. <code>VecAVX2</code>) in the same setup. The 2.13 ROCm wheel appears to rely on something present in the ROCm builder image to detect the CPU vectorized ISA, so it works when run on a ROCm image but fails on a plain CPU-only image.</p>
<p>Workaround: run the <code>+rocm</code> wheel on a ROCm image, or install a standard CPU/CUDA build for GPU-less environments.</p>
<h1>Backwards Incompatible Changes</h1>
<ul>
<li>
<p>Stop building CPython 3.13t (free-threaded) binaries (<a href="">#182951</a>)</p>
<p>Upstream <code>pypa/manylinux</code> removed CPython 3.13t (free-threaded) on 2026-05-07, because 3.13t
was experimental and has been superseded by the now-non-experimental CPython 3.14t. As a result,
PyTorch 2.13 no longer ships <code>cp313t</code> wheels (Linux, Triton, and related artifacts). Users on the
free-threaded interpreter should move to Python 3.14t.</p>
<p>PyTorch 2.12:</p>
<pre lang="bash"><code># cp313t (free-threaded 3.13) wheels were available
python3.13t -m pip install torch
</code></pre>
<p>PyTorch 2.13:</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf30153</code></a> [release/2.13] Strip +PTX from CUDA arch list on release/RC builds (<a href="">#188914</a>) ...</li>
<li><a href=""><code>3e3e24b</code></a> [release/2.13] Restrict cuda-bindings to Python &lt; 3.15 for CUDA 12.9 builds (...</li>
<li><a href=""><code>7986b06</code></a> [release/2.13] Bump binary build timeout 280 -&gt; 400 minutes (<a href="">#188551</a>)</li>
<li><a href=""><code>0bdbc26</code></a> [release/2.13] Add CUDA 12.9 to TORCH_CUDA_ARCH_LIST tables (<a href="">#188443</a>)</li>
<li><a href=""><code>9cabb45</code></a> [release/2.13] Update manywheel docker image pin to 78e737ad (<a href="">#188409</a>)</li>
<li><a href=""><code>78e737a</code></a> [release/2.13] Revert &quot;Tighten generalized scatter graph target (<a href="">#184075</a>)&quot; (#...</li>
<li><a href=""><code>0bb9b5b</code></a> [release/2.13] Revert &quot;dynamo: round-trip torch.cuda.stream ctx mgr across gr...</li>
<li><a href=""><code>aaac2bf</code></a> [release/2.13] Revert &quot;[Reland] Port D104346887/PR 182675 for index_add fast ...</li>
<li><a href=""><code>9330813</code></a> Fix build_with_debinfo.py broken by CONFIGURE_DEPENDS globbing (<a href="">#188192</a>)</li>
<li><a href=""><code>4e077a7</code></a> Remove setuptools upper bound (<a href="">#188190</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pytorch/pytorch/compare/v2.10.0...v2.13.0">compare view</a></li>
</ul>
</details>
<br />

Updates `torch` from 2.10.0 to 2.13.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytorch/pytorch/releases">torch's releases</a>.</em></p>
<blockquote>
<h1>PyTorch 2.13.0 Release Notes</h1>
<ul>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#highlights">Highlights</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#backwards-incompatible-changes">Backwards Incompatible Changes</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#deprecations">Deprecations</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#new-features">New Features</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#improvements">Improvements</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#bug-fixes">Bug fixes</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#performance">Performance</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#documentation">Documentation</a></li>
<li><a href="https://github.com/pytorch/pytorch/blob/HEAD/#developers">Developers</a></li>
</ul>
<h1>Highlights</h1>
<!-- raw HTML omitted -->
<p>For more details about these highlighted features, you can look at the release blogpost. Below are the full release notes for this release.</p>
<h1>Tracked Regressions</h1>
<h3>ROCm wheels break <code>torch.compile</code> on CPU in environments without a GPU</h3>
<p>Running a <code>torch==2.13.0+rocm7.2</code> wheel in an environment where no GPU is available (<code>torch.cuda.is_available()</code> is <code>False</code>) breaks <code>torch.compile</code> on the CPU path: the first compile raises <code>RuntimeError: Can't detect vectorized ISA for CPU</code> (<a href="">#189194</a>). This is a regression from <code>torch==2.12.1+rocm7.2</code>, which compiles CPU code fine (detecting e.g. <code>VecAVX2</code>) in the same setup. The 2.13 ROCm wheel appears to rely on something present in the ROCm builder image to detect the CPU vectorized ISA, so it works when run on a ROCm image but fails on a plain CPU-only image.</p>
<p>Workaround: run the <code>+rocm</code> wheel on a ROCm image, or install a standard CPU/CUDA build for GPU-less environments.</p>
<h1>Backwards Incompatible Changes</h1>
<ul>
<li>
<p>Stop building CPython 3.13t (free-threaded) binaries (<a href="">#182951</a>)</p>
<p>Upstream <code>pypa/manylinux</code> removed CPython 3.13t (free-threaded) on 2026-05-07, because 3.13t
was experimental and has been superseded by the now-non-experimental CPython 3.14t. As a result,
PyTorch 2.13 no longer ships <code>cp313t</code> wheels (Linux, Triton, and related artifacts). Users on the
free-threaded interpreter should move to Python 3.14t.</p>
<p>PyTorch 2.12:</p>
<pre lang="bash"><code># cp313t (free-threaded 3.13) wheels were available
python3.13t -m pip install torch
</code></pre>
<p>PyTorch 2.13:</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf30153</code></a> [release/2.13] Strip +PTX from CUDA arch list on release/RC builds (<a href="">#188914</a>) ...</li>
<li><a href=""><code>3e3e24b</code></a> [release/2.13] Restrict cuda-bindings to Python &lt; 3.15 for CUDA 12.9 builds (...</li>
<li><a href=""><code>7986b06</code></a> [release/2.13] Bump binary build timeout 280 -&gt; 400 minutes (<a href="">#188551</a>)</li>
<li><a href=""><code>0bdbc26</code></a> [release/2.13] Add CUDA 12.9 to TORCH_CUDA_ARCH_LIST tables (<a href="">#188443</a>)</li>
<li><a href=""><code>9cabb45</code></a> [release/2.13] Update manywheel docker image pin to 78e737ad (<a href="">#188409</a>)</li>
<li><a href=""><code>78e737a</code></a> [release/2.13] Revert &quot;Tighten generalized scatter graph target (<a href="">#184075</a>)&quot; (#...</li>
<li><a href=""><code>0bb9b5b</code></a> [release/2.13] Revert &quot;dynamo: round-trip torch.cuda.stream ctx mgr across gr...</li>
<li><a href=""><code>aaac2bf</code></a> [release/2.13] Revert &quot;[Reland] Port D104346887/PR 182675 for index_add fast ...</li>
<li><a href=""><code>9330813</code></a> Fix build_with_debinfo.py broken by CONFIGURE_DEPENDS globbing (<a href="">#188192</a>)</li>
<li><a href=""><code>4e077a7</code></a> Remove setuptools upper bound (<a href="">#188190</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pytorch/pytorch/compare/v2.10.0...v2.13.0">compare view</a></li>
</ul>
</details>
<br />

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bbfrederick/rapidtide/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c019a690e23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
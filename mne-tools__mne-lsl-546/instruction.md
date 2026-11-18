# Issue

**Title:** Bump pypa/cibuildwheel from 3.4.1 to 4.0.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.4.1 to 4.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<p>See <a href="https://github.com/henryiii"><code>@​henryiii</code></a>'s <a href="https://iscinumpy.dev/post/cibuildwheel-4-0-0/">release post</a> for more info on new features!</p>
<ul>
<li>
<p>🌟 Adds wheel auditing with <code>abi3audit</code> as a default after the repair step, with new <a href="https://cibuildwheel.pypa.io/en/stable/options/#audit-requires"><code>audit-requires</code></a> and <a href="https://cibuildwheel.pypa.io/en/stable/options/#audit-command"><code>audit-command</code></a> options (<a href="">#2805</a>)</p>
</li>
<li>
<p>🌟 Adds <code>pyemscripten</code> platform tag support (PEP 783), updates Pyodide to 314.0.0a2, and adds a <code>pyodide-eol</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> flag for building end-of-life Pyodide versions (<a href="">#2812</a>, <a href="">#2848</a>)</p>
</li>
<li>
<p>🌟 Sets up <code>delvewheel</code> as the default <a href="https://cibuildwheel.pypa.io/en/stable/options/#repair-wheel-command"><code>repair-wheel-command</code></a> for Windows, so extension module DLLs are now bundled automatically. Skip by setting it to empty if not needed. (<a href="">#2831</a>)</p>
</li>
<li>
<p>✨ Adds CPython 3.15 support, under the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> <code>cpython-prerelease</code>. This version of cibuildwheel uses 3.15.0b2. (<a href="">#2833</a>, <a href="">#2850</a>)</p>
<p><em>While CPython is in beta, the ABI can change, so your wheels might not be compatible with the final release. For this reason, we don't recommend distributing wheels until RC1, at which point 3.15 will be available in cibuildwheel without the flag.</em></p>
</li>
<li>
<p>✨ Adds CPython 3.15 support for iOS and Android (<a href="">#2857</a>, <a href="">#2858</a>)</p>
</li>
<li>
<p>✨ Adds Android improvements for building NumPy and related packages, including auditwheel support, pkg-config and Fortran configuration, and the <a href="https://cibuildwheel.pypa.io/en/stable/options/#xbuild-files"><code>xbuild-files</code></a> option (<a href="">#2695</a>)</p>
</li>
<li>
<p>✨ Adds <code>CIBUILDWHEEL_BUILD_IDENTIFIER</code> environment variable set to the current build identifier (e.g. <code>cp311-manylinux_x86_64</code>) during per-build steps (<a href="">#2872</a>)</p>
</li>
<li>
<p>✨ Adds <code>{project}</code> and <code>{package}</code> placeholders to <a href="https://cibuildwheel.pypa.io/en/stable/options/#config-settings"><code>config-settings</code></a> (<a href="">#2827</a>)</p>
</li>
<li>
<p>⚠️ Drops support for Python 3.8 (<a href="">#2686</a>)</p>
</li>
<li>
<p>⚠️ Removes the experimental CPython 3.13 free-threading builds and the <code>cpython-freethreading</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option. CPython 3.14+ free-threading support remains available without the enable flag. (<a href="">#2684</a>)</p>
</li>
<li>
<p>⚠️ Drops support for Cirrus CI, which is shutting down June 1, 2026 (<a href="">#2817</a>)</p>
</li>
<li>
<p>⚠️ Drops GraalPy 3.11 (gp311) support, as agreed in <a href="">#2741</a>, and removes GraalPy 24-only workarounds (<a href="">#2895</a>)</p>
</li>
<li>
<p>🔐 Adds SHA256 verification for direct downloads of Python interpreters, virtualenv, and python-build-standalone assets (<a href="">#2873</a>)</p>
</li>
<li>
<p>🔐 Adds tarfile extraction filter for safe archive extraction (<a href="">#2856</a>)</p>
</li>
<li>
<p>🐛 Fixes <code>UV_PYTHON</code> not being set for <a href="https://cibuildwheel.pypa.io/en/stable/options/#before-build"><code>before-build</code></a> on Linux when using <code>uv</code> as the <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> (<a href="">#2830</a>)</p>
</li>
<li>
<p>🐛 Fixes detection of musl libc when downloading python-build-standalone, which previously always selected the gnu asset on musl hosts like Alpine (<a href="">#2889</a>)</p>
</li>
<li>
<p>🐛 Fixes <a href="https://cibuildwheel.pypa.io/en/stable/options/#config-settings"><code>config-settings</code></a> expansion when <code>{project}</code> or <code>{package}</code> contains spaces or backslashes (<a href="">#2886</a>)</p>
</li>
<li>
<p>🐛 Prevents deadlock when <code>linux32</code> fails and forwards platform args to the sanity check (<a href="">#2880</a>, <a href="">#2888</a>)</p>
</li>
<li>
<p>🐛 Fixes container resource leaks on start failure and during teardown (<a href="">#2879</a>, <a href="">#2887</a>)</p>
</li>
<li>
<p>🐛 Removes potential partial cache-population in case of error (<a href="">#2892</a>)</p>
</li>
<li>
<p>🐛 Raises a clear error when <code>ANDROID_API_LEVEL</code> is not an integer (<a href="">#2891</a>)</p>
</li>
<li>
<p>🐛 Replaces assert with proper exception in python-build-standalone (<a href="">#2859</a>)</p>
</li>
<li>
<p>🐛 Uses ConfigurationError when <code>package_dir</code> is outside cwd instead of a generic Exception (<a href="">#2898</a>)</p>
</li>
<li>
<p>🛠 Updates dependencies and container pins (<a href="">#2893</a>, <a href="">#2882</a>, <a href="">#2874</a>, <a href="">#2868</a>, <a href="">#2862</a>, <a href="">#2884</a>, <a href="">#2845</a>, <a href="">#2837</a>, <a href="">#2818</a>, <a href="">#2810</a>, <a href="">#2838</a>, <a href="">#2813</a>)</p>
</li>
<li>
<p>🛠 Updates Android to Python 3.13.13 and 3.14.4 (<a href="">#2821</a>)</p>
</li>
<li>
<p>🛠 Applies Pyodide-specific patches to the Emscripten toolchain installation (<a href="">#2800</a>)</p>
</li>
<li>
<p>🛠 Uses <code>python -V -V</code> for Windows build diagnostics (<a href="">#2832</a>)</p>
</li>
<li>
<p>🛠 Simplifies pinned container image lookup (<a href="">#2897</a>)</p>
</li>
<li>
<p>🛠 Minor fixups across error messages, OCI container, and options (<a href="">#2860</a>)</p>
</li>
<li>
<p>💼 Adds PEP 723 metadata for <code>bin/</code> scripts and drops the <code>bin</code> dependency group (<a href="">#2819</a>)</p>
</li>
<li>
<p>💼 Improves Azure test reliability with retries and caching (<a href="">#2890</a>)</p>
</li>
<li>
<p>💼 Fixes Windows GitLab CI test running (<a href="">#2870</a>)</p>
</li>
<li>
<p>💼 Updates CI action pins and dev dependencies (<a href="">#2902</a>, <a href="">#2867</a>, <a href="">#2851</a>, <a href="">#2843</a>, <a href="">#2826</a>, <a href="">#2823</a>, <a href="">#2820</a>, <a href="">#2807</a>)</p>
</li>
<li>
<p>💼 Adds agent and copilot setup files (<a href="">#2861</a>)</p>
</li>
<li>
<p>💼 Uses <code>if TYPE_CHECKING:</code> blocks (<a href="">#2866</a>, <a href="">#2864</a>)</p>
</li>
<li>
<p>🧪 Fixes Android tests using the <code>uv</code> frontend (<a href="">#2809</a>)</p>
</li>
<li>
<p>🧪 Fixes the update-dependencies workflow to use <code>uv</code> to run <code>nox</code> (<a href="">#2808</a>)</p>
</li>
<li>
<p>🧪 Adds unit tests for <code>OCIContainer._get_platform_args</code> (<a href="">#2878</a>)</p>
</li>
<li>
<p>📚 Updates documentation for delvewheel as the default Windows <a href="https://cibuildwheel.pypa.io/en/stable/options/#repair-wheel-command"><code>repair-wheel-command</code></a>, including the build diagram, schema defaults, and legal note (<a href="">#2877</a>, <a href="">#2853</a>, <a href="">#2891</a>)</p>
</li>
<li>
<p>📚 Documents platform-specific <a href="https://cibuildwheel.pypa.io/en/stable/options/#before-build"><code>before-build</code></a> configuration (<a href="">#2834</a>)</p>
</li>
<li>
<p>📚 Updates the &quot;How it works&quot; diagram with details of Android, iOS, and Pyodide builds (<a href="">#2816</a>)</p>
</li>
<li>
<p>📚 Adds Pyodide icon and regenerates working examples data for Android, iOS, and Pyodide (<a href="">#2815</a>, <a href="">#2811</a>)</p>
</li>
<li>
<p>📚 Adds intersphinx support for external documentation linking (<a href="">#2871</a>)</p>
</li>
<li>
<p>📚 Adds instructions for building CUDA wheels and fixes manylinux container references in FAQ (<a href="">#2896</a>, <a href="">#2900</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v4.0.0</h3>
<p><em>7 June 2026</em></p>
<p>See <a href="https://github.com/henryiii"><code>@​henryiii</code></a>'s <a href="https://iscinumpy.dev/post/cibuildwheel-4-0-0/">release post</a> for more info on new features!</p>
<ul>
<li>
<p>🌟 Adds wheel auditing with <code>abi3audit</code> as a default after the repair step, with new <a href="https://cibuildwheel.pypa.io/en/stable/options/#audit-requires"><code>audit-requires</code></a> and <a href="https://cibuildwheel.pypa.io/en/stable/options/#audit-command"><code>audit-command</code></a> options (<a href="">#2805</a>)</p>
</li>
<li>
<p>🌟 Adds <code>pyemscripten</code> platform tag support (PEP 783), updates Pyodide to 314.0.0a2, and adds a <code>pyodide-eol</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> flag for building end-of-life Pyodide versions (<a href="">#2812</a>, <a href="">#2848</a>)</p>
</li>
<li>
<p>🌟 Sets up <code>delvewheel</code> as the default <a href="https://cibuildwheel.pypa.io/en/stable/options/#repair-wheel-command"><code>repair-wheel-command</code></a> for Windows, so extension module DLLs are now bundled automatically. Skip by setting it to empty if not needed. (<a href="">#2831</a>)</p>
</li>
<li>
<p>✨ Adds CPython 3.15 support, under the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> <code>cpython-prerelease</code>. This version of cibuildwheel uses 3.15.0b2. (<a href="">#2833</a>, <a href="">#2850</a>)</p>
<p><em>While CPython is in beta, the ABI can change, so your wheels might not be compatible with the final release. For this reason, we don't recommend distributing wheels until RC1, at which point 3.15 will be available in cibuildwheel without the flag.</em></p>
</li>
<li>
<p>✨ Adds CPython 3.15 support for iOS and Android (<a href="">#2857</a>, <a href="">#2858</a>)</p>
</li>
<li>
<p>✨ Adds Android improvements for building NumPy and related packages, including auditwheel support, pkg-config and Fortran configuration, and the <a href="https://cibuildwheel.pypa.io/en/stable/options/#xbuild-files"><code>xbuild-files</code></a> option (<a href="">#2695</a>)</p>
</li>
<li>
<p>✨ Adds <code>CIBUILDWHEEL_BUILD_IDENTIFIER</code> environment variable set to the current build identifier (e.g. <code>cp311-manylinux_x86_64</code>) during per-build steps (<a href="">#2872</a>)</p>
</li>
<li>
<p>✨ Adds <code>{project}</code> and <code>{package}</code> placeholders to <a href="https://cibuildwheel.pypa.io/en/stable/options/#config-settings"><code>config-settings</code></a> (<a href="">#2827</a>)</p>
</li>
<li>
<p>⚠️ Drops support for Python 3.8 (<a href="">#2686</a>)</p>
</li>
<li>
<p>⚠️ Removes the experimental CPython 3.13 free-threading builds and the <code>cpython-freethreading</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option. CPython 3.14+ free-threading support remains available without the enable flag. (<a href="">#2684</a>)</p>
</li>
<li>
<p>⚠️ Drops support for Cirrus CI, which is shutting down June 1, 2026 (<a href="">#2817</a>)</p>
</li>
<li>
<p>⚠️ Drops GraalPy 3.11 (gp311) support, as agreed in <a href="">#2741</a>, and removes GraalPy 24-only workarounds (<a href="">#2895</a>)</p>
</li>
<li>
<p>🔐 Adds SHA256 verification for direct downloads of Python interpreters, virtualenv, and python-build-standalone assets (<a href="">#2873</a>)</p>
</li>
<li>
<p>🔐 Adds tarfile extraction filter for safe archive extraction (<a href="">#2856</a>)</p>
</li>
<li>
<p>🐛 Fixes <code>UV_PYTHON</code> not being set for <a href="https://cibuildwheel.pypa.io/en/stable/options/#before-build"><code>before-build</code></a> on Linux when using <code>uv</code> as the <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> (<a href="">#2830</a>)</p>
</li>
<li>
<p>🐛 Fixes detection of musl libc when downloading python-build-standalone, which previously always selected the gnu asset on musl hosts like Alpine (<a href="">#2889</a>)</p>
</li>
<li>
<p>🐛 Fixes <a href="https://cibuildwheel.pypa.io/en/stable/options/#config-settings"><code>config-settings</code></a> expansion when <code>{project}</code> or <code>{package}</code> contains spaces or backslashes (<a href="">#2886</a>)</p>
</li>
<li>
<p>🐛 Prevents deadlock when <code>linux32</code> fails and forwards platform args to the sanity check (<a href="">#2880</a>, <a href="">#2888</a>)</p>
</li>
<li>
<p>🐛 Fixes container resource leaks on start failure and during teardown (<a href="">#2879</a>, <a href="">#2887</a>)</p>
</li>
<li>
<p>🐛 Removes potential partial cache-population in case of error (<a href="">#2892</a>)</p>
</li>
<li>
<p>🐛 Raises a clear error when <code>ANDROID_API_LEVEL</code> is not an integer (<a href="">#2891</a>)</p>
</li>
<li>
<p>🐛 Replaces assert with proper exception in python-build-standalone (<a href="">#2859</a>)</p>
</li>
<li>
<p>🐛 Uses ConfigurationError when <code>package_dir</code> is outside cwd instead of a generic Exception (<a href="">#2898</a>)</p>
</li>
<li>
<p>🛠 Updates dependencies and container pins (<a href="">#2893</a>, <a href="">#2882</a>, <a href="">#2874</a>, <a href="">#2868</a>, <a href="">#2862</a>, <a href="">#2884</a>, <a href="">#2845</a>, <a href="">#2837</a>, <a href="">#2818</a>, <a href="">#2810</a>, <a href="">#2838</a>, <a href="">#2813</a>)</p>
</li>
<li>
<p>🛠 Updates Android to Python 3.13.13 and 3.14.4 (<a href="">#2821</a>)</p>
</li>
<li>
<p>🛠 Applies Pyodide-specific patches to the Emscripten toolchain installation (<a href="">#2800</a>)</p>
</li>
<li>
<p>🛠 Uses <code>python -V -V</code> for Windows build diagnostics (<a href="">#2832</a>)</p>
</li>
<li>
<p>🛠 Simplifies pinned container image lookup (<a href="">#2897</a>)</p>
</li>
<li>
<p>🛠 Minor fixups across error messages, OCI container, and options (<a href="">#2860</a>)</p>
</li>
<li>
<p>💼 Adds PEP 723 metadata for <code>bin/</code> scripts and drops the <code>bin</code> dependency group (<a href="">#2819</a>)</p>
</li>
<li>
<p>💼 Improves Azure test reliability with retries and caching (<a href="">#2890</a>)</p>
</li>
<li>
<p>💼 Fixes Windows GitLab CI test running (<a href="">#2870</a>)</p>
</li>
<li>
<p>💼 Updates CI action pins and dev dependencies (<a href="">#2902</a>, <a href="">#2867</a>, <a href="">#2851</a>, <a href="">#2843</a>, <a href="">#2826</a>, <a href="">#2823</a>, <a href="">#2820</a>, <a href="">#2807</a>)</p>
</li>
<li>
<p>💼 Adds agent and copilot setup files (<a href="">#2861</a>)</p>
</li>
<li>
<p>💼 Uses <code>if TYPE_CHECKING:</code> blocks (<a href="">#2866</a>, <a href="">#2864</a>)</p>
</li>
<li>
<p>🧪 Fixes Android tests using the <code>uv</code> frontend (<a href="">#2809</a>)</p>
</li>
<li>
<p>🧪 Fixes the update-dependencies workflow to use <code>uv</code> to run <code>nox</code> (<a href="">#2808</a>)</p>
</li>
<li>
<p>🧪 Adds unit tests for <code>OCIContainer._get_platform_args</code> (<a href="">#2878</a>)</p>
</li>
<li>
<p>📚 Updates documentation for delvewheel as the default Windows <a href="https://cibuildwheel.pypa.io/en/stable/options/#repair-wheel-command"><code>repair-wheel-command</code></a>, including the build diagram, schema defaults, and legal note (<a href="">#2877</a>, <a href="">#2853</a>, <a href="">#2891</a>)</p>
</li>
<li>
<p>📚 Documents platform-specific <a href="https://cibuildwheel.pypa.io/en/stable/options/#before-build"><code>before-build</code></a> configuration (<a href="">#2834</a>)</p>
</li>
<li>
<p>📚 Updates the &quot;How it works&quot; diagram with details of Android, iOS, and Pyodide builds (<a href="">#2816</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f03ac76</code></a> Bump version: v4.0.0</li>
<li><a href=""><code>557c5f6</code></a> feat: remove GraalPy 3.11 (gp311) support (<a href="">#2895</a>)</li>
<li><a href=""><code>70975c2</code></a> chore: use ConfigurationError when package_dir is outside cwd (<a href="">#2898</a>)</li>
<li><a href=""><code>e2f143c</code></a> chore(deps): bump docker/setup-qemu-action from 4.0.0 to 4.1.0 in the actions...</li>
<li><a href=""><code>866ae74</code></a> docs: fix CUDA manylinux container references in FAQ (<a href="">#2900</a>)</li>
<li><a href=""><code>84b518a</code></a> chore: simplify pinned image lookup (<a href="">#2897</a>)</li>
<li><a href=""><code>785d812</code></a> docs: add instructions for building CUDA wheels (<a href="">#2896</a>)</li>
<li><a href=""><code>f6bd047</code></a> Bump version: v4.0.0rc2</li>
<li><a href=""><code>6cd2d19</code></a> fix: remove potential partial cache-population in case of error (<a href="">#2892</a>)</li>
<li><a href=""><code>cdb170b</code></a> [Bot] Update dependencies (<a href="">#2893</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.4.1...v4.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.4.1&new-version=4.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c83964546807`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
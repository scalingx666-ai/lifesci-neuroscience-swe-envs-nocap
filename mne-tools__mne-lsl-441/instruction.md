# Issue

**Title:** Bump pypa/cibuildwheel from 2.23.3 to 3.0.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 2.23.3 to 3.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<p>See <a href="https://github.com/henryiii"><code>@​henryiii</code></a>'s <a href="https://iscinumpy.dev/post/cibuildwheel-3-0-0/">release post</a> for more info on new features!</p>
<ul>
<li>
<p>🌟 Adds the ability to <a href="https://cibuildwheel.pypa.io/en/stable/platforms/#ios">build wheels for iOS</a>! Set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#platform"><code>platform</code> option</a> to <code>ios</code> on a Mac with the iOS toolchain to try it out! (<a href="">#2286</a>, <a href="">#2363</a>, <a href="">#2432</a>)</p>
</li>
<li>
<p>🌟 Adds support for the GraalPy interpreter! Enable for your project using the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a>. (<a href="">#1538</a>, <a href="">#2411</a>, <a href="">#2414</a>)</p>
</li>
<li>
<p>✨ Adds CPython 3.14 support, under the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> <code>cpython-prerelease</code>. This version of cibuildwheel uses 3.14.0b2. (<a href="">#2390</a>)</p>
<p><em>While CPython is in beta, the ABI can change, so your wheels might not be compatible with the final release. For this reason, we don't recommend distributing wheels until RC1, at which point 3.14 will be available in cibuildwheel without the flag.</em> (<a href="">#2390</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#test-sources">test-sources option</a>, and changes the working directory for tests. (<a href="">#2062</a>, <a href="">#2284</a>, <a href="">#2437</a>)</p>
<ul>
<li>If this option is set, cibuildwheel will copy the files and folders specified in <code>test-sources</code> into the temporary directory we run from. This is required for iOS builds, but also useful for other platforms, as it allows you to avoid placeholders.</li>
<li>If this option is not set, behaviour matches v2.x - cibuildwheel will run the tests from a temporary directory, and you can use the <code>{project}</code> placeholder in the <code>test-command</code> to refer to the project directory. (<a href="">#2420</a>)</li>
</ul>
</li>
<li>
<p>✨ Adds <a href="https://cibuildwheel.pypa.io/en/stable/options/#dependency-versions"><code>dependency-versions</code></a> inline syntax (<a href="">#2122</a>)</p>
</li>
<li>
<p>✨ Improves support for Pyodide builds and adds the experimental <a href="https://cibuildwheel.pypa.io/en/stable/options/#pyodide-version"><code>pyodide-version</code></a> option, which allows you to specify the version of Pyodide to use for builds. (<a href="">#2002</a>)</p>
</li>
<li>
<p>✨ Add <code>pyodide-prerelease</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable">enable</a> option, with an early build of 0.28 (Python 3.13). (<a href="">#2431</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#test-environment"><code>test-environment</code></a> option, which allows you to set environment variables for the test command. (<a href="">#2388</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#xbuild-tools"><code>xbuild-tools</code></a> option, which allows you to specify tools safe for cross-compilation. Currently only used on iOS; will be useful for Android in the future. (<a href="">#2317</a>)</p>
</li>
<li>
<p>🛠 The default <a href="https://cibuildwheel.pypa.io/en/stable/options/#linux-image">manylinux image</a> has changed from <code>manylinux2014</code> to <code>manylinux_2_28</code>. (<a href="">#2330</a>)</p>
</li>
<li>
<p>🛠 EOL images <code>manylinux1</code>, <code>manylinux2010</code>, <code>manylinux_2_24</code> and <code>musllinux_1_1</code> can no longer be specified by their shortname. The full OCI name can still be used for these images, if you wish. (<a href="">#2316</a>)</p>
</li>
<li>
<p>🛠 Invokes <code>build</code> rather than <code>pip wheel</code> to build wheels by default. You can control this via the <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> option. You might notice that you can see your build log output now! (<a href="">#2321</a>)</p>
</li>
<li>
<p>🛠 Build verbosity settings have been reworked to have consistent meanings between build backends when non-zero. (<a href="">#2339</a>)</p>
</li>
<li>
<p>🛠 Removed the <code>CIBW_PRERELEASE_PYTHONS</code> and <code>CIBW_FREE_THREADED_SUPPORT</code> options - these have been folded into the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option instead. (<a href="">#2095</a>)</p>
</li>
<li>
<p>🛠 Build environments no longer have setuptools and wheel preinstalled. (<a href="">#2329</a>)</p>
</li>
<li>
<p>🛠 Use the standard Schema line for the integrated JSONSchema. (<a href="">#2433</a>)</p>
</li>
<li>
<p>⚠️ Dropped support for building Python 3.6 and 3.7 wheels. If you need to build wheels for these versions, use cibuildwheel v2.23.3 or earlier. (<a href="">#2282</a>)</p>
</li>
<li>
<p>⚠️ The minimum Python version required to run cibuildwheel is now Python 3.11. You can still build wheels for Python 3.8 and newer. (<a href="">#1912</a>)</p>
</li>
<li>
<p>⚠️ 32-bit Linux wheels no longer built by default - the <a href="https://cibuildwheel.pypa.io/en/stable/options/#archs">arch</a> was removed from <code>&quot;auto&quot;</code>. It now requires explicit <code>&quot;auto32&quot;</code>. Note that modern manylinux images (like the new default, <code>manylinux_2_28</code>) do not have 32-bit versions. (<a href="">#2458</a>)</p>
</li>
<li>
<p>⚠️ PyPy wheels no longer built by default, due to a change to our options system. To continue building PyPy wheels, you'll now need to set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> to <code>pypy</code> or <code>pypy-eol</code>. (<a href="">#2095</a>)</p>
</li>
<li>
<p>⚠️ Dropped official support for Appveyor. If it was working for you before, it will probably continue to do so, but we can't be sure, because our CI doesn't run there anymore. (<a href="">#2386</a>)</p>
</li>
<li>
<p>📚 A reorganisation of the docs, and numerous updates. (<a href="">#2280</a>)</p>
</li>
<li>
<p>📚 Use Python 3.14 color output in docs CLI output. (<a href="">#2407</a>)</p>
</li>
<li>
<p>📚 Docs now primarily use the pyproject.toml name of options, rather than the environment variable name. (<a href="">#2389</a>)</p>
</li>
<li>
<p>📚 README table now matches docs and auto-updates. (<a href="">#2427</a>, <a href="">#2428</a>)</p>
</li>
</ul>
<h2>v3.0.0rc3</h2>
<p>Not yet released, but available for testing.</p>
<p>Note - when using a beta version, be sure to check the <a href="https://cibuildwheel.pypa.io/en/latest/">latest docs</a>, rather than the stable version, which is still on v2.X.</p>
<!-- raw HTML omitted -->
<p>If you've used previous versions of the beta:</p>
<ul>
<li>⚠️ Previous betas of v3.0 changed the working directory for tests. This has been rolled back to the v2.x behaviour, so you might need to change configs if you adapted to the beta 1 or 2 behaviour. See [issue <a href="">#2406</a>](<a href="">pypa/cibuildwheel#2406</a>) for more information.</li>
<li>⚠️ GraalPy shipped with the identifier <code>gp242-*</code> in previous betas, this has been changed to <code>gp311_242-*</code> to be consistent with other interpreters, and to fix a bug with GraalPy and project requires-python detection. If you were using GraalPy, you might need to update your config to use the new identifier.</li>
<li>⚠️ <code>test-sources</code> now uses <code>project</code> directory instead of the <code>package</code> directory (matching the docs).</li>
<li>⚠️ 32-bit linux builds were removed from <code>&quot;auto&quot;</code> (the default), now require <code>&quot;auto32&quot;</code> or explicit archs, as modern manylinux images (including our new default) do not support them.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.0.0</h3>
<p><em>11 June 2025</em></p>
<p>See <a href="https://github.com/henryiii"><code>@​henryiii</code></a>'s <a href="https://iscinumpy.dev/post/cibuildwheel-3-0-0/">release post</a> for more info on new features!</p>
<ul>
<li>
<p>🌟 Adds the ability to <a href="https://cibuildwheel.pypa.io/en/stable/platforms/#ios">build wheels for iOS</a>! Set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#platform"><code>platform</code> option</a> to <code>ios</code> on a Mac with the iOS toolchain to try it out! (<a href="">#2286</a>, <a href="">#2363</a>, <a href="">#2432</a>)</p>
</li>
<li>
<p>🌟 Adds support for the GraalPy interpreter! Enable for your project using the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a>. (<a href="">#1538</a>, <a href="">#2411</a>, <a href="">#2414</a>)</p>
</li>
<li>
<p>✨ Adds CPython 3.14 support, under the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> <code>cpython-prerelease</code>. This version of cibuildwheel uses 3.14.0b2. (<a href="">#2390</a>)</p>
<p><em>While CPython is in beta, the ABI can change, so your wheels might not be compatible with the final release. For this reason, we don't recommend distributing wheels until RC1, at which point 3.14 will be available in cibuildwheel without the flag.</em> (<a href="">#2390</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#test-sources">test-sources option</a>, and changes the working directory for tests. (<a href="">#2062</a>, <a href="">#2284</a>, <a href="">#2437</a>)</p>
<ul>
<li>If this option is set, cibuildwheel will copy the files and folders specified in <code>test-sources</code> into the temporary directory we run from. This is required for iOS builds, but also useful for other platforms, as it allows you to avoid placeholders.</li>
<li>If this option is not set, behaviour matches v2.x - cibuildwheel will run the tests from a temporary directory, and you can use the <code>{project}</code> placeholder in the <code>test-command</code> to refer to the project directory. (<a href="">#2420</a>)</li>
</ul>
</li>
<li>
<p>✨ Adds <a href="https://cibuildwheel.pypa.io/en/stable/options/#dependency-versions"><code>dependency-versions</code></a> inline syntax (<a href="">#2122</a>)</p>
</li>
<li>
<p>✨ Improves support for Pyodide builds and adds the experimental <a href="https://cibuildwheel.pypa.io/en/stable/options/#pyodide-version"><code>pyodide-version</code></a> option, which allows you to specify the version of Pyodide to use for builds. (<a href="">#2002</a>)</p>
</li>
<li>
<p>✨ Add <code>pyodide-prerelease</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable">enable</a> option, with an early build of 0.28 (Python 3.13). (<a href="">#2431</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#test-environment"><code>test-environment</code></a> option, which allows you to set environment variables for the test command. (<a href="">#2388</a>)</p>
</li>
<li>
<p>✨ Adds the <a href="https://cibuildwheel.pypa.io/en/stable/options/#xbuild-tools"><code>xbuild-tools</code></a> option, which allows you to specify tools safe for cross-compilation. Currently only used on iOS; will be useful for Android in the future. (<a href="">#2317</a>)</p>
</li>
<li>
<p>🛠 The default <a href="https://cibuildwheel.pypa.io/en/stable/options/#linux-image">manylinux image</a> has changed from <code>manylinux2014</code> to <code>manylinux_2_28</code>. (<a href="">#2330</a>)</p>
</li>
<li>
<p>🛠 EOL images <code>manylinux1</code>, <code>manylinux2010</code>, <code>manylinux_2_24</code> and <code>musllinux_1_1</code> can no longer be specified by their shortname. The full OCI name can still be used for these images, if you wish. (<a href="">#2316</a>)</p>
</li>
<li>
<p>🛠 Invokes <code>build</code> rather than <code>pip wheel</code> to build wheels by default. You can control this via the <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> option. You might notice that you can see your build log output now! (<a href="">#2321</a>)</p>
</li>
<li>
<p>🛠 Build verbosity settings have been reworked to have consistent meanings between build backends when non-zero. (<a href="">#2339</a>)</p>
</li>
<li>
<p>🛠 Removed the <code>CIBW_PRERELEASE_PYTHONS</code> and <code>CIBW_FREE_THREADED_SUPPORT</code> options - these have been folded into the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option instead. (<a href="">#2095</a>)</p>
</li>
<li>
<p>🛠 Build environments no longer have setuptools and wheel preinstalled. (<a href="">#2329</a>)</p>
</li>
<li>
<p>🛠 Use the standard Schema line for the integrated JSONSchema. (<a href="">#2433</a>)</p>
</li>
<li>
<p>⚠️ Dropped support for building Python 3.6 and 3.7 wheels. If you need to build wheels for these versions, use cibuildwheel v2.23.3 or earlier. (<a href="">#2282</a>)</p>
</li>
<li>
<p>⚠️ The minimum Python version required to run cibuildwheel is now Python 3.11. You can still build wheels for Python 3.8 and newer. (<a href="">#1912</a>)</p>
</li>
<li>
<p>⚠️ 32-bit Linux wheels no longer built by default - the <a href="https://cibuildwheel.pypa.io/en/stable/options/#archs">arch</a> was removed from <code>&quot;auto&quot;</code>. It now requires explicit <code>&quot;auto32&quot;</code>. Note that modern manylinux images (like the new default, <code>manylinux_2_28</code>) do not have 32-bit versions. (<a href="">#2458</a>)</p>
</li>
<li>
<p>⚠️ PyPy wheels no longer built by default, due to a change to our options system. To continue building PyPy wheels, you'll now need to set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> to <code>pypy</code> or <code>pypy-eol</code>. (<a href="">#2095</a>)</p>
</li>
<li>
<p>⚠️ Dropped official support for Appveyor. If it was working for you before, it will probably continue to do so, but we can't be sure, because our CI doesn't run there anymore. (<a href="">#2386</a>)</p>
</li>
<li>
<p>📚 A reorganisation of the docs, and numerous updates. (<a href="">#2280</a>)</p>
</li>
<li>
<p>📚 Use Python 3.14 color output in docs CLI output. (<a href="">#2407</a>)</p>
</li>
<li>
<p>📚 Docs now primarily use the pyproject.toml name of options, rather than the environment variable name. (<a href="">#2389</a>)</p>
</li>
<li>
<p>📚 README table now matches docs and auto-updates. (<a href="">#2427</a>, <a href="">#2428</a>)</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5f22145</code></a> Bump version: v3.0.0</li>
<li><a href=""><code>a731775</code></a> Docs: mobile layout fix (<a href="">#2466</a>)</li>
<li><a href=""><code>ff86a64</code></a> docs: add tips for numpy (<a href="">#2465</a>)</li>
<li><a href=""><code>6f5e480</code></a> chore: use pip's groups in CI (<a href="">#2463</a>)</li>
<li><a href=""><code>3c5ff09</code></a> Bump version: v3.0.0rc3</li>
<li><a href=""><code>1b9a56e</code></a> [Bot] Update dependencies (<a href="">#2455</a>)</li>
<li><a href=""><code>aa9fe2a</code></a> ci: use uv python for docs (binary b1) (<a href="">#2462</a>)</li>
<li><a href=""><code>e188d9e</code></a> feat: remove 32-bit linux from auto arch, fix auto32 on linux aarch64 (<a href="">#2458</a>)</li>
<li><a href=""><code>3fa7bd1</code></a> ci: fix cirrus and reduce rebuilds (<a href="">#2460</a>)</li>
<li><a href=""><code>c6368be</code></a> Move to the <code>OS-latest</code> image tags on Azure Pipelines (<a href="">#2461</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v2.23.3...v3.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=2.23.3&new-version=3.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e2203f16da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
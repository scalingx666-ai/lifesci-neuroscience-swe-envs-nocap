# Issue

**Title:** Bump setuptools from 83.0.0 to 84.0.0

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 83.0.0 to 84.0.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v84.0.0</h1>
<h2>Features</h2>
<ul>
<li>Newline-separated <code>keywords</code> and <code>platforms</code><code>pypa/setuptools#4887</code><code>old specification &lt;https://peps.python.org/pep-0345/&gt;</code>_ separated items with spaces and the current one uses commas. (<a href="">#4887</a>)</li>
<li><code>Extension</code><code>pypa/distutils#373</code><a href="">#5022</a>)</li>
<li>The C compiler modules now emit log messages through their own <code>compilers.C.*</code> loggers instead of the distutils root logger, part of decoupling the compilers package from distutils. The logger names are normalized to a stable <code>compilers.C.*</code> prefix so they remain constant as the package migrates toward a standalone <code>compilers.C</code> distribution. (<a href="">#5266</a>)</li>
<li>The C compilers gained a <code>Compiler.call</code> method -- a thin wrapper over <code>subprocess.check_call</code> (with macOS deployment-target env injection) that is the modern replacement for <code>Compiler.spawn</code>. The compilers no longer depend on <code>distutils.spawn</code>, <code>distutils.dir_util</code>, <code>distutils.file_util</code>, <code>distutils._modified</code>, or <code>distutils.util.execute</code>/<code>split_quoted</code>: the generic <code>newer</code>/<code>newer_group</code> and <code>split_quoted</code> helpers are vendored into the <code>compilers</code> package, and <code>Compiler.mkpath</code>/<code>move_file</code>/<code>execute</code> are implemented directly on the standard library (<code>os.makedirs</code>/<code>shutil.move</code>). The methods are retained for backward compatibility. (<a href="">#5267</a>)</li>
<li>The compilers no longer depend on <code>distutils.util</code>, <code>distutils.version</code>, <code>distutils.compat</code>, or <code>distutils._macos_compat</code>. The platform-identification helpers (<code>get_platform</code>/<code>get_host_platform</code>/<code>is_mingw</code>) now live in <code>distutils.compilers.platform.detect</code> and the macOS deployment-target logic and <code>compiler_fixup</code> in <code>distutils.compilers.platform.macos</code>; <code>CygwinCCompiler.gcc_version</code> returns a <code>packaging.version.Version</code>. <code>distutils.util</code> re-exports the platform/macOS helpers from their new homes for backward compatibility rather than keeping duplicate copies. (sysconfig lookups still route through distutils pending its own decoupling.) (<a href="">#5268</a>)</li>
<li>The compilers now read their build configuration from the standard library's <code>sysconfig</code> instead of <code>distutils.sysconfig</code>. Per-compiler customization -- previously <code>distutils.sysconfig.customize_compiler</code> -- has moved into <code>Compiler.configure_system()</code>: a no-op on the base class, with <code>UnixCCompiler</code> applying the compiler/flag/archiver settings CPython recorded in <code>sysconfig</code> (and the usual <code>CC</code>/<code>CFLAGS</code>/<code>LDSHARED</code>/… environment overrides). <code>distutils.sysconfig.customize_compiler</code> is retained as a thin wrapper that calls <code>compiler.configure_system()</code>. (<a href="">#5269</a>)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>The MSVC linker now passes its arguments through a response file when the command line would exceed the Windows maximum length, fixing failures when linking a large number of objects. (<a href="">#4177</a>)</li>
<li>The Cygwin and MinGW compilers now pass <code>-O1</code> instead of a bare <code>-O</code>. The two are equivalent to GCC, but <code>cc1</code> rejected the bare form when building 32-bit extensions with <code>-m32</code>. -- by :user:<code>dchaudhari7177</code> (<a href="">#4873</a>)</li>
<li><code>copy_file</code><code>pypa/distutils#379</code><a href="">#5079</a>)</li>
<li>Setuptools wheels no longer bundled the project's own test modules. -- by :user:<code>itscloud0</code> (<a href="">#5212</a>)</li>
<li><code>build_ext</code> no longer fails when cross-compiling with a compiler other than MSVC (such as MinGW). <code>Compiler</code> now provides a no-op <code>initialize()</code><code>pypa/distutils#399</code></li>
</ul>
<h2>Improved Documentation</h2>
<ul>
<li>Clarified what &quot;correspond exactly to the directory structure&quot; means in
the <code>packages</code> section of the Package Discovery user guide. (<a href="">#4109</a>)</li>
<li>Documented how <code>bdist_wheel</code>'s <code>py_limited_api</code> option controls
<code>abi3</code> wheel tagging for extension modules -- by :user:<code>Himanshuagrawal4</code> (<a href="">#4741</a>)</li>
</ul>
<h2>Deprecations and Removals</h2>
<ul>
<li><code>Compiler.spawn</code> is deprecated in favor of the new <code>Compiler.call</code>. <code>call</code> raises native <code>subprocess</code> exceptions; <code>spawn</code> remains as a shim that emits a <code>DeprecationWarning</code> and translates them to <code>DistutilsExecError</code>. The MSVC <code>spawn</code> compatibility shim for third-party monkeypatches predating the <code>env</code> argument (numpy.distutils before 1.19, per <a href="">pypa/distutils#15</a>) has been removed. <code>distutils.spawn.spawn</code> is likewise reduced to a thin wrapper around <code>subprocess.check_call</code>: it no longer resolves <code>cmd[0]</code> via <code>shutil.which</code> (<code>subprocess</code> searches <code>PATH</code> itself) nor injects <code>MACOSX_DEPLOYMENT_TARGET</code> (that now lives with the compilers, the only callers to which it applied). (<a href="">#5267</a>)</li>
<li>Building an extension with a <code>MACOSX_DEPLOYMENT_TARGET</code> lower than the interpreter's configured value now raises <code>compilers.errors.PlatformError</code> instead of <code>distutils.errors.DistutilsPlatformError</code> (the macOS deployment-target check moved into the compilers package). <code>CygwinCCompiler.gcc_version</code> returns a <code>packaging.version.Version</code> rather than the removed <code>distutils.version.LooseVersion</code>. Completing the transition begun in <a href="">pypa/distutils#246</a>, <code>UnixCCompiler.runtime_library_dir_option</code> now returns the <code>[&quot;-Wl,--enable-new-dtags&quot;, &quot;-Wl,-rpath,&lt;dir&gt;&quot;]</code> list directly for GNU ld rather than collapsing it into a single string, and the temporary <code>distutils.compat.consolidate_linker_args</code> shim has been removed. (<a href="">#5268</a>)</li>
<li>The compilers now define their own exception vocabulary instead of borrowing distutils' framework errors. Language-agnostic exceptions (<code>Error</code>, <code>UnknownFileType</code>, and a new <code>PlatformError</code>) live at <code>distutils.compilers.errors</code>, leaving room for future <code>compilers.&lt;language&gt;</code> siblings; the C/C++-specific <code>CompileError</code>/<code>LinkError</code>/<code>LibError</code>/<code>PreprocessError</code> remain in <code>distutils.compilers.C.errors</code>. The compilers now raise <code>compilers.errors.PlatformError</code> where they previously raised <code>distutils.errors.DistutilsPlatformError</code>/<code>DistutilsModuleError</code>, and <code>compilers._modified.newer</code> raises the stdlib <code>FileNotFoundError</code>. <code>distutils.errors</code> keeps its own framework exceptions and re-exports the compiler ones (<code>CCompilerError</code>, <code>CompileError</code>, etc.) for backward compatibility; because <code>CCompilerError</code> is <code>compilers.errors.Error</code>, code catching it (as distutils' top-level handlers do) still catches the new <code>PlatformError</code>. (<a href="">#5270</a>)</li>
<li><code>customize_compiler</code> now asserts that the compiler-related config variables (<code>CC</code>, <code>CXX</code>, <code>CFLAGS</code>, etc.) resolve to strings, raising <code>AssertionError</code> if any are unexpectedly <code>None</code><code>pypa/distutils#363</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>72e919a</code></a> Merge pull request <a href="">#5293</a> from pypa/bugfix/integration-pip-flit-backend</li>
<li><a href=""><code>1b29701</code></a> Select the top-level pyproject.toml when reading build requirements</li>
<li><a href=""><code>bb1b381</code></a> Bump version: 83.0.0 → 84.0.0</li>
<li><a href=""><code>ee6fdd7</code></a> Sync with distutils @ e8eb87855 (<a href="">#5292</a>)</li>
<li><a href=""><code>2a4a9e4</code></a> Merge remote-tracking branch 'origin/main' into distutils-e8eb87855</li>
<li><a href=""><code>cbd1195</code></a> Merge <a href="https://github.com/jaraco/skeleton">https://github.com/jaraco/skeleton</a></li>
<li><a href=""><code>bd3594e</code></a> Merge pull request <a href="">#5287</a> from Avasam/Configuring-lint.flake8-comprehensions.a...</li>
<li><a href=""><code>f02e90a</code></a> Configure C408 to allow dict(a=1) rather than disabling it</li>
<li><a href=""><code>c55f52b</code></a> Configuring lint.flake8-comprehensions.allow-dict-calls-with-keyword-argument...</li>
<li><a href=""><code>e9904b0</code></a> Match the distutils sdist base type for the user_options override</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v83.0.0...v84.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=setuptools&package-manager=uv&previous-version=83.0.0&new-version=84.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d0988e03121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
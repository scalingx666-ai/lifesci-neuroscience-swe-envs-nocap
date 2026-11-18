# Issue

**Title:** Bump threadpoolctl from 3.6.0 to 3.7.0

## Description

Bumps [threadpoolctl](https://github.com/joblib/threadpoolctl) from 3.6.0 to 3.7.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/joblib/threadpoolctl/blob/master/CHANGES.md">threadpoolctl's changelog</a>.</em></p>
<blockquote>
<h1>3.7.0 (2026-09-15)</h1>
<ul>
<li>
<p>Fixed an intermittent <code>OSError</code> on Windows when DLLs are loaded or unloaded
concurrently during library discovery (for example when importing conda-forge
OpenCV). On Python 3.14+, discovery uses <code>ctypes.util.dllist</code> when available.
If <code>dllist</code> raises <code>OSError</code>, threadpoolctl emits a <code>RuntimeWarning</code> instead
of crashing so the failure can be reported upstream with a minimal
reproducer. Older Pythons use a Toolhelp snapshot enumerator, with graceful
per-module fallbacks.
<a href="">joblib/threadpoolctl#219</a></p>
</li>
<li>
<p>Added the ability to check whether a limiting API affects just the current
thread or the whole process. Mainly aimed at debugging and diagnostics, and
somewhat unreliable, it is therefore enabled by default only for command-line
usage.
<a href="">joblib/threadpoolctl#213</a></p>
</li>
<li>
<p>Only warn about simultaneous <code>libomp</code> and <code>libiomp</code> usage on Linux, where the
incompatibility is known to cause crashes.
<a href="">joblib/threadpoolctl#222</a></p>
</li>
<li>
<p>Fixed a deadlock triggered by getting or setting MKL's number of threads from
parallel threads when using MKL with libiomp (Intel threading) on Linux.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>Going forward, setting the number of threads will only have a thread-local
impact if feasible (for example, at minimum the underlying library must
support this option, and many don't.)
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>For MKL, setting the number of threads is now thread-local, i.e. limiting the
number of threads won't impact MKL's thread pool size when using MKL in other
Python threads.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>For OpenBLAS compiled with OpenMP on Linux and macOS, setting the number of
threads is now thread-local, i.e. won't impact OpenBLAS thread pool size in
other Python threads. On Windows behavior is likely process-wide, but this may
depend on how OpenBLAS was compiled with OpenMP.
<a href="">joblib/threadpoolctl#228</a></p>
</li>
<li>
<p>Fix OpenBLAS detection for conda package on Windows
<a href="">joblib/threadpoolctl#240</a></p>
</li>
<li>
<p>Fixed a deadlock on Linux when using threadpoolctl from multiple threads.
<a href="">joblib/threadpoolctl#243</a></p>
<ul>
<li>Start using Python 3.14's built-in support for listing shared libraries.</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>75e1860</code></a> Release 3.7.0 (<a href="">#247</a>)</li>
<li><a href=""><code>473f239</code></a> Display debugging info in CI inspection script (<a href="">#245</a>)</li>
<li><a href=""><code>318125e</code></a> Avoid ctypes callbacks when listing libraries on Linux. (<a href="">#242</a>)</li>
<li><a href=""><code>f05893f</code></a> FIX intermittent Windows module enumeration failure (<a href="">#219</a>)</li>
<li><a href=""><code>c686683</code></a> Fix threading-related deadlocks, and also add support for Python's built-in l...</li>
<li><a href=""><code>ba03124</code></a> FIX Fix OpenBLAS detection for conda package on Windows (<a href="">#240</a>)</li>
<li><a href=""><code>9ac1881</code></a> MNT Add faulthandler to empirical observation (<a href="">#241</a>)</li>
<li><a href=""><code>1ac9590</code></a> Document using limiting APIs for Python thread pools (<a href="">#234</a>)</li>
<li><a href=""><code>bcbee28</code></a> Add missing PR to changelog</li>
<li><a href=""><code>261389f</code></a> CI Fix compilation issue with OpenMP inside conda env (<a href="">#237</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/joblib/threadpoolctl/compare/3.6.0...3.7.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b5e512b96d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** chore(deps): bump uv from 0.10.8 to 0.11.6

## Description

Bumps [uv](https://github.com/astral-sh/uv) from 0.10.8 to 0.11.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/uv/releases">uv's releases</a>.</em></p>
<blockquote>
<h2>0.11.6</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-09.</p>
<p>This release resolves a low severity security advisory in which wheels with malformed RECORD entries could delete arbitrary files on uninstall. See <a href="https://github.com/astral-sh/uv/security/advisories/GHSA-pjjw-68hj-v9mw">GHSA-pjjw-68hj-v9mw</a> for details.</p>
<h3>Bug fixes</h3>
<ul>
<li>Do not remove files outside the venv on uninstall (<a href="">#18942</a>)</li>
<li>Validate and heal wheel <code>RECORD</code> during installation (<a href="">#18943</a>)</li>
<li>Avoid <code>uv cache clean</code> errors due to Win32 path normalization (<a href="">#18856</a>)</li>
</ul>
<h2>Install uv 0.11.6</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-installer.ps1 | iex&quot;
</code></pre>
<h2>Download uv 0.11.6</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-apple-darwin.tar.gz">uv-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-apple-darwin.tar.gz">uv-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-pc-windows-msvc.zip">uv-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-pc-windows-msvc.zip">uv-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-pc-windows-msvc.zip">uv-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-unknown-linux-gnu.tar.gz">uv-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-unknown-linux-gnu.tar.gz">uv-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-powerpc64le-unknown-linux-gnu.tar.gz">uv-powerpc64le-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64LE Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-powerpc64le-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-riscv64gc-unknown-linux-gnu.tar.gz">uv-riscv64gc-unknown-linux-gnu.tar.gz</a></td>
<td>RISCV Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-riscv64gc-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-s390x-unknown-linux-gnu.tar.gz">uv-s390x-unknown-linux-gnu.tar.gz</a></td>
<td>S390x Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-s390x-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-unknown-linux-gnu.tar.gz">uv-x86_64-unknown-linux-gnu.tar.gz</a></td>
<td>x64 Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-armv7-unknown-linux-gnueabihf.tar.gz">uv-armv7-unknown-linux-gnueabihf.tar.gz</a></td>
<td>ARMv7 Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-armv7-unknown-linux-gnueabihf.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-unknown-linux-musl.tar.gz">uv-aarch64-unknown-linux-musl.tar.gz</a></td>
<td>ARM64 MUSL Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-aarch64-unknown-linux-musl.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-unknown-linux-musl.tar.gz">uv-i686-unknown-linux-musl.tar.gz</a></td>
<td>x86 MUSL Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-i686-unknown-linux-musl.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-riscv64gc-unknown-linux-musl.tar.gz">uv-riscv64gc-unknown-linux-musl.tar.gz</a></td>
<td>RISCV MUSL Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-riscv64gc-unknown-linux-musl.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-unknown-linux-musl.tar.gz">uv-x86_64-unknown-linux-musl.tar.gz</a></td>
<td>x64 MUSL Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-x86_64-unknown-linux-musl.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-arm-unknown-linux-musleabihf.tar.gz">uv-arm-unknown-linux-musleabihf.tar.gz</a></td>
<td>ARMv6 MUSL Linux (Hardfloat)</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-arm-unknown-linux-musleabihf.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-armv7-unknown-linux-musleabihf.tar.gz">uv-armv7-unknown-linux-musleabihf.tar.gz</a></td>
<td>ARMv7 MUSL Linux</td>
<td><a href="https://releases.astral.sh/github/uv/releases/download/0.11.6/uv-armv7-unknown-linux-musleabihf.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/uv/blob/main/CHANGELOG.md">uv's changelog</a>.</em></p>
<blockquote>
<h2>0.11.6</h2>
<p>Released on 2026-04-09.</p>
<p>This release resolves a low severity security advisory in which wheels with malformed RECORD entries could delete arbitrary files on uninstall. See <a href="https://github.com/astral-sh/uv/security/advisories/GHSA-pjjw-68hj-v9mw">GHSA-pjjw-68hj-v9mw</a> for details.</p>
<h3>Bug fixes</h3>
<ul>
<li>Do not remove files outside the venv on uninstall (<a href="">#18942</a>)</li>
<li>Validate and heal wheel <code>RECORD</code> during installation (<a href="">#18943</a>)</li>
<li>Avoid <code>uv cache clean</code> errors due to Win32 path normalization (<a href="">#18856</a>)</li>
</ul>
<h2>0.11.5</h2>
<p>Released on 2026-04-08.</p>
<h3>Python</h3>
<ul>
<li>Add CPython 3.13.13, 3.14.4, and 3.15.0a8 (<a href="">#18908</a>)</li>
</ul>
<h3>Enhancements</h3>
<ul>
<li>Fix <code>build_system.requires</code> error message (<a href="">#18911</a>)</li>
<li>Remove trailing path separators in path normalization (<a href="">#18915</a>)</li>
<li>Improve error messages for unsupported or invalid TLS certificates (<a href="">#18924</a>)</li>
</ul>
<h3>Preview features</h3>
<ul>
<li>Add <code>exclude-newer</code> to <code>[[tool.uv.index]]</code> (<a href="">#18839</a>)</li>
<li><code>uv audit</code>: add context/warnings for ignored vulnerabilities (<a href="">#18905</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Normalize persisted fork markers before lock equality checks (<a href="">#18612</a>)</li>
<li>Clear junction properly when uninstalling Python versions on Windows (<a href="">#18815</a>)</li>
<li>Report error cleanly instead of panicking on TLS certificate error (<a href="">#18904</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Remove the legacy <code>PIP_COMPATIBILITY.md</code> redirect file (<a href="">#18928</a>)</li>
<li>Fix <code>uv init example-bare --bare</code> examples (<a href="">#18822</a>, <a href="">#18925</a>)</li>
</ul>
<h2>0.11.4</h2>
<p>Released on 2026-04-07.</p>
<h3>Enhancements</h3>
<ul>
<li>Add support for <code>--upgrade-group</code> (<a href="">#18266</a>)</li>
<li>Merge repeated archive URL hashes by version ID (<a href="">#18841</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6595080</code></a> Bump version to 0.11.6 (<a href="">#18948</a>)</li>
<li><a href=""><code>7983c7a</code></a> Validate and heal RECORD during installation (<a href="">#18943</a>)</li>
<li><a href=""><code>b38439b</code></a> Avoid <code>uv cache clean</code> errors due to Win32 path normalization (<a href="">#18856</a>)</li>
<li><a href=""><code>a0e461a</code></a> Do not remove files outside the venv on uninstall (<a href="">#18942</a>)</li>
<li><a href=""><code>95eaa68</code></a> Bump version to 0.11.5 (<a href="">#18930</a>)</li>
<li><a href=""><code>f6d67d5</code></a> Improve certificate loading error messages (<a href="">#18924</a>)</li>
<li><a href=""><code>39b83c3</code></a> Add <code>exclude-newer</code> to <code>[[tool.uv.index]]</code> (<a href="">#18839</a>)</li>
<li><a href=""><code>7924ba5</code></a> uv audit: add context/warnings for ignored vulnerabilities (<a href="">#18905</a>)</li>
<li><a href=""><code>a352ce0</code></a> Remove the legacy PIP_COMPATIBILITY.md redirect file (<a href="">#18928</a>)</li>
<li><a href=""><code>33b6338</code></a> Normalize persisted fork markers before lock equality checks (<a href="">#18612</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/uv/compare/0.10.8...0.11.6">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93c39945a4a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Bump requests from 2.32.5 to 2.33.1

## Description

Bumps [requests](https://github.com/psf/requests) from 2.32.5 to 2.33.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.33.1</h2>
<h2>2.33.1 (2026-03-30)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed test cleanup for CVE-2026-25645 to avoid leaving unnecessary
files in the tmp directory. (<a href="">#7305</a>)</li>
<li>Fixed Content-Type header parsing for malformed values. (<a href="">#7309</a>)</li>
<li>Improved error consistency for malformed header values. (<a href="">#7308</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/ferdnyc"><code>@​ferdnyc</code></a> made their first contribution in <a href="">psf/requests#7277</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2331-2026-03-30">https://github.com/psf/requests/blob/main/HISTORY.md#2331-2026-03-30</a></p>
<h2>v2.33.0</h2>
<h2>2.33.0 (2026-03-25)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>📣 Requests is adding inline types. If you have a typed code base that uses Requests, please take a look at <a href="">#7271</a>. Give it a try, and report any gaps or feedback you may have in the issue. 📣</li>
</ul>
<p><strong>Security</strong></p>
<ul>
<li>CVE-2026-25645 <code>requests.utils.extract_zipped_paths</code> now extracts contents to a non-deterministic location to prevent malicious file replacement. This does not affect default usage of Requests, only applications calling the utility function directly.</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Migrated to a PEP 517 build system using setuptools. (<a href="">#7012</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed an issue where an empty netrc entry could cause malformed authentication to be applied to Requests on Python 3.11+. (<a href="">#7205</a>)</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Dropped support for Python 3.9 following its end of support. (<a href="">#7196</a>)</li>
</ul>
<p><strong>Documentation</strong></p>
<ul>
<li>Various typo fixes and doc improvements.</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/M0d3v1"><code>@​M0d3v1</code></a> made their first contribution in <a href="">psf/requests#6865</a></li>
<li><a href="https://github.com/aminvakil"><code>@​aminvakil</code></a> made their first contribution in <a href="">psf/requests#7220</a></li>
<li><a href="https://github.com/E8Price"><code>@​E8Price</code></a> made their first contribution in <a href="">psf/requests#6960</a></li>
<li><a href="https://github.com/mitre88"><code>@​mitre88</code></a> made their first contribution in <a href="">psf/requests#7244</a></li>
<li><a href="https://github.com/magsen"><code>@​magsen</code></a> made their first contribution in <a href="">psf/requests#6553</a></li>
<li><a href="https://github.com/Rohan5commit"><code>@​Rohan5commit</code></a> made their first contribution in <a href="">psf/requests#7227</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2330-2026-03-25">https://github.com/psf/requests/blob/main/HISTORY.md#2330-2026-03-25</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.33.1 (2026-03-30)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed test cleanup for CVE-2026-25645 to avoid leaving unnecessary
files in the tmp directory. (<a href="">#7305</a>)</li>
<li>Fixed Content-Type header parsing for malformed values. (<a href="">#7309</a>)</li>
<li>Improved error consistency for malformed header values. (<a href="">#7308</a>)</li>
</ul>
<h2>2.33.0 (2026-03-25)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>📣 Requests is adding inline types. If you have a typed code base that
uses Requests, please take a look at <a href="">#7271</a>. Give it a try, and report
any gaps or feedback you may have in the issue. 📣</li>
</ul>
<p><strong>Security</strong></p>
<ul>
<li>CVE-2026-25645 <code>requests.utils.extract_zipped_paths</code> now extracts
contents to a non-deterministic location to prevent malicious file
replacement. This does not affect default usage of Requests, only
applications calling the utility function directly.</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Migrated to a PEP 517 build system using setuptools. (<a href="">#7012</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed an issue where an empty netrc entry could cause
malformed authentication to be applied to Requests on
Python 3.11+. (<a href="">#7205</a>)</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Dropped support for Python 3.9 following its end of support. (<a href="">#7196</a>)</li>
</ul>
<p><strong>Documentation</strong></p>
<ul>
<li>Various typo fixes and doc improvements.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>111d2b7</code></a> v2.33.1</li>
<li><a href=""><code>f0198e6</code></a> Fix malformed value parsing for Content-Type (<a href="">#7309</a>)</li>
<li><a href=""><code>bc7dd0f</code></a> Fix cosmetic header validity parsing regex (<a href="">#7308</a>)</li>
<li><a href=""><code>4443b1a</code></a> Fix unintended test extra (<a href="">#7306</a>)</li>
<li><a href=""><code>389eea5</code></a> Cleanup extracted file after extract_zipped_path test (<a href="">#7305</a>)</li>
<li><a href=""><code>7407309</code></a> Packaging: DRY out extras definition (<a href="">#7277</a>)</li>
<li><a href=""><code>bc04dfd</code></a> v2.33.0</li>
<li><a href=""><code>66d21cb</code></a> Merge commit from fork</li>
<li><a href=""><code>8b9bc8f</code></a> Move badges to top of README (<a href="">#7293</a>)</li>
<li><a href=""><code>e331a28</code></a> Remove unused extraction call (<a href="">#7292</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.32.5...v2.33.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `627afd73c007`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
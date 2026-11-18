# Issue

**Title:** Bump werkzeug from 2.1.2 to 2.2.3 in /tvb_framework

## Description

Bumps [werkzeug](https://github.com/pallets/werkzeug) from 2.1.2 to 2.2.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pallets/werkzeug/releases">werkzeug's releases</a>.</em></p>
<blockquote>
<h2>2.2.3</h2>
<p>This is a fix release for the 2.2.x release branch.</p>
<ul>
<li>Changes: <a href="https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-3">https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-3</a></li>
<li>Milestone: <a href="https://github.com/pallets/werkzeug/milestone/26?closed=1">https://github.com/pallets/werkzeug/milestone/26?closed=1</a></li>
</ul>
<p>This release contains security fixes for:</p>
<ul>
<li><a href="https://github.com/pallets/werkzeug/security/advisories/GHSA-xg9f-g7g7-2323">https://github.com/pallets/werkzeug/security/advisories/GHSA-xg9f-g7g7-2323</a></li>
<li><a href="https://github.com/pallets/werkzeug/security/advisories/GHSA-px8h-6qxv-m22q">https://github.com/pallets/werkzeug/security/advisories/GHSA-px8h-6qxv-m22q</a></li>
</ul>
<h2>2.2.2</h2>
<p>This is a fix release for the <a href="https://github.com/pallets/werkzeug/releases/tag/2.2.0">2.2.0</a> feature release.</p>
<ul>
<li>Changes: <a href="https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-2">https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-2</a></li>
<li>Milestone: <a href="https://github.com/pallets/werkzeug/milestone/25?closed=1">https://github.com/pallets/werkzeug/milestone/25?closed=1</a></li>
</ul>
<h2>2.2.1</h2>
<p>This is a fix release for the <a href="https://github.com/pallets/werkzeug/releases/tag/2.2.0">2.2.0</a> feature release.</p>
<ul>
<li>Changes: <a href="https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-1">https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-1</a></li>
<li>Milestone: <a href="https://github.com/pallets/werkzeug/milestone/24?closed=1">https://github.com/pallets/werkzeug/milestone/24?closed=1</a></li>
</ul>
<h2>2.2.0</h2>
<p>This is a feature release, which includes new features and removes previously deprecated features. The 2.2.x branch is now the supported bugfix branch, the 2.1.x branch will become a tag marking the end of support for that branch. We encourage everyone to upgrade, and to use a tool such as <a href="https://pypi.org/project/pip-tools/">pip-tools</a> to pin all dependencies and control upgrades.</p>
<ul>
<li>Changes: <a href="https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-0">https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-0</a></li>
<li>Milestone: <a href="https://github.com/pallets/werkzeug/milestone/20?closed=1">https://github.com/pallets/werkzeug/milestone/20?closed=1</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pallets/werkzeug/blob/main/CHANGES.rst">werkzeug's changelog</a>.</em></p>
<blockquote>
<h2>Version 2.2.3</h2>
<p>Released 2023-02-14</p>
<ul>
<li>Ensure that URL rules using path converters will redirect with strict slashes when
the trailing slash is missing. :issue:<code>2533</code></li>
<li>Type signature for <code>get_json</code> specifies that return type is not optional when
<code>silent=False</code>. :issue:<code>2508</code></li>
<li><code>parse_content_range_header</code> returns <code>None</code> for a value like <code>bytes */-1</code>
where the length is invalid, instead of raising an <code>AssertionError</code>. :issue:<code>2531</code></li>
<li>Address remaining <code>ResourceWarning</code> related to the socket used by <code>run_simple</code>.
Remove <code>prepare_socket</code>, which now happens when creating the server. :issue:<code>2421</code></li>
<li>Update pre-existing headers for <code>multipart/form-data</code> requests with the test
client. :issue:<code>2549</code></li>
<li>Fix handling of header extended parameters such that they are no longer quoted.
:issue:<code>2529</code></li>
<li><code>LimitedStream.read</code> works correctly when wrapping a stream that may not return
the requested size in one <code>read</code> call. :issue:<code>2558</code></li>
<li>A cookie header that starts with <code>=</code> is treated as an empty key and discarded,
rather than stripping the leading <code>==</code>.</li>
<li>Specify a maximum number of multipart parts, default 1000, after which a
<code>RequestEntityTooLarge</code> exception is raised on parsing. This mitigates a DoS
attack where a larger number of form/file parts would result in disproportionate
resource use.</li>
</ul>
<h2>Version 2.2.2</h2>
<p>Released 2022-08-08</p>
<ul>
<li>Fix router to restore the 2.1 <code>strict_slashes == False</code> behaviour
whereby leaf-requests match branch rules and vice
versa. :pr:<code>2489</code></li>
<li>Fix router to identify invalid rules rather than hang parsing them,
and to correctly parse <code>/</code> within converter arguments. :pr:<code>2489</code></li>
<li>Update subpackage imports in :mod:<code>werkzeug.routing</code> to use the
<code>import as</code> syntax for explicitly re-exporting public attributes.
:pr:<code>2493</code></li>
<li>Parsing of some invalid header characters is more robust. :pr:<code>2494</code></li>
<li>When starting the development server, a warning not to use it in a
production deployment is always shown. :issue:<code>2480</code></li>
<li><code>LocalProxy.__wrapped__</code> is always set to the wrapped object when
the proxy is unbound, fixing an issue in doctest that would cause it
to fail. :issue:<code>2485</code></li>
<li>Address one <code>ResourceWarning</code> related to the socket used by
<code>run_simple</code>. :issue:<code>2421</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>22a254f</code></a> release version 2.2.3</li>
<li><a href=""><code>517cac5</code></a> Merge pull request from GHSA-xg9f-g7g7-2323</li>
<li><a href=""><code>babc8d9</code></a> rewrite docs about request data limits</li>
<li><a href=""><code>09449ee</code></a> clean up docs</li>
<li><a href=""><code>fe899d0</code></a> limit the maximum number of multipart form parts</li>
<li><a href=""><code>cf275f4</code></a> Merge pull request from GHSA-px8h-6qxv-m22q</li>
<li><a href=""><code>8c2b4b8</code></a> don't strip leading = when parsing cookie</li>
<li><a href=""><code>7c7ce5c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="https://github-redirect.dependabot.com/pallets/werkzeug/issues/2585">#2585</a>)</li>
<li><a href=""><code>19ae03e</code></a> [pre-commit.ci] auto fixes from pre-commit.com hooks</li>
<li><a href=""><code>a83d3b8</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li>Additional commits viewable in <a href="https://github.com/pallets/werkzeug/compare/2.1.2...2.2.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=werkzeug&package-manager=pip&previous-version=2.1.2&new-version=2.2.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/the-virtual-brain/tvb-root/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18bc6ca49105`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
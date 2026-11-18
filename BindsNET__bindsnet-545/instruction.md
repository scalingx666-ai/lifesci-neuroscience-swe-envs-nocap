# Issue

**Title:** Bump jupyter-server from 1.13.5 to 1.15.4

## Description

Bumps [jupyter-server](https://github.com/jupyter/jupyter_server) from 1.13.5 to 1.15.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter/jupyter_server/releases">jupyter-server's releases</a>.</em></p>
<blockquote>
<h2>v1.15.3</h2>
<h2>1.15.3</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.2...461b55146888b58a84c6cfc70c9bbfdb3e8d6aba">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Fix server-extension paths (3rd time's the charm) <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/734">#734</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Revert &quot;Server extension paths (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/730">#730</a>)&quot; <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/732">#732</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Avoid usage of ipython_genutils <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/718">#718</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2022-03-14&amp;to=2022-03-14&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ablink1073+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​blink1073</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acodecov-commenter+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​codecov-commenter</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​minrk</code></a></p>
<h2>v1.15.2</h2>
<h2>1.15.2</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.1...9711822e157bd2ff2d4f8abe4c12a013223230e0">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Server extension paths <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/730">#730</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>allow handlers to work without an authorizer in the Tornado settings <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/717">#717</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Skip nbclassic downstream tests for now <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/725">#725</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2022-03-14&amp;to=2022-03-14&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ablink1073+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​blink1073</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​minrk</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AZsailer+updated%3A2022-03-14..2022-03-14&amp;type=Issues"><code>@​Zsailer</code></a></p>
<h2>v1.15.1</h2>
<h2>1.15.1</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.0...262cb46b95de2443c8552d80d6adade6bde5734b">Full Changelog</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/blob/main/CHANGELOG.md">jupyter-server's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<p>All notable changes to this project will be documented in this file.</p>
<!-- raw HTML omitted -->
<h2>1.15.6</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.5...7fbaa767c71302cc756bdf1fb11fcbf1b3768dcc">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Missing warning when no authorizer in found ZMQ handlers <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/744">#744</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>More CI Cleanup <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/742">#742</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
<li>Clean up downstream tests <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/741">#741</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2022-03-16&amp;to=2022-03-16&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ablink1073+updated%3A2022-03-16..2022-03-16&amp;type=Issues"><code>@​blink1073</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acodecov-commenter+updated%3A2022-03-16..2022-03-16&amp;type=Issues"><code>@​codecov-commenter</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AZsailer+updated%3A2022-03-16..2022-03-16&amp;type=Issues"><code>@​Zsailer</code></a></p>
<!-- raw HTML omitted -->
<h2>1.15.5</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.4...67f6140ebca60bfde0fb068f10b428320c6c67cd">Full Changelog</a>)</p>
<h3>Bugs fixed</h3>
<ul>
<li>Relax type checking on ExtensionApp.serverapp <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/739">#739</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>raise no-authorization warning once and allow disabled authorization <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/738">#738</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix sdist test <a href="https://github-redirect.dependabot.com/jupyter-server/jupyter_server/pull/736">#736</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2022-03-15&amp;to=2022-03-16&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Ablink1073+updated%3A2022-03-15..2022-03-16&amp;type=Issues"><code>@​blink1073</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acodecov-commenter+updated%3A2022-03-15..2022-03-16&amp;type=Issues"><code>@​codecov-commenter</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2022-03-15..2022-03-16&amp;type=Issues"><code>@​minrk</code></a> | <a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AZsailer+updated%3A2022-03-15..2022-03-16&amp;type=Issues"><code>@​Zsailer</code></a></p>
<h2>1.15.3</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v1.15.2...461b55146888b58a84c6cfc70c9bbfdb3e8d6aba">Full Changelog</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>427ce75</code></a> Bump to 1.15.4</li>
<li><a href=""><code>a5683ac</code></a> Merge pull request from GHSA-p737-p57g-4cpr</li>
<li><a href=""><code>e4a3141</code></a> Publish 1.15.3</li>
<li><a href=""><code>a4542cf</code></a> Automated Changelog Entry for 1.15.3 on main (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/735">#735</a>)</li>
<li><a href=""><code>461b551</code></a> Fix server-extension paths (3rd time's the charm) (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/734">#734</a>)</li>
<li><a href=""><code>93b1c83</code></a> Revert &quot;Server extension paths (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/730">#730</a>)&quot; (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/732">#732</a>)</li>
<li><a href=""><code>0fd5c7b</code></a> Avoid usage of ipython_genutils (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/718">#718</a>)</li>
<li><a href=""><code>f4d131b</code></a> Publish 1.15.2</li>
<li><a href=""><code>5b83bd7</code></a> Automated Changelog Entry for 1.15.2 on main (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/731">#731</a>)</li>
<li><a href=""><code>9711822</code></a> Server extension paths (<a href="https://github-redirect.dependabot.com/jupyter/jupyter_server/issues/730">#730</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter/jupyter_server/compare/v1.13.5...v1.15.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jupyter-server&package-manager=pip&previous-version=1.13.5&new-version=1.15.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `177a56a49d57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
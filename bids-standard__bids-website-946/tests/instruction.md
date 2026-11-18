# Issue

**Title:** Bump tmp and all-contributors-cli

## Description

Removes [tmp](https://github.com/raszi/node-tmp). It's no longer used after updating ancestor dependency [all-contributors-cli](https://github.com/all-contributors/cli). These dependencies need to be updated together.

Removes `tmp`

Updates `all-contributors-cli` from 6.26.1 to 7.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/all-contributors/cli/releases">all-contributors-cli's releases</a>.</em></p>
<blockquote>
<h2>v7.0.0</h2>
<h2><a href="https://github.com/all-contributors/cli/compare/v6.26.1...v7.0.0">7.0.0</a> (2026-10-23)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>migrate from CJS to ESM (<a href="">#456</a>)</li>
</ul>
<h3>🔥 Bug Fixes</h3>
<ul>
<li>add provenance back (<a href="">#489</a>) (<a href="">fc75f67</a>)</li>
<li>add tag for pre release (<a href="https://github.com/next"><code>@​next</code></a>) vs release (<a href="https://github.com/latest"><code>@​latest</code></a>) (<a href="">#491</a>) (<a href="">c40b5de</a>)</li>
<li>avoid crash when contributors tag is at the start of a file (<a href="">#521</a>) (<a href="">34d63ca</a>)</li>
<li>bump node version for trusted publishing support and add tag for prerelease (<a href="">c40b5de</a>)</li>
<li>correct broken emoji-key docs link (404) in generated content (<a href="">#538</a>) (<a href="">ae71e96</a>)</li>
<li>dash not a dot after package version (<a href="">#488</a>) (<a href="">b526eb2</a>)</li>
<li>don't crash generate when a contributor's avatar_url is not an absolute URL (<a href="">#572</a>) (<a href="">0b2f461</a>)</li>
<li>don't re-add removed markdownlint comments to generated lists (<a href="">#541</a>) (<a href="">d3c1239</a>)</li>
<li>Fixing issues with commands introduced in <a href="">#403</a> (<a href="">#440</a>) (<a href="">797e167</a>)</li>
<li>Ignore linting of .all-contributorsrc file and the CHANGELOG file (<a href="">#484</a>) (<a href="">5354e88</a>)</li>
<li>Incorrectly formatted Github urls (<a href="">#466</a>) (<a href="">846582b</a>)</li>
<li>release candidate try 2 (<a href="">#487</a>) (<a href="">1a271b2</a>)</li>
<li>release please settings for tag format (<a href="">#479</a>) (<a href="">58378f3</a>)</li>
<li>release please token name wrong (<a href="">#450</a>) (<a href="">d0786d1</a>)</li>
<li>sort contributors alphabetically case-insensitively with login fallback (<a href="">#531</a>) (<a href="">88b1207</a>)</li>
<li>Update NPM and also node to ensure trusted publishing works (<a href="">#490</a>) (<a href="">06f824c</a>)</li>
<li>wrong repo url to fix provenance error (<a href="">#492</a>) (<a href="">e7eedb5</a>)</li>
</ul>
<h3>📚 Documentation</h3>
<ul>
<li>add brandonlenz as a contributor for bug, and code (<a href="">#512</a>) (<a href="">db116e9</a>)</li>
<li>add davepagurek as a contributor for bug (<a href="">#410</a>) (<a href="">a35bf7b</a>)</li>
<li>add davidpavlovschi as a contributor for code (<a href="">#525</a>) (<a href="">9528c6d</a>)</li>
<li>add jdalrymple as a contributor for review (<a href="">#574</a>) (<a href="">4f942bd</a>)</li>
<li>add jdalrymple as a contributor for security, and bug (<a href="">#381</a>) (<a href="">86631e5</a>)</li>
<li>add JimMadge as a contributor for code, and review (<a href="">#463</a>) (<a href="">741aff8</a>)</li>
<li>add JoshuaKGoldberg as a contributor for ideas, and code (<a href="">#357</a>) (<a href="">74bc388</a>)</li>
<li>add KibbeWater as a contributor for code, and bug (<a href="">#467</a>) (<a href="">eca20df</a>)</li>
<li>add lwasser as a contributor for doc (<a href="">#380</a>) (<a href="">36cbc0d</a>)</li>
<li>add lwasser as a contributor for security (<a href="">#384</a>) (<a href="">05ba5a8</a>)</li>
<li>add marcelpanse as a contributor for security (<a href="">#379</a>) (<a href="">29d8d1d</a>)</li>
<li>add MBK-fr as a contributor for doc, bug, and code (<a href="">#576</a>) (<a href="">0c1c44e</a>)</li>
<li>add michaelfaith as a contributor for bug, review, and code (<a href="">#480</a>) (<a href="">349a7f2</a>)</li>
<li>add VincentBorgers as a contributor for code, and bug (<a href="">#573</a>) (<a href="">08057ee</a>)</li>
<li>add vjymisal0 as a contributor for code (<a href="">#577</a>) (<a href="">f04f6c0</a>)</li>
<li><strong>Readme:</strong> Fix broken link to cli docs on allcontributors.org (<a href="">#511</a>) (<a href="">62dd0dd</a>)</li>
</ul>
<h3>⚙️ Chores</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/all-contributors/cli/blob/main/CHANGELOG.md">all-contributors-cli's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/all-contributors/cli/compare/v6.26.1...v7.0.0">7.0.0</a> (2026-10-23)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>migrate from CJS to ESM (<a href="">#456</a>)</li>
</ul>
<h3>🔥 Bug Fixes</h3>
<ul>
<li>add provenance back (<a href="">#489</a>) (<a href="">fc75f67</a>)</li>
<li>add tag for pre release (<a href="https://github.com/next"><code>@​next</code></a>) vs release (<a href="https://github.com/latest"><code>@​latest</code></a>) (<a href="">#491</a>) (<a href="">c40b5de</a>)</li>
<li>avoid crash when contributors tag is at the start of a file (<a href="">#521</a>) (<a href="">34d63ca</a>)</li>
<li>bump node version for trusted publishing support and add tag for prerelease (<a href="">c40b5de</a>)</li>
<li>correct broken emoji-key docs link (404) in generated content (<a href="">#538</a>) (<a href="">ae71e96</a>)</li>
<li>dash not a dot after package version (<a href="">#488</a>) (<a href="">b526eb2</a>)</li>
<li>don't crash generate when a contributor's avatar_url is not an absolute URL (<a href="">#572</a>) (<a href="">0b2f461</a>)</li>
<li>don't re-add removed markdownlint comments to generated lists (<a href="">#541</a>) (<a href="">d3c1239</a>)</li>
<li>Fixing issues with commands introduced in <a href="">#403</a> (<a href="">#440</a>) (<a href="">797e167</a>)</li>
<li>Ignore linting of .all-contributorsrc file and the CHANGELOG file (<a href="">#484</a>) (<a href="">5354e88</a>)</li>
<li>Incorrectly formatted Github urls (<a href="">#466</a>) (<a href="">846582b</a>)</li>
<li>release candidate try 2 (<a href="">#487</a>) (<a href="">1a271b2</a>)</li>
<li>release please settings for tag format (<a href="">#479</a>) (<a href="">58378f3</a>)</li>
<li>release please token name wrong (<a href="">#450</a>) (<a href="">d0786d1</a>)</li>
<li>sort contributors alphabetically case-insensitively with login fallback (<a href="">#531</a>) (<a href="">88b1207</a>)</li>
<li>Update NPM and also node to ensure trusted publishing works (<a href="">#490</a>) (<a href="">06f824c</a>)</li>
<li>wrong repo url to fix provenance error (<a href="">#492</a>) (<a href="">e7eedb5</a>)</li>
</ul>
<h3>📚 Documentation</h3>
<ul>
<li>add brandonlenz as a contributor for bug, and code (<a href="">#512</a>) (<a href="">db116e9</a>)</li>
<li>add davepagurek as a contributor for bug (<a href="">#410</a>) (<a href="">a35bf7b</a>)</li>
<li>add davidpavlovschi as a contributor for code (<a href="">#525</a>) (<a href="">9528c6d</a>)</li>
<li>add jdalrymple as a contributor for review (<a href="">#574</a>) (<a href="">4f942bd</a>)</li>
<li>add jdalrymple as a contributor for security, and bug (<a href="">#381</a>) (<a href="">86631e5</a>)</li>
<li>add JimMadge as a contributor for code, and review (<a href="">#463</a>) (<a href="">741aff8</a>)</li>
<li>add JoshuaKGoldberg as a contributor for ideas, and code (<a href="">#357</a>) (<a href="">74bc388</a>)</li>
<li>add KibbeWater as a contributor for code, and bug (<a href="">#467</a>) (<a href="">eca20df</a>)</li>
<li>add lwasser as a contributor for doc (<a href="">#380</a>) (<a href="">36cbc0d</a>)</li>
<li>add lwasser as a contributor for security (<a href="">#384</a>) (<a href="">05ba5a8</a>)</li>
<li>add marcelpanse as a contributor for security (<a href="">#379</a>) (<a href="">29d8d1d</a>)</li>
<li>add MBK-fr as a contributor for doc, bug, and code (<a href="">#576</a>) (<a href="">0c1c44e</a>)</li>
<li>add michaelfaith as a contributor for bug, review, and code (<a href="">#480</a>) (<a href="">349a7f2</a>)</li>
<li>add VincentBorgers as a contributor for code, and bug (<a href="">#573</a>) (<a href="">08057ee</a>)</li>
<li>add vjymisal0 as a contributor for code (<a href="">#577</a>) (<a href="">f04f6c0</a>)</li>
<li><strong>Readme:</strong> Fix broken link to cli docs on allcontributors.org (<a href="">#511</a>) (<a href="">62dd0dd</a>)</li>
</ul>
<h3>⚙️ Chores</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ccb5085</code></a> chore(release): release 7.0.0 (<a href="">#583</a>)</li>
<li><a href=""><code>25f2f70</code></a> chore: force release version (<a href="">#582</a>)</li>
<li><a href=""><code>d6cc496</code></a> chore(deps-dev): bump vite from 8.3.1 to 8.3.5 (<a href="">#579</a>)</li>
<li><a href=""><code>f04f6c0</code></a> docs: add vjymisal0 as a contributor for code (<a href="">#577</a>)</li>
<li><a href=""><code>88b1207</code></a> fix: sort contributors alphabetically case-insensitively with login fallback ...</li>
<li><a href=""><code>d3c1239</code></a> fix: don't re-add removed markdownlint comments to generated lists (<a href="">#541</a>)</li>
<li><a href=""><code>0c1c44e</code></a> docs: add MBK-fr as a contributor for doc, bug, and code (<a href="">#576</a>)</li>
<li><a href=""><code>ae71e96</code></a> fix: correct broken emoji-key docs link (404) in generated content (<a href="">#538</a>)</li>
<li><a href=""><code>4f942bd</code></a> docs: add jdalrymple as a contributor for review (<a href="">#574</a>)</li>
<li><a href=""><code>08057ee</code></a> docs: add VincentBorgers as a contributor for code, and bug (<a href="">#573</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/all-contributors/cli/compare/v6.26.1...v7.0.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for all-contributors-cli since your current version.</p>
</details>
<details>
<summary>Install script changes</summary>
<p>This version adds <code>prepare</code> script that runs during installation. Review the package contents before updating.</p>
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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--946.org.readthedocs.build/en/946/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `966749bf9cd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
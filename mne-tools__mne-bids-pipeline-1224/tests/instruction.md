# Issue

**Title:** [dependabot]: Bump nbconvert from 7.17.0 to 7.17.1

## Description

Bumps [nbconvert](https://github.com/jupyter/nbconvert) from 7.17.0 to 7.17.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter/nbconvert/releases">nbconvert's releases</a>.</em></p>
<blockquote>
<h2>v7.17.1</h2>
<h2>7.17.1</h2>
<p>This is a security release, fixing two CVEs:</p>
<ul>
<li><a href="https://github.com/jupyter/nbconvert/security/advisories/GHSA-4c99-qj7h-p3vg">CVE-2026-39377</a></li>
<li><a href="https://github.com/jupyter/nbconvert/security/advisories/GHSA-7jqv-fw35-gmx9">CVE-2026-39378</a></li>
</ul>
<p>(full advisories will be published seven days after release, on 2026-04-14).</p>
<p>(<a href="https://github.com/jupyter/nbconvert/compare/v7.17.0...b3b6ec01f872e9af8fd1769eb9cf1889c720ecf3">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Allow configureable WebPDF JavaScript processing timeout <a href="">#2250</a> (<a href="https://github.com/timkpaine"><code>@​timkpaine</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Fix <code>PermissionError</code> when checking template paths on shared filesystems <a href="">#2252</a> (<a href="https://github.com/ctcjab"><code>@​ctcjab</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Tweak webpdf template logic to fix duplicate extension problem <a href="">#2249</a> (<a href="https://github.com/timkpaine"><code>@​timkpaine</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>specify python version for pre <a href="">#2276</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter/nbconvert/graphs/contributors?from=2026-01-29&amp;to=2026-04-08&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/akhmerov"><code>@​akhmerov</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aakhmerov+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Abollwyvl+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ACarreau+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/ctcjab"><code>@​ctcjab</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Actcjab+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/davidbrochart"><code>@​davidbrochart</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Adavidbrochart+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/Ken-B"><code>@​Ken-B</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AKen-B+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Akrassowski+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/mgeier"><code>@​mgeier</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amgeier+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aminrk+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/mpacer"><code>@​mpacer</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ampacer+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/MSeal"><code>@​MSeal</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AMSeal+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/SylvainCorlay"><code>@​SylvainCorlay</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ASylvainCorlay+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/takluyver"><code>@​takluyver</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Atakluyver+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/timkpaine"><code>@​timkpaine</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Atimkpaine+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>)</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter/nbconvert/blob/main/CHANGELOG.md">nbconvert's changelog</a>.</em></p>
<blockquote>
<h2>7.17.1</h2>
<p>This is a security release, fixing two CVEs:</p>
<ul>
<li><a href="https://github.com/jupyter/nbconvert/security/advisories/GHSA-4c99-qj7h-p3vg">CVE-2026-39377</a></li>
<li><a href="https://github.com/jupyter/nbconvert/security/advisories/GHSA-7jqv-fw35-gmx9">CVE-2026-39378</a></li>
</ul>
<p>(full advisories will be published seven days after release, on 2026-04-14).</p>
<p>(<a href="https://github.com/jupyter/nbconvert/compare/v7.17.0...b3b6ec01f872e9af8fd1769eb9cf1889c720ecf3">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Allow configureable WebPDF JavaScript processing timeout <a href="">#2250</a> (<a href="https://github.com/timkpaine"><code>@​timkpaine</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Fix <code>PermissionError</code> when checking template paths on shared filesystems <a href="">#2252</a> (<a href="https://github.com/ctcjab"><code>@​ctcjab</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Tweak webpdf template logic to fix duplicate extension problem <a href="">#2249</a> (<a href="https://github.com/timkpaine"><code>@​timkpaine</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>specify python version for pre <a href="">#2276</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter/nbconvert/graphs/contributors?from=2026-01-29&amp;to=2026-04-08&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/akhmerov"><code>@​akhmerov</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aakhmerov+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Abollwyvl+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ACarreau+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/ctcjab"><code>@​ctcjab</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Actcjab+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/davidbrochart"><code>@​davidbrochart</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Adavidbrochart+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/Ken-B"><code>@​Ken-B</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AKen-B+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Akrassowski+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/mgeier"><code>@​mgeier</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amgeier+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aminrk+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/mpacer"><code>@​mpacer</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ampacer+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/MSeal"><code>@​MSeal</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AMSeal+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/SylvainCorlay"><code>@​SylvainCorlay</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ASylvainCorlay+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/takluyver"><code>@​takluyver</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Atakluyver+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>) | <a href="https://github.com/timkpaine"><code>@​timkpaine</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Atimkpaine+updated%3A2026-01-29..2026-04-08&amp;type=Issues">activity</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>78ed308</code></a> Publish 7.17.1</li>
<li><a href=""><code>f090a64</code></a> ruff format</li>
<li><a href=""><code>b3b6ec0</code></a> chore: update pre-commit hooks (<a href="">#2277</a>)</li>
<li><a href=""><code>be4841f</code></a> ignore silly security lint in tests</li>
<li><a href=""><code>26d57b2</code></a> fix type annotation on Lexer</li>
<li><a href=""><code>0e6b8cc</code></a> Merge commit from fork</li>
<li><a href=""><code>ba5e5cd</code></a> Merge commit from fork</li>
<li><a href=""><code>1db0c88</code></a> Specify python version for pre (<a href="">#2276</a>)</li>
<li><a href=""><code>7473fc3</code></a> chore: update pre-commit hooks (<a href="">#2242</a>)</li>
<li><a href=""><code>4322f7f</code></a> Bump the actions group across 1 directory with 2 updates (<a href="">#2273</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter/nbconvert/compare/v7.17.0...v7.17.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=nbconvert&package-manager=uv&previous-version=7.17.0&new-version=7.17.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab27777abf79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
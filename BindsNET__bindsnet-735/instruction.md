# Issue

**Title:** Bump nbconvert from 7.16.6 to 7.17.0

## Description

Bumps [nbconvert](https://github.com/jupyter/nbconvert) from 7.16.6 to 7.17.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter/nbconvert/releases">nbconvert's releases</a>.</em></p>
<blockquote>
<h2>v7.17.0</h2>
<h2>7.17.0</h2>
<p>(<a href="https://github.com/jupyter/nbconvert/compare/v7.16.6...c9ac1d1040459ed1ff9eb34e9918ce5a87cf9d71">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Add support for arbitrary browser arguments <a href="">#2227</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Fix QtPNGExporter returning empty bytes on macOS <a href="">#2264</a> (<a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/QuLogic"><code>@​QuLogic</code></a>)</li>
<li>Fix CVE-2025-53000: Secure Inkscape Windows path (registry first + block CWD) <a href="">#2261</a> (<a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/mberlanda"><code>@​mberlanda</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/salmankadaya"><code>@​salmankadaya</code></a>, <a href="https://github.com/th3gowtham"><code>@​th3gowtham</code></a>)</li>
<li>Fix get_export_names and get_exporter default args <a href="">#2228</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>PyPA-Compliant Summary <a href="">#2226</a> (<a href="https://github.com/hackowitz-af"><code>@​hackowitz-af</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>avoid cov environment on free-threaded Pythons <a href="">#2267</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>update pre-commit, and fix all issues. <a href="">#2238</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Drop test on 3.9, test on 3.13, 3.14, 3.14t <a href="">#2237</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Bump the actions group across 1 directory with 2 updates <a href="">#2231</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Replace <code>@flaky.flaky</code> decorate with pytest marker <a href="">#2229</a> (<a href="https://github.com/mgorny"><code>@​mgorny</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>update to mermaid 11.10.0 <a href="">#2224</a> (<a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Drop support for Python 3.8, fix the CI tests <a href="">#2221</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Use <code>intersphinx_registry</code> <a href="">#2232</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter/nbconvert/graphs/contributors?from=2025-01-28&amp;to=2026-01-29&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Abollwyvl+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ACarreau+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ah3pdesign+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/hackowitz-af"><code>@​hackowitz-af</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ahackowitz-af+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Akrassowski+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/mberlanda"><code>@​mberlanda</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amberlanda+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/mgorny"><code>@​mgorny</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amgorny+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aminrk+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/MSeal"><code>@​MSeal</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AMSeal+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/QuLogic"><code>@​QuLogic</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AQuLogic+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/salmankadaya"><code>@​salmankadaya</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Asalmankadaya+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/shreve"><code>@​shreve</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ashreve+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/th3gowtham"><code>@​th3gowtham</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ath3gowtham+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>)</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter/nbconvert/blob/main/CHANGELOG.md">nbconvert's changelog</a>.</em></p>
<blockquote>
<h2>7.17.0</h2>
<p>(<a href="https://github.com/jupyter/nbconvert/compare/v7.16.6...c9ac1d1040459ed1ff9eb34e9918ce5a87cf9d71">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Add support for arbitrary browser arguments <a href="">#2227</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Fix QtPNGExporter returning empty bytes on macOS <a href="">#2264</a> (<a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/QuLogic"><code>@​QuLogic</code></a>)</li>
<li>Fix CVE-2025-53000: Secure Inkscape Windows path (registry first + block CWD) <a href="">#2261</a> (<a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/mberlanda"><code>@​mberlanda</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/salmankadaya"><code>@​salmankadaya</code></a>, <a href="https://github.com/th3gowtham"><code>@​th3gowtham</code></a>)</li>
<li>Fix get_export_names and get_exporter default args <a href="">#2228</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>PyPA-Compliant Summary <a href="">#2226</a> (<a href="https://github.com/hackowitz-af"><code>@​hackowitz-af</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>avoid cov environment on free-threaded Pythons <a href="">#2267</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>update pre-commit, and fix all issues. <a href="">#2238</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Drop test on 3.9, test on 3.13, 3.14, 3.14t <a href="">#2237</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Bump the actions group across 1 directory with 2 updates <a href="">#2231</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Replace <code>@flaky.flaky</code> decorate with pytest marker <a href="">#2229</a> (<a href="https://github.com/mgorny"><code>@​mgorny</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>update to mermaid 11.10.0 <a href="">#2224</a> (<a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Drop support for Python 3.8, fix the CI tests <a href="">#2221</a> (<a href="https://github.com/shreve"><code>@​shreve</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Use <code>intersphinx_registry</code> <a href="">#2232</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter/nbconvert/graphs/contributors?from=2025-01-28&amp;to=2026-01-29&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Abollwyvl+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3ACarreau+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/h3pdesign"><code>@​h3pdesign</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ah3pdesign+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/hackowitz-af"><code>@​hackowitz-af</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ahackowitz-af+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Akrassowski+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/mberlanda"><code>@​mberlanda</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amberlanda+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/mgorny"><code>@​mgorny</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Amgorny+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Aminrk+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/MSeal"><code>@​MSeal</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AMSeal+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/QuLogic"><code>@​QuLogic</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3AQuLogic+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/salmankadaya"><code>@​salmankadaya</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Asalmankadaya+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/shreve"><code>@​shreve</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ashreve+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>) | <a href="https://github.com/th3gowtham"><code>@​th3gowtham</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter%2Fnbconvert+involves%3Ath3gowtham+updated%3A2025-01-28..2026-01-29&amp;type=Issues">activity</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>21b35d8</code></a> Publish 7.17.0</li>
<li><a href=""><code>c9ac1d1</code></a> Fix CVE-2025-53000: Secure Inkscape Windows path (registry first + block CWD)...</li>
<li><a href=""><code>b13276d</code></a> avoid cov environment on free-threaded Pythons (<a href="">#2267</a>)</li>
<li><a href=""><code>7c7055f</code></a> [pre-commit.ci] auto fixes from pre-commit.com hooks</li>
<li><a href=""><code>74f3ddd</code></a> Fix QtPNGExporter returning empty bytes on macOS</li>
<li><a href=""><code>216550b</code></a> fix links</li>
<li><a href=""><code>39777ac</code></a> try to comment fialing test</li>
<li><a href=""><code>7b591ca</code></a> ruff-check</li>
<li><a href=""><code>6ec7638</code></a> parent</li>
<li><a href=""><code>59414b3</code></a> fix mypy</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter/nbconvert/compare/v7.16.6...v7.17.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=nbconvert&package-manager=pip&previous-version=7.16.6&new-version=7.17.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `027689d5b008`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
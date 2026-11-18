# Issue

**Title:** Bump geopy from 2.4.1 to 2.5.0

## Description

Bumps [geopy](https://github.com/geopy/geopy) from 2.4.1 to 2.5.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/geopy/geopy/releases">geopy's releases</a>.</em></p>
<blockquote>
<h2>2.5.0</h2>
<h2>Security Advisory</h2>
<p>GitHub Security advisory: GHSA-mhvh-fq92-pfmr.</p>
<p>Regular Expression Denial of Service (ReDoS) in <code>geopy.Point</code>:
<code>geopy.Point.from_string</code> may take excessive CPU time when parsing long,
malformed coordinate strings due to inefficient regular-expression behavior.</p>
<p>The numeric <code>geopy.Point</code> constructor is not affected.</p>
<p>Geocoders' <code>reverse</code> methods called with string inputs exercise the vulnerable path.</p>
<p>Reported by Younghun Lee in <a href="">#608</a>,
fix contributed by Apoorv Darshan in <a href="">#610</a>.</p>
<p>The fix rejects any inputs longer than 256 chars unconditionally,
which may start falsely rejecting previously valid Point strings
with long irrelevant prefixes.</p>
<h2>Bugfixes</h2>
<ul>
<li><code>.Geocodio</code>: fix <code>GeocoderQueryError</code> being raised for empty results.</li>
<li><code>.GoogleV3</code>: fix <code>utcnow</code> deprecation warnings.</li>
</ul>
<h2>Packaging Changes</h2>
<ul>
<li>Drop support for Python 3.7.</li>
<li>Add support for Python 3.13, 3.14, and 3.15.</li>
<li>Migrate build metadata from <code>setup.py</code> to <code>setup.cfg</code>.
Remove <code>download_url</code> from the metadata.
Contributed by Mike Taves. <a href="">#535</a></li>
<li>Replace <code>distutils</code> with <code>packaging</code> in tests (fixes Python 3.12+).</li>
</ul>
<h2>Code Improvements</h2>
<ul>
<li>Remove Python 2 relics.
Contributed by Miroslav Šedivý. <a href="">#552</a></li>
</ul>
<h2>Test Improvements</h2>
<ul>
<li>Fix applying pytest marks to fixtures (pytest &gt;= 9.1 compatibility).
Contributed by Tomáš Hrnčiar. <a href="">#609</a></li>
<li>Fix unclosed event loop warning in tests.</li>
<li>Fix pytest classmethod warning.</li>
<li><code>.Nominatim</code>: fix <code>test_reverse_near_zero</code> which was failing due to
locale-specific response formatting.
Contributed by Alfredo Tupone. <a href="">#606</a></li>
</ul>
<h2>Docs Improvements</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/geopy/geopy/blob/master/docs/changelog_2xx.rst">geopy's changelog</a>.</em></p>
<blockquote>
<h2>2.5.0</h2>
<p>2026-07-12</p>
<p>Security Advisory</p>
<pre><code>
GitHub Security advisory: :ghsa:`mhvh-fq92-pfmr`.
<p>Regular Expression Denial of Service (ReDoS) in :class:<code>.Point</code>:<br />
:meth:<code>.Point.from_string</code> may take excessive CPU time when parsing long,<br />
malformed coordinate strings due to inefficient regular-expression behavior.</p>
<p>The numeric :class:<code>.Point</code> constructor is not affected.</p>
<p>Geocoders' <code>reverse</code> methods called with string inputs exercise the vulnerable path.</p>
<p>Reported by Younghun Lee in :issue:<code>608</code>,<br />
fix contributed by Apoorv Darshan in :issue:<code>610</code>.</p>
<p>The fix rejects any inputs longer than 256 chars unconditionally,<br />
which may start falsely rejecting previously valid Point strings<br />
with long irrelevant prefixes.</p>
<p>Bugfixes</p>
<pre><code>
- :class:`.Geocodio`: fix ``GeocoderQueryError`` being raised for empty results.
- :class:`.GoogleV3`: fix ``utcnow`` deprecation warnings.

Packaging Changes
&lt;/code&gt;&lt;/pre&gt;
&lt;ul&gt;
&lt;li&gt;Drop support for Python 3.7.&lt;/li&gt;
&lt;li&gt;Add support for Python 3.13, 3.14, and 3.15.&lt;/li&gt;
&lt;li&gt;Migrate build metadata from &lt;code&gt;setup.py&lt;/code&gt; to &lt;code&gt;setup.cfg&lt;/code&gt;.
Remove &lt;code&gt;download_url&lt;/code&gt; from the metadata.
Contributed by Mike Taves. (:issue:&lt;code&gt;535&lt;/code&gt;)&lt;/li&gt;
&lt;li&gt;Replace &lt;code&gt;distutils&lt;/code&gt; with &lt;code&gt;packaging&lt;/code&gt; in tests (fixes Python 3.12+).&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;Code Improvements&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
- Remove Python 2 relics.
  Contributed by Miroslav Šedivý. (:issue:`552`)

Test Improvements
&lt;/code&gt;&lt;/pre&gt;
&lt;ul&gt;
&lt;li&gt;Fix applying pytest marks to fixtures (pytest &amp;gt;= 9.1 compatibility).&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;

&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot; 2.5.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Makefile: fix make dist broken after 9af8380&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Add versionchanged&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Update changelog&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; AUTHORS: update an email per user's request&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Pull up AUTHORS&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Improve English grammar&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; tests: fix pytest error in 3.13+ caused by ce21fb7&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Geocodio: fix GeocoderQueryError being raised for empty result&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; GoogleV3: fix utcnow deprecation warnings&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/geopy/geopy/compare/2.4.1...2.5.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;

&lt;br /&gt;</code></pre>

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=geopy&package-manager=uv&previous-version=2.4.1&new-version=2.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--934.org.readthedocs.build/en/934/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `56f268572f9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
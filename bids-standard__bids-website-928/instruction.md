# Issue

**Title:** Bump pyjwt from 2.13.0 to 2.15.0

## Description

Bumps [pyjwt](https://github.com/jpadilla/pyjwt) from 2.13.0 to 2.15.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/releases">pyjwt's releases</a>.</em></p>
<blockquote>
<h2>2.15.0</h2>
<p>See the <a href="https://github.com/jpadilla/pyjwt/blob/2.15.0/CHANGELOG.rst">2.15.0 changelog</a> for complete release details.</p>
<h2>2.14.0</h2>
<p>See the <a href="https://github.com/jpadilla/pyjwt/blob/2.14.0/CHANGELOG.rst">2.14.0 changelog</a> for the complete release details and related security advisories.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jpadilla/pyjwt/blob/master/CHANGELOG.rst">pyjwt's changelog</a>.</em></p>
<blockquote>
<h2><code>v2.15.0 &lt;https://github.com/jpadilla/pyjwt/compare/2.14.0...2.15.0&gt;</code>__</h2>
<p>Security</p>
<pre><code>
- Wrap recursion errors from deeply nested JWT payloads in ``DecodeError``
  instead of exposing a raw ``RecursionError``.
<p>Added</p>
<pre><code>
- Support Python 3.15 by @kytta in ` &amp;lt;

Changed
</code></pre>
<ul>
<li><code>JWKSetCache</code> now stores the parsed <code>PyJWKSet</code> rather than the raw JWKS
payload, so a cache hit no longer re-parses every key. <code>JWKSetCache.put()</code>
accepts either form and raises <code>PyJWKSetError</code> for anything else. As a
result, <code>PyJWKClient.get_jwk_set()</code> returns the same <code>PyJWKSet</code> instance
for as long as it stays cached, rather than a freshly built one per call in
<code> &amp;lt;</code>__</li>
<li><code>PyJWKClient.fetch_data()</code> now raises
<code>PyJWKClientError(&amp;quot;The JWKS endpoint did not return a JSON object&amp;quot;)</code> when
the endpoint response is not a JSON object, instead of returning it for
<code>get_jwk_set()</code> to reject. Callers reaching the JWKS through
<code>get_jwk_set()</code> see the same error as before in
<code> &amp;lt;</code>__</li>
</ul>
<p>Fixed</p>
<pre><code>
- Return cached ``PyJWKSet`` values from ``PyJWKClient.get_jwk_set()`` instead
  of raising ``PyJWKClientError(&amp;quot;The JWKS endpoint did not return a JSON
  object&amp;quot;)``. ``JWKSetCache.put()`` documents ``PyJWKSet`` as the cached value,
  so callers pre-populating the cache to avoid a network round-trip could not
  read it back in ` &amp;lt; and
  ` &amp;lt;
- ``PyJWKClient.get_jwk_set()`` now caches the key set it returns, so a
  ``fetch_data()`` override that filters or transforms the JWKS is no longer
  undone by the next cache hit in
  ` &amp;lt;
- Raise the documented ``PyJWTError`` subclass instead of leaking a
  ``TypeError`` when the ``exp``, ``nbf``, or ``iat`` claim decodes to a
  non-numeric, non-string value such as a list, dict, or ``null``.
- Reject OKP JWK private keys when their public ``x`` component does not
  match the private ``d`` component.
- Treat malformed JWK Set members as unusable keys rather than letting
  ``AttributeError`` or ``TypeError`` escape ``PyJWKSet``. A member that is not
&amp;lt;/tr&amp;gt;&amp;lt;/table&amp;gt;
&lt;/code&gt;&lt;/pre&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;

&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot; chore: prepare 2.15.0 release&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: make recursive payload tests deterministic&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: normalize recursive JWT payload errors&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; utils: mention bytes in force_bytes type error (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; docs/conf: drop duplicate 'and' from read() docstring (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Add support for Python 3.15 (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; Catch http.client.HTTPException in PyJWKClient.fetch_data (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; fix: correct docstring typo in _validate_jti (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; docs: clarify JWK certificate member handling (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot; [pre-commit.ci] pre-commit autoupdate (&lt;a href=&quot;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/jpadilla/pyjwt/compare/2.13.0...2.15.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;

&lt;br /&gt;</code></pre>

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pyjwt&package-manager=uv&previous-version=2.13.0&new-version=2.15.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--928.org.readthedocs.build/en/928/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdccae4224a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
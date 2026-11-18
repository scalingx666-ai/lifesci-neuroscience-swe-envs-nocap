# Issue

**Title:** BF: ensure_list_from_str: drop empty items, so a multi-line url_re no longer matches every URL

## Description

A provider config whose `url_re` is written in the usual multi-line INI style matches every URL:

```ini
[provider:mysite]
url_re =
    https://mysite\.example/.*
credential = mysite
authentication_type = http_basic_auth
```

```python
>>> ps = Providers.from_config_files(['mysite.cfg'], reload=True)
>>> p = ps.get_provider('https://other.example/file', only_nondefault=True)
>>> p.name, p.url_res
('mysite', ['', 'https://mysite\\.example/.*'])
```

configparser returns that value as `"\nhttps://mysite\.example/.*"`, with a leading newline because the first line is empty. `ensure_list_from_str()` splits it into `['', 'https://...']`, and `re.match('', url)` matches any URL. So this provider, and the credential it names, gets picked for every URL rather than just `mysite.example`. Blank lines inside a value (configparser keeps them by default) have the same effect. The stock configs in `datalad/downloaders/configs/` put the first pattern on the `url_re =` line, which is why they aren't affected.

`failure_re`/`success_re` of the HTTP authenticators are read the same way, and there an empty pattern matches every response.
Changes:
- A new `ensure_regex_list()` in `datalad/downloaders/base.py` drops empty patterns (and returns `None` if nothing is left). It's used for `url_re`, `failure_re` and `success_re`. `ensure_list_from_str()` itself is unchanged, since other callers may need empty items.
- Tests: `test_providers_multiline_url_re` (the provider above is chosen for its own URLs only), which fails on `maint`, and `test_ensure_regex_list`. `test_providers.py`, `test_http.py` and `test_base.py` pass.

Found while reading the downloader code, not from a report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ec48a9eba83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
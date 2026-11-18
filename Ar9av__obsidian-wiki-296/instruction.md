# Issue

**Title:** feat(wiki-ingest): read PDF and JavaScript-rendered URLs with the firecrawl CLI when installed

## Description

Hey, I'm Juampi from the Firecrawl team.

`/ingest-url` writes a stub page when a fetch can't get usable content. In my tests, `defuddle` rejected a PDF URL (`Not an HTML page (content-type: application/pdf)`) and returned only navigation from pages that build their content with JavaScript. This adds two hosted extractors for those cases, following the CLI-hook approach of `defuddle` and the research backends from #109. The skill checks `which firecrawl` and, when the CLI is installed, uses it first for PDF URLs and once for JavaScript pages that come back blank. When it isn't installed, the same two cases go to Jina Reader (`r.jina.ai`, no install, optional `JINA_API_KEY`). Both send the URL to a hosted service, so both are skipped for private or intranet URLs. `defuddle`/`WebFetch` and the stub step stay as they are.

### Changes

- `.skills/wiki-ingest/references/url-sources.md`: Step U0.5 also checks for `firecrawl`, says when to run `firecrawl scrape "<url>" --only-main-content` with output to a temp file (first for PDF URLs, and how to spot one), asks before a long PDF, and leaves install and sign-in to the user, with a link to get a free API key. Without the CLI, it gives the Jina Reader call (`curl` to `r.jina.ai` with `X-Return-Format: markdown`, plus the `Authorization` header when `JINA_API_KEY` is set). Step U1 tries `firecrawl` once, or Jina Reader without it, on a page that comes back blank or nearly empty (only a nav or login link) or a PDF the earlier fetch couldn't read, before writing a stub.
- `.skills/wiki-ingest/SKILL.md` and `docs/architecture.md`: one line each, so the URL summaries mention both paths.
- `docs/configuration.md` and `.env.example`: `JINA_API_KEY` as an optional setting.

### How I tested it

- `python -m pytest tests/ -q`: 1217 passed, 4 skipped.
- Each extractor on three URLs (defuddle 0.19.6 via `defuddle parse <url> --markdown`, see the note below; firecrawl-cli 1.26.24; Jina Reader with no key, using the exact command from the skill):

| URL | `defuddle` | `firecrawl` | Jina Reader |
|---|---|---|---|
| quotes.toscrape.com/js/ | 43 bytes, only the Login link | 1,546 bytes, all 10 quotes | 2,851 bytes, all 10 quotes |
| jobs.ashbyhq.com/notion | `No content could be extracted` | 27,646 bytes, 147 job links | 26,238 bytes, 147 job links |
| arxiv.org/pdf/1706.03762 | `Not an HTML page (content-type: application/pdf)` | 44,686 bytes of markdown | 40,846 bytes of markdown |

  `defuddle` stays the extractor for ordinary pages. It reads HTML without running JavaScript, so these two cases need a renderer.

- End to end, I ran `/ingest-url` with this branch against fresh vaults (`obsidian-wiki setup --vault ...`):
  - quotes.toscrape.com/js/ with `defuddle` and `firecrawl` on PATH: `defuddle` returned only the Login link, the `firecrawl` try returned the quotes, and the ingest wrote a full page with all 10 quotes plus linked pages (`stub: false`).
  - The same URL with only `defuddle` on PATH: `defuddle` returned only the Login link, the Jina Reader try returned the quotes, and the ingest wrote a full `misc/` page plus 3 linked pages (`stub: false`).
  - arxiv.org/pdf/1706.03762 with only `defuddle` on PATH: Jina Reader read the PDF, and the ingest wrote the paper page plus 6 concept pages and 1 entity page (`stub: false`).

Separate from this PR: defuddle 0.19.6 rejects `defuddle <url>` with `unknown command`, and the working form is `defuddle parse <url> --markdown`. I'll send that fix as its own PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `055d720950f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
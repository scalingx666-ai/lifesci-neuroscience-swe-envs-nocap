# Issue

**Title:** fix(web): render LaTeX and recover collapsed Markdown tables

## Description

## Summary

Render inline/display LaTeX in shared Markdown views and conservatively recover model-generated GFM tables whose row breaks were collapsed.

## Related Issues

## Changes

- add `remark-math`, `rehype-katex`, and KaTeX styles for chat, step, and Markdown file preview rendering
- protect common paired currency expressions while preserving single-dollar scientific math
- normalize only strongly identified collapsed tables, respecting fenced code, inline code, escaped pipes, and complete row boundaries
- make long display equations horizontally scrollable
- add focused SSR and normalization regressions for math, tables, currency, code, and existing GFM behavior

## Type of Change

- [x] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that changes existing behavior)
- [ ] New skill (added under `packages/skills-mcp/skills/`)
- [ ] Documentation update
- [ ] Refactoring (no functional changes)
- [ ] CI/CD or build changes

## Verification

### How to test

1. Render `$E = mc^2$` and a multiline `$$...$$` expression in chat or a Markdown preview.
2. Render the collapsed table reproduction from #376 and verify it becomes a table.
3. Verify fenced/inline code remains literal and long equations scroll instead of widening the layout.

### What you personally verified

- all 409 Web tests pass, including 11 new focused regressions
- production Web TypeScript/Vite build passes
- standard GFM links, strikethrough, syntax highlighting, valid tables, escaped pipes, currency pairs, and code fences remain covered
- no browser screenshot was captured; rendering was verified through static markup tests and the production build

### Checks

- [ ] `npm run typecheck` passes
- [ ] `BP_MOCK=1 npx vitest run` passes
- [x] Web build passes (`cd packages/web && npm test && npm run build`) — if web changed
- [ ] Manually tested locally
- [ ] Screenshots / recordings attached (if UI changes)

## Checklist

- [x] This PR is AI-assisted, and I have self-reviewed the generated code (see CONTRIBUTING.md)
- [x] My code follows the project style
- [x] I have performed a self-review
- [x] I have added/updated documentation as needed
- [x] My changes do not introduce new warnings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c9d7344607e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** fix(web): render single-line $$....$$ as display math

## Description

## Summary

- remark-math only recognizes `$$...$$` blocks delimited by newlines as display math; a single-line `$$ formula $$` is parsed as inline math, where KaTeX rejects display-only commands such as `\tag{}` and renders raw TeX with red `katex-error` styling
- add `promoteSingleLineDisplayMath` to `normalizeMarkdown.ts`, promoted before rendering: a double-dollar formula that occupies a whole line is rewritten into newline-delimited display math (code fences and indentation are respected)
- add regression tests for the MarkdownMessage rendering and the normalization function

## Related Issues

- (none — no existing issue found for this rendering bug)

## Changes

- `packages/web/src/components/chat/normalizeMarkdown.ts`: add `promoteSingleLineDisplayMath`
- `packages/web/src/__tests__/MarkdownMessage.test.tsx`: regression tests

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

1. Send a chat message containing a single-line `$$ E = mc^2 \tag{1.1} $$` formula
2. Observe it rendered as centered display math with the tag, instead of red raw TeX
3. Send the same formula wrapped in newlines and in a code fence — both should be untouched

### What you personally verified

- `npm test -w @brainpilot/web` — 80 files, 658 tests passed (includes the new regression tests)
- `npm run build -w @brainpilot/web` — passed
- `npm run typecheck` — passed
- `BP_MOCK=1 npx vitest run` — 99 files, 1112 tests passed
- cherry-picked verbatim from a local branch (`git range-diff` verified identical); behavior not re-tested manually in a browser

### Checks

- [x] `npm run typecheck` passes
- [x] `BP_MOCK=1 npx vitest run` passes
- [x] Web build passes (`cd packages/web && npm test && npm run build`) — if web changed
- [ ] Manually tested locally
- [ ] Screenshots / recordings attached (if UI changes)

## Checklist

- [x] This PR is AI-assisted, and I have self-reviewed the generated code (see CONTRIBUTING.md) <!-- delete if not AI-assisted -->
- [x] My code follows the project's style
- [x] I have performed a self-review
- [x] I have added/updated documentation as needed
- [x] My changes do not introduce new warnings

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9ddc112cab9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
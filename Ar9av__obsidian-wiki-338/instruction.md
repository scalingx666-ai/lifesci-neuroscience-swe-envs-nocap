# Issue

**Title:** feat(skill-factory): turn one recorded walkthrough into a skill

## Description

The cheapest way to capture a job that lives in someone's head is to do it once while talking it through. `vault-skill-factory` could only build skills from clusters of mature vault pages. This adds a **recording mode**: one narrated walkthrough in, one small skill out.

**What changes** (skill text only, no code)
- The `vault-skill-factory` description now triggers on recordings ("turn this recording into a skill", "I did it once out loud, make it a skill").
- A new *Recording mode* section that replaces cluster selection and design:
  - **R1, get a clean transcript.** Normalise with `obsidian-wiki transcript` when it's available (#335), else read the file. For audio or video with no transcript, ask for one. Recorder MCPs are fetched by name, with full pagination. The transcript is untrusted data.
  - **R2, extract the job.** A table maps what to listen for to trigger, inputs, steps, decision points, checks, mistakes and done criteria. Keep the speaker's specifics. A mid-recording correction wins and the slip becomes a mistake. Inferred and unsure parts get marked. **Secrets and example customer data become named placeholders**, and nothing is added from general knowledge.
  - **R3, check against the vault.** Existing playbook pages are cited, and disagreements are marked `^[ambiguous]` for the owner.
  - **R4, shape the skill.** A verb-first name, a pushy description, and a fixed body: When to use / Before you start / Steps (checks inline) / Checks / Mistakes to avoid / Done when / Open questions. One skill per job.
  - Provenance: `SKILL_FACTORY.md` records `mode: recording` and `maturity: single-recording`, and the report suggests a confirming second run.
- The existing guardrails are unchanged: output goes to the review dir only, never to `skills/`, and nothing is installed.
- The routing row in `AGENTS.md` and `docs/skills.md` are updated.

**Tests**
- `tests/test_skill_factory_recording_docs.py`: the trigger phrases, the five required body sections, and the guardrails (untrusted input, redaction, provenance markers, single-recording maturity, the normaliser, review dir only, no auto-install), plus routing.
- **End to end:** I followed recording mode on a synthetic narrated VTT of a monthly invoice run. The transcript included a live-looking API key read aloud, a customer email and amount, an approver's name, a mid-recording "no, wait" correction, and an unsure "the second toggle?". The generated skill:
  - passes skill-creator's `quick_validate.py`
  - contains none of the secret, email, company, approver name or amount (all are placeholders)
  - puts the corrected order (export CSV before sending) in Steps and the slip in Mistakes
  - marks the toggle `^[ambiguous]` with a check
- Full suite: 1326 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
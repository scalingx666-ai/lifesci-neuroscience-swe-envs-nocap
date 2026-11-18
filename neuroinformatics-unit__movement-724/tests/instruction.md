# Issue

**Title:** Add community resources page

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Improving documentation

**Why is this PR needed?**

Quoting from #704:

> A public record of project materials—logos, posters, slides, recorded talks, figures, etc.—would help contributors promote the project and represent it in their own networks.

**What does this PR do?**

Adds a "Resources" page to the  "Community" section of our website, which contains:
- [x] Brand & logos: decription of our graphical assets and where to get them
- [x] ~Font~Typeface & Colours
- [x] Recent (2025) presentation, posters, and (external) blogposts.
- [x] Teaching materials (links to "Animals in Motion").

Uses SVG files for the logos instead of PNGs, so they can scale to any resolution.

The overview figure has been updated with the latest `napari` logo.

Some of the materials (logos, overview figure, poster) have been uploaded to Zenodo, and associated with the ["Neuorinformatics Unit" Community](https://zenodo.org/communities/neuroinformatics-unit/records) there. This provides permanent dois which have been linked to from the new Resources page.

## References

Related to #704.

## How has this PR been tested?

Local docs build.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

It is an update of docs.

## Checklist:

- [x] The code has been tested locally
- [ ] ~Tests have been added to cover all new functionality~
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5ab2f0aa3a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
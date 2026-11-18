# Issue

**Title:** [ENH] Allow for institutions to be listed as Authors

## Description

It is not uncommon to have datasets which are a truly an institutional effort -- from data collection planing, acquisition, curation, harmonization etc, where it is a pipeline to deliver high quality datasets.  For instance we have a number of such contributions from Allen Institute(s) in DANDI archive.  In DANDI schema we allow for both Person and Organization entries, and e.g. in https://github.com/dandisets/000020 we have

```yaml
contributor:
- affiliation:
  - identifier: https://ror.org/00dcv1019
    name: Allen Institute for Brain Science
    schemaKey: Affiliation
  email: nathang@alleninstitute.org
  identifier: 0000-0001-8429-4090
  includeInCitation: false
  name: Gouwens, Nathan
  roleName:
  - dcite:ContactPerson
  schemaKey: Person
- contactPoint: []
  identifier: https://ror.org/00dcv1019
  includeInCitation: true
  name: Allen Institute for Brain Science
  roleName: []
  schemaKey: Organization
  url: https://alleninstitute.org
```

so there is an Organization, which is actually the one to cite, although we do not list any particular roleName, and then responsible ContactPerson (who is not even listed as an Author) who could be contacted  ATM (but might be a different person later) about this dandiset.

I have tried to make wording a bit more explicit than just listing Organizations as a possible entry here, rather to keep it for large efforts.

Potential TODOs:

If we merge this, it would either
- Close #2255 as it would become impossible to tell person from an organization and thus we would not be able to impose checks.
- [ ] or in spirit of #2255 we could add (hre) recommendation to use `Last, First` form for Person and avoid ',' in  organizations!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d488b74499d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
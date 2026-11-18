# Issue

**Title:** Show admin form descriptions inline instead of in tooltips

## Description

### Summary

- Replaces tooltips and `extra` hints with always-visible descriptions under the labels in the task, task type, project and script forms. Adds `FormItemWithDescription` and `CheckboxWithDescription` helpers in `dashboard/dataset/helper_components`.
- Adds descriptions and clearer labels, e.g. "Time Limit per Task Instance" with a minutes suffix, and "Experience Requirement" as one grouped section.
- Makes the task type Team field required without a clear button, and loads editable teams with react-query.
- Narrows the project and script create/update API types to the fields the backend reads, so the forms are typed without casts.
- Updates the project and script docs to match the new wording.
- Limits the task type's Preferred Mode to the selected Allowed Modes and removes the "Any" option, which made saving fail with a 400.
- Defaults Task Instances to 1 when creating a task.
- Adds a short explanation of experience domains to the Change Experiences modal in the user list.

### Steps to test:
- Open `Task Management > Annotation Projects > Add Project`. Each field shows its description under the label. The Time Limit field shows a `minutes` suffix and a minimum of 1.
- Open `Task Management > Scripts > Add Script`. Check the descriptions and the GitHub Gist link.
- Open `Task Types > Create`. The Team select has no clear button. The Description label links to Markdown. Checkbox descriptions are shown under each option.
- Open `Tasks > Create`. Check the descriptions for Base ID, Starting Position and Rotation, Task Type, Project, Task Specification, Experience Requirement, Script and Bounding Box. The "Create new ..." buttons keep equal widths.
- In `Task Types > Create`, allow Orthogonal and Flight, prefer Flight, then remove Flight from Allowed Modes. Preferred Mode is cleared and only offers Orthogonal. Save without a Preferred Mode.
- In `Tasks > Create`, Task Instances starts at 1.
- In `Users`, select users and click `Change Experience`. The modal explains experience domains above the table.
- Create and edit a project and a script to confirm that saving still works.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54d7ca887aa9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
# Issue

**Title:** Add BciPy Report

## Description

# Overview

Add BciPy reporting functionality using [reportlab](https://docs.reportlab.com/). This PR implements extendable Report and ReportSection classes that can be used to generate a PDF report. Two report sections are tested,

- SignalReportSection (MNE ERP Plots used in offline analysis)
- SessionReportSection (Any Dict to be displayed in the report)

## Ticket

https://www.pivotaltracker.com/story/show/185944301

## Contributions

- `report.py`: Add Report, ReportSection, SignalReportSection, SessionReportSection. 

## Test

- `make test-all`
- Ran `demo_visualization.py` adding a breakpoint at the end. Importing the needed classes (`from bcipy.helpers.report import Report, SignalReport, SessionReport`) and running:
```python
    report = Report('.')
    session = {'session': 1, 'date': '2021-10-01'}
    session_text = SessionReportSection(session)
    report.add(session_text)
    sr = SignalReportSection(figure_handles)
    report.add(sr)
    report.compile()
    report.save()
```
This will output the following: 
[BciPyReport.pdf](https://github.com/CAMBI-tech/BciPy/files/15462241/BciPyReport.pdf)


## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Yes.

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? done!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c00998028b7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
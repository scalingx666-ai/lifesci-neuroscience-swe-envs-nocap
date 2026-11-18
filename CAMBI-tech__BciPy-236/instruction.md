# Issue

**Title:** #182776686 ; Parameters GUI scrolling

## Description

# Overview

Updated the form widgets to disable scrolling within each widget.

## Ticket

https://www.pivotaltracker.com/story/show/182776686

## Contributions

- Assigned an eventFilter on each form widget to handle the Wheel event by ignoring it.
- The behavior was somewhat operating system dependent. On MacOS the Integer and Float inputs were also hijacking the wheel event.

## Test

- Ran the Parameters GUI and used the mouse wheel to scroll through the form. Confirmed that none of the inputs intercepted the event, allowing the form to scroll. Also tested by pausing over an input an using the mouse wheel, and clicking an input to activate it before using the mouse wheel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1557ea8d5d6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
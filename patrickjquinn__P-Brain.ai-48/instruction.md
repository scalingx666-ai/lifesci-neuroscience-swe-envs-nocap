# Issue

**Title:** Added a basic personality

## Description

The main portion of this PR is adding a basic personality but that required a few framework changes.

Changes:
- Modified API hard_rule to be hardRule to fit better with registerClient.
- Added conditionalRule, a generator function that a skill may implement. Like a hard rule but based upon conditions such as the user and device.
- Added the concept of responses to the client and server.
- Added the personality skill which has a basic question response system. Eg you ask "How are you?" it responds saying "I'm  a robot, how are you?" and then the user can respond with "I'm good thank you" and the module will do basic sentiment analysis and respond accordingly. This skill also implements a number of questions I could imagine asking a virtual assistant to play around with it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68af57327b75`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
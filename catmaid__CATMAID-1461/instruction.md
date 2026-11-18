# Issue

**Title:** Issues/1445 synapse catalogue widget

## Description

This is the first iteration of the Connector Viewer widget, referred to as the Synapse Catalogue in issue #1445. Users add a number of skeletons to the widget and can peruse the connectors associated with those skeletons in a grid of mini stack viewers (with slightly altered stackInfo bars). They can filter by the type of association, as in the Connector Table. There are a number of sorting algorithms available, and the user can define which 'main' stack viewer they want their mini viewers to inherit settings from. 

Existing issues:

- there's no button associated with the widget as yet
- tracing overlay keyboard shortcuts behave inconsistently in the mini stack viewers
- connector sorting may hit performance issues for large numbers of connectors (untested)
- tracing with the connector viewer open is slowed down quite a lot - this is probably just related to having a lot of stack viewers, so it may be beneficial to suspend the tracing overlay of any stack viewer which is not currently in focus if it's not navigating with the project.

Future enhancements:

- At the moment I'm just jQuerying the stackInfo bar to make it do what I want - it might be nice to be able to customise the stackviewer, possibly by subclassing it, to handle that
- To me, this is a natural partner with the connector table: I experimented with a button to open a connector table from the connector viewer widget but then the table's own skeleton source controls misbehaved. What would make the most sense to me is having them joined like the 3D viewer is with its selection table, using the same sorting algorithm and possibily pagination.

Really really minor thing:

- You can click on the connector name in the stackInfo bar to navigate your main stack viewer to that connector, but that wouldn't be obvious to a user - I'd like to put a little target or drop pin icon next to it but wasn't sure about how to find static files and how not to accidentally use a copyrighted svg and such...

Contributors: @aschampion 

![connectorviewerfinal](https://cloud.githubusercontent.com/assets/8995328/21872005/dde8d8e4-d833-11e6-9bfa-1b0b4bc57cf3.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70b56c969190`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
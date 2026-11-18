# Issue

**Title:** Tag table: label deduplication and manual cache refresh

## Description

A short-term solution to #1468, duplication of tags in the table (reflecting duplication of tags in the database). Also .

One of the projects I was testing the tag table on had not only labels with unique IDs sharing a name, but also several of these on the same node. This patch changes the API endpoint so that it doesn't do any counting or grouping on the server, but allows the client to do it as appropriate for the application.

As a bonus, this means that we don't need to make separate API calls to get the skeleton IDs from the label IDs (because the first call gets them all), which improves performance when running on my local server with a project with ~3000 skeletons.

Because the table only makes one call to the API, there isn't any cache invalidation - but the user can now refresh manually because this also . As it's a fairly large call, I thought it would be more surprising to have their table lock up for a few seconds every 5 minutes than it would be to just continue using the data as of the time of opening the widget.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ae7008eb9b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
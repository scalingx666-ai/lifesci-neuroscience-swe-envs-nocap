# Issue

**Title:** Adding functionality to allow for writing of binary archives with CellBasedSimulationArchiver class

## Description

Hi all, 

I have never done a pull request before, so please excuse me, if I missed something in your guidelines on first read.
Because I had issues with serialization in text based archives myself, I had an interest in this being easily accessible in Chase, so I gave it a try:
This PR relates to  and proposes an option to implement the ability to write out binary archives in CellBasedSimulationArchiver Save()/Load() functions through a boolean template flag switching from the classical text based archives to binary archives.

More precisely: 
- Adds a template flag to CellBasedSimulationArchiver to allow for binary archive input/output, while keeping prior behavior and keeping code changes to a minimum
- Adds a specialization for ArchiveOpener for binary input/output archive to facilitate minimum code changes in CellBasedSimulationArchiver class
- Adds a test in TestArchivingHelperClasses.hpp to check for correct function of the ArchiveOpener specializations.

As a consequence and as mentioned in the issue #381, this would lead to
- Smaller file sizes of archives
- Allow users to easily circumvent (de)serialization issues associated with NaN values in double fields
-  

I assume there may be other options to deal with the binary reading/writing as for example an optional argument to Save() or Load in the CellBasedSimulationArchiver  instead of a template argument. I am open to suggestions, which option you would prefer and I can implement that alternative behavior if it would help you.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e55523dfb8f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
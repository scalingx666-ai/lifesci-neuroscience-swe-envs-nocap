# Issue

**Title:** Pugixml fetch only

## Description

Use FetchContent for pugixml; link privately to hide symbols

> Note: This is based on #253

* Fetch pugixml v1.15 via FetchContent instead of bundling or system package
* Link pugixml statically and privately to prevent symbol leakage
* Remove LSL_BUNDLED_PUGIXML option and thirdparty/pugixml/
* Simplify stream_info_impl.cpp by removing #ifdef PUGIXML_HAS_STRING_VIEW guards

Why?

pugixml 1.15 has some desirable updates, but it is not available in ubuntu via apt-get

Are there any objections to this? The cons that I can think of:

* Increased compile time on configs where we'd otherwise use system pugixml
* Increased binary size on configs where we could otherwise use system pugixml
* Internet required at config time
* Downstream clients with 'install pugixml' as a prerequisite should be updated to remove that step

I think these aren't major concerns, especially because platforms where we might be concerned about resources typically do not have an easy-to-install pugixml anyway.
Is there anything else to be worried about?

@tstenner

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6df1fd862a52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
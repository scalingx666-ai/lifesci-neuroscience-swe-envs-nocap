# Issue

**Title:** Set cluster views from URL of local file

## Description

This PR addresses and may resolve #1143, resolve #1151, resolve #1156, resolve #1159, and resolve #1165.

As @FranciscoNaveros and others have , the issue of blank cluster views occurs when the number of clusters or columns exceeds a certain limit. This seems to be due to the method `setHtml` of `QWebEnginePage` having a [size limit of 2 MB](https://doc.qt.io/qtforpython-5/PySide2/QtWebEngineWidgets/QWebEnginePage.html?highlight=qwebenginepage#PySide2.QtWebEngineWidgets.PySide2.QtWebEngineWidgets.QWebEnginePage.setHtml) for the HTML code to load.

The proposed fix here simply stores the HTML code to a temporary file and uses the method `setUrl` instead. The temporary files are cleared appropriately (when new HTML is set and when phy closes with `_save_gui_state`).

This works reliably and solves the issue on a branch of an older version of phy I tested it on. I would appreciate if someone could confirm this on the latest version of phy before a merge is considered. There might also be a more elegant way to implement the temporary file handling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8166fbef6dc8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
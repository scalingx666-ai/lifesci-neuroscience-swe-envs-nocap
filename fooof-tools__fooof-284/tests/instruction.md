# Issue

**Title:** [DOC] - Update documentation

## Description

Responds to #228 & #226 

It adds a new "Visualizers" section to the docsite. 

It adds a new "Motivations" piece exploring the notion of oscillations as peaks of power in the frequency domain (and some limitations in this). 

It add new examples:
- exporting model parameters to datafames
- an overview / exploration of topics & limitations related to aperiodic parameters (for the current models)
- an overview / exploration of topics & limitations related to periodic parameters (for the current models)

It also updates the Reference page, and adds an in code example of the reporting guidelines, which was added as a new section of the tutorial (I wasn't so clear where to put this, this seemed like a reasonable spot - but it could move). 

Note that across these updates / new materials, these pieces are somewhat drafts that could be extended if people want to add more into them (eg - someone who knows more might want to add more notes to the knee related notes). The goal of this PR is to get the key pieces in, with good first versions, and then further updates can be made as needed as we move into 2.0. 

Note: when this is ready and merged, it should also be merged to `name` (#205), with updates to move to specparam, so that these examples are also properly added to be 2.0 version. 

For ease of checking / reviewing - here is a copy of the built documentation including what's added:
[html.zip](https://github.com/fooof-tools/fooof/files/12076006/html.zip)
^If you download and unzip this, it's a copy of the built documentation page. Open the html folder, and double click 'index.html' to open the home page in a browser. Then you can click on the examples tab, and under the analyses section, click and see the new "Developmental Data Demo" example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `172101ae1458`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
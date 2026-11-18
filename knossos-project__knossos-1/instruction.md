# Issue

**Title:** cmake build system

## Description

Initial cmake-based build system.

Tested on Ubuntu 14.04.

Partial list of packages which need to be installed:

``` sh
sudo apt-get install pyqt5-dev
sudo apt-get install git-svn
sudo apt-get install freeglut3-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install qt5-qmake
sudo apt-get install libqt5opengl5-dev
sudo apt-get install libqt5help5
sudo apt-get install qttools5-dev
sudo apt-get install python3-pyqt5
sudo apt-get install libxmu-dev libxi-dev
sudo apt-get install qttools5-dev-tools
sudo apt-get install qt5-default
```

Then, run

``` sh
mkdir build
cd cmake ..
make
cd ..
./knossos
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f87cee35178f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
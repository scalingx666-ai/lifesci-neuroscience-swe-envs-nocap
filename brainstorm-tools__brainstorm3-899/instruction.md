# Issue

**Title:** Add support container-based plugins

## Description

This PR has as goal to provide an API to manage containers from Brainstorm, and integrate it in GUI

## General settings
- [x] Select preferred container engine in options
- [x] Save (set) and read (get) preferred container

## Containers API
- Supported engines
  - [x] [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  - [ ] [Podman](https://podman.io/) Left for future PR
  - [ ] [Apptainer](https://apptainer.org/) Left for future PR

## Containers as plugins
- [x] Update plugin descriptor to allow container plugins:
  Add fields for image reference and image SHA
- [x] Update plugin menus

%% Container API
- [x] Pull image (Plugin Install)
- [x] Run container as daemon on (Plugin Load)
- [x] Stop daemon container on (Plugin Unload)
- [x] Remove image (Plugin Uninstall)

## Documentation
- [x] Containers page in Brainstorm website
  https://neuroimage.usc.edu/brainstorm/Tutorials/Containers
- [x] Add information on Plugin tutorial
  https://neuroimage.usc.edu/brainstorm/Tutorials/Plugins#Container_plugins

## Additional info
- Toy example container-based plugin: https://github.com/rcassani/bst-plugin-container
- Related PR: #882

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `373f3d1b34a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
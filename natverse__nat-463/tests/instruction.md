# Issue

**Title:** function for rerooting neuron

## Description

getting foot in the door.

TODO:

- [x] "And it should give the option to provide either indices or ids. See `nat::distal_to` for ideas."
- [x] Should have a generic of the form `reroot(x,...)`
- [x] and methods for neuron and neuronlist with arguments `idx` and `pointno` for both
- [x] neuronlist method needs to check argument length carefully
- [x] neuron method needs to check that the ids/indices reference a valid node
- [x] would also suggest that the neuron method returns the original object 
- [x] finally we will need a specialised `catmaidneuron` method that ensures that additional metadata (synaptic connectors etc) is copied over when the neuron is remade
- [x] also add an entry in `_pkgdown.yml`
- [x] update news.md

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `760f19e2b52b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
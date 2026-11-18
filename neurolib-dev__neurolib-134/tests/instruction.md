# Issue

**Title:** MultiModel evolution: allow "extra" keys

## Description

Last step before ALN+thalamus motif evolution. 
The tricky part was to optimize with respect to connectivity. Because connectivity is a matrix, and AFAIK you cannot parameterize matrix within evolution framework in neurolib. So I used a "trick":
- I added parameters to `model.params` such as `model.params["aln_thal"]` and `model.params["thal_aln"]` for both connection strengths - now they are floats, so evaluation (`deap`) can work with them
- inside the `evaluateSimulation` function I created explicitly a connectivity matrix as `np.array([[0.0, model.params["thal_aln"]], [model.params["aln_thal"], 0.0]])`
- I assign this connectivity to the model

But it was not working. This is because of another MultiModel trait: usage of "star" notation. I was using `unwrap_star_dotdict` from `collections` to actually assign all parameters based on the star notation. This function was throwing an error when it found a key that is not an integral part of the model (so arbitrary parameter that is not needed for the model, such as the artificial connectivity floats). This PR fixes this: if it finds a key that is not part of the model, it just throws a warning but propagates that key forward, so you can explicitly build a connectivity matrix yourself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `248edecb636e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
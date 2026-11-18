# Issue

**Title:** Player based on evolutionary algorithm, with average score of around 7.8 ± 0.89

## Description

I have tried many different approaches and hyperparameters to end up handing in a rather simple model ;)

So the algorithm to find the optimal parameters / weights in `Wout` is quite generic and follows the setup of :

1. Randomly generate the initial population of individuals, the first generation.
2. Evaluate the fitness of each individual in the population.
3. Check, if the goal is reached and the algorithm can be terminated.
4. Select individuals as parents, preferably of higher fitness.
5. Produce offspring with optional crossover (mimicking reproduction).
6. Apply mutation operations on the offspring.
7. Select individuals preferably of lower fitness for replacement with new individuals (mimicking natural selection).
8. Return to 2
Source: https://en.wikipedia.org/wiki/Evolutionary_algorithm

So I begin by generating `min(cpu_count(), 8) * 3` individual `Wout`, with `np.random.uniform(-1, 1, (1, 1000))` and use the best performing individuals, then some crossover (taking weights from both "parents") and mutation (adding "variation" with `np.random.normal`) to create the next generation.
This is pretty simple and thus only performs good around half the time. 

To speed things up I have used multiprocessing and for the evaluation of the population I'm using a handcrafted reward function, which discourages hitting the wall and encourages "movement", by visiting many locations and both energy sources plus gaining energy in general, especially when running low on energy. 

Most parameters are chosen reasonably, eg. `leak = 0.8`,` spectral_radius = 0.95` and `density = 0.1`, but if any questions arise for any specific choice, I'm happy to answer. 

I tested some random seeds and got an average of `7.8 ± 0.89` with the highest being `13.32 ± 0.37` and the lowest `1.53 ± 0.19`, so because of the short training time and not that efficient optimisation algorithm, the random seed has a big influence on the final performance, so its a bit of playing roulette and I'm curious to see what seed you will pick for evaluation ;) 
Anyways, I think this can be a good baseline to beat for other people as well, I'm looking forward to seeing other solutions and thanks for the fun challenge!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38cef0b815d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
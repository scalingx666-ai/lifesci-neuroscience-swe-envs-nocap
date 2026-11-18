# Issue

**Title:** Distance tuning

## Description

Hey Tom,

Got the changes together here and I just gave them a spin and everything seems to be in working order. So now the distribution options read:

```
# define tuning distances from specific distribution in params dict
        if self.pref_wall_dist_distribution == 'ralyeigh':
            self.tuning_distances = np.random.rayleigh(scale=self.pref_wall_dist,
                                                       size=self.n)
        elif self.pref_wall_dist_distribution == 'uniform':
            self.tuning_distances = np.random.uniform(low=0,
                                                      high=self.pref_wall_dist * 2,
                                                      size=self.n)
        elif self.pref_wall_dist_distribution == 'normal':
            lower, upper = 0, self.Agent.Environment.scale
            mu, sigma = self.pref_wall_dist, self.pref_wall_dist / 2
            self.tuning_distances = scipy.stats.truncnorm.rvs((lower - mu)/sigma,
                                                              (upper-mu)/sigma,
                                                              scale=sigma,
                                                              size=self.n,
                                                              loc=mu)
        elif self.pref_wall_dist_distribution == 'delta':
            self.tuning_distances = self.pref_wall_dist * np.ones(self.n)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d7163b90c52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
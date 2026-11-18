# Issue

**Title:** ENH - allow ft_channelrepair to deal with neighboring bad channels

## Description

@NataschaRoos and I came across the situation that we want to identify some bad channels in some trials, i.e. in a sparse way, where certain channels in certain trials are replaced by nans. Subsequently we want to interpolate them.

The interpolation goes like this:

```
for i=1:numel(data_bad.trial)
  cfg = [];
  cfg.trials = i;
  cfg.badchannel = []; % this will be autodetected based on nans
  data_repaired_singletrial{i} = ft_channelrepair(cfg, data_bad);
end

data_repaired = ft_appenddata([], data_repaired_singletrial{:});
```

However, we came across the situation that bad channels are neighbours. This pull request updates ft_channelrepair such that bad and missing channels are removed from the `cfg.neighbours` definition prior to interpolating.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54411c884556`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
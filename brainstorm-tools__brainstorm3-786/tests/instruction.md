# Issue

**Title:** GetTimeIndices with empty TimeRange

## Description

Context: 

When creating a process that takes a timewindow**, we will often make something like this: 
```matlab
        TimeRange = sProcess.options.range_of_interest.Value{1};
        iTime = panel_time('GetTimeIndices', sData.Time, TimeRange);
```

However, this does not work as if the user selects "All File"; then TimeRange is empty, forcing us to do something like: 

```matlab
        TimeRange = sProcess.options.range_of_interest.Value{1};
        if isempty(TimeRange)
            iTime = 1:length(sData.Time);
        else
            iTime = panel_time('GetTimeIndices', sData.Time, TimeRange);
        end
```

Or this is kind of ugly. This PR hides the if/else inside GetTimeIndices. 




** 
```matlab
    sProcess.options.range_of_interest.Comment = 'Time window for correlation: ';
    sProcess.options.range_of_interest.Type    = 'timewindow';
    sProcess.options.range_of_interest.Value   =  []; 
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5322ef1562e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
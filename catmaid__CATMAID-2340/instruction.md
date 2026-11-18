# Issue

**Title:** Fix for #2255: create correct options in threshold pulldown

## Description

-   Error message is `Error: TypeError: can't access property "undefined", partnerSet.thresholds[type]`.
-   Inspecting the HTML:

```
<select class="threshold" data-partner-set-id="incoming" data-type="confidence data-skeleton-id=" 48161466="">
  <option value="1" selected="">1</option>
  <option value="1">2</option>
  <option value="1">3</option>
  <option value="1">4</option>
  <option value="1">5</option>
  <option value="1">6</option>
</select>
```

-   Notice that the value of `data-type` in the `select` is `"confidence data-skeleton-id="`.
-   That comes from bad quoting on this line in `connectivity.js`:

```
return `<select class='threshold' data-partner-set-id='${ts.partnerSet.id}' data-type='${ts.type} data-skeleton-id='${row}>${options}</select>`;
```

-   But after this line is fixed and the HTML is valid, a new error pops up: each time the threshold selector is changed, it immediately resets itself to 1.
-   That bug is in `createThresholdSelector`, which has this:

```
    thresholdSummary.forEach((ts, i) => {
      ...
      neuronTableColumns.push({
        ...
        render: (data, type, row, meta) => {
          let selectedIndex = (ts.partnerSet.thresholds[ts.type][row] || 1) - 1;
          let options = selectedIndex == 1 ? maxThresholdOptions[max] :
              new Array(max).fill().map((_, j) => `<option value='${i+1}'${j == selectedIndex ? ' selected' : ''}>${j+1}</option>`).join('');
          return `<select class='threshold' data-partner-set-id='${ts.partnerSet.id}' data-type='${ts.type}' data-skeleton-id='${row}'>${options}</select>`;
        },
      });
    });
```

-   Notice that the `value` for the `option` is `i+1` (the outer loop index) rather than `j+1` (the correct inner loop index).
-   Fixing this solves the "can't change the selector" bug that was masked by the crash.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2c14a41088d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
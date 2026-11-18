# Issue

**Title:** Stack viewer grid and webGL overflow handling

## Description

The functionality of the connector viewer has been replicated with the refactors, and the stack viewer grid is now available for other widgets to use. This actually allowed me to simplify the connector viewer a bit too (on top of just pulling 600 lines out of it).

## Design decisions

Informational text in the mini stack viewers are now called:

- title (cf title in the main stack viewer) - in the connector viewer, where the connector ID goes. Optional, defaulting to '(x=, y=, z=)' coordinates. When clicked, the main stack viewer navigates to the target of this mini stack viewer.
- note (in the top right corner: in mini stack viewers, the neuronname is hidden) - in the connector viewer, where the associated skeleton goes. Optional.
- sortVal (in the bottom right corner) - information about how the stack viewer was sorted, if that information exists. Optional, and not actually used in sorting (the calling widget does that).

The stack viewer grid's internal representation of the order of targets is an array of objects looking like this:

```javascript
  {
      coords: {x: 10, y: 20, z: 30},
      title: 'title text in the top left',
      sortVal: 'bottom right text',
      note: 'top right text'
  }
```

which could be expanded if we wanted to set any layer control settings in this way. I guess it's a little awkward to define in the calling widget? But there isn't really a better way of doing it without prototyping an object for it. Is that worth doing?

## Bugs

1) ~~Unfortunately, replicating functionality includes a webGL context leak. @aschampion and I thought we'd plugged it but apparently it exists in the released connector viewer too. I went for this PR anyway because it doesn't add any *new* bugs.~~

2) I very occasionally get a failure to redraw the tracing overlay on some mini stack viewers when the grid is resized - I suspect it may relate to which stack viewer you most recently focused before resizing. It redraws if you focus the offending mini stack viewer. Again, this would have existed in the original.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a40703209eec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
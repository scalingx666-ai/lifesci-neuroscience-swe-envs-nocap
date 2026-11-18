# Issue

**Title:** Fix unicode bug in Picture()

## Description

This is again about the issue that we discussed before on Google code ([here](https://code.google.com/p/expyriment/issues/detail?id=18) and [here](https://code.google.com/p/expyriment/issues/detail?id=17#c12)). My initial bug report stated that `pygame.image.load()` assumes utf-8 encoding, but this is not correct, at least not for PyGame 1.9.1.  It assumes the filesystem encoding, which also makes more sense. (I was testing PyGame 1.9.2 alpha for a while, and I suspect that this version _does_ assume utf-8, so we should keep on eye on this. I haven't gone back to 1.9.2 alpha to test this though.)

At any rate, I fixed the issue and also added two functions to make it easier to handle unicode properly. Basically, right now Expyriment doesn't care about text encoding, which is guaranteed to cause a lot of trouble for a lot of people (!). In general, and you see this in miniature form here in this pull request, the optimal strategy is to decode all `str`ings to unicode as soon as they enter the software (for example filenames passed as an argument to a function), and work exclusively with unicode internally. If necessary, the `unicode` objects are encoded back into `str`ings when they leave the software, for example when you need to pass a filename to `pygame.image.load()`.

This is also explained in more detail in the Unicode HOWTO:
- http://docs.python.org/2/howto/unicode.html#tips-for-writing-unicode-aware-programs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97f8eaeb025d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
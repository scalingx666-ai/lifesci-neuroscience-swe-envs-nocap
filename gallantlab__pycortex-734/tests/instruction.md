# Issue

**Title:** Open the webgl viewer at localhost rather than the machine's hostname

## Description

Mark did this with Claude to resolve an annoyance that only came up on my Mac laptop (see below). FWIW, I am still not comfortable letting Claude push; I am still trying to understand as completely as I can what, exactly, I am allowing the Borg to take over.  

Here's what Claude has to say about the fix: 

show() built the viewer URL from socket.gethostname(), then handed it to webbrowser.open(). That browser runs on the same machine as the server, so the hostname buys nothing there, and on macOS it actively gets in the way: with scutil HostName unset, gethostname() returns the mDNS name ("mymac.local"), which resolves to a long list of addresses -- two link-local ones with no usable scope among them -- and reaches the server only if the application firewall lets the python process accept connections on a non-loopback interface. The auto-opened tab then fails for reasons that look nothing like a pycortex problem.

The webgl.domain_name config option cannot help, since it is appended to the hostname rather than replacing it.

Build both URLs instead. localhost is what gets opened and what is printed first, matching what headless.py already does; the hostname URL is still printed (and still shown in the IPython link) for handing to someone on another machine, so remote setups relying on domain_name keep working. The port line now comes with a full URL, which is what you need anyway when the browser does not open on its own.

... AFAICT this is all reasonable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1583a5daa3c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
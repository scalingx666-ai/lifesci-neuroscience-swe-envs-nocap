# Issue

**Title:** Refactoring suggestions

## Description

I have been reviewing a bit the code, starting by going through the sections I would be more familiar with (`Atlas`, `Scene`, `utils` around).
In this PR, there are some refactoring suggestions; some of them have been done in one place but if you would go for this concept there might be multiple places I left untouched where such simplifications might help.

In general, before a solid final release the package would benefit from a thorough cleanup, as it looks that different parts of the code are at very different stages, and some classes/methods got a bit overgrown and spread around (random example, web-query related functions in `webqueries` & `data_io`), but I guess it's just that the process is still ongoing.

Still, there are some little redundancies/suboptimalities that makes it a bit hard to dig deeper in the code if someone wants to understand more the code behind the exposed methods, I hope you don't mind if I make the following unrequested comments :) 

Some concrete points that I have seen around and you might want to consider refactoring:
 - Removing multiple implementations of functions to do the same operations on different axes (refactor draft in PR); and using tuple of coordinates instead of separate `z, x, y `makes code more compact in many places;
 - Related to this, I think it would be important to know how generic you want to be about the space/coordinates, ie if you'll always assume bg (allen) orientation for all atlases; in any way you choose this, make it clear somewhere what would "x,y,z" mean for the coordinates (how they interact with specifications such as "rostrocaudal", as some functions (eg `mirror_actor_at_point` use them for axes); this might look too different than usual to users, but one could completely drop "x, y, z" for something more explicit as in bgsace;
 - The `Scene` class is quite heavy and spans from dealing with fitting an electrode position to capturing screenshoots; I think something could be refactor out as it might be useful elsewhere; a lot can be just shortened with neutral refactoring, just writing less verbose code;
- Is actors a collection of dictionaries and lists? that sounds a bit confusing to me;
 - General styling/refactoring tips:
	* in several places there are convoluted nested loops and multiple conditionals, eg with multiple calls to the same functions inside (little example, `mirror_actor_at_point`, with lot of redundant elif that could be dropped with a dict of indexes; or the multiple little sub-functions of `edit_actor`); in many places they could be simplified/rewritten using dict (and kwargs dictionaries to update and pass to the function) to make the flow more intuitive and the code more compact;
	* popping default parameters from a kwargs dictionary is a bit bizarre to follow and I believe entirely equivalent to specify those arguments as kw arguments with their default in the method definition;
	* You make very thorough testing of argument type in many places; 2 notes on this, as in many cases almost doubles the length of your code:
		1) in several places this is redundant as it does not really come from the necessity of supporting multiple types; there simply leaving the statements inside the function would not change that much for the user, and would make the code much more streamlined to follow;
		2) supporting multiple types might good but sometimes you go to very long ends for this; do you make use of all these inconsistent types or you just want it to be very flexible for the user? In the latter case, in most cases it is better to support in a clear way one type only, and let the user understand clearly your code and adapt their inputs to it (first example that comes to attention re-looking at it: mirror_actor_at_point are basically 2 separate functions for 2 separate types of inputs, which you should avoid and if you really need it just have 2 different functions);
	* there's several generic excepts around and
	* inconsistent os + Path usage, but I guess that is also ongoing refactoring

Those are all semi-minor things, but they do impact significantly the possibility of reading code and more importantly make it more bug-prone and harder to maintain. I would be happy to have another look at a further point!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ba7a3bdfd5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.
---
title: Software Development and Carpentry
layout: post
date: 2018-05-28 00:00:00 +0000
tags:
- software engineering
---
Some friends and I have this sort of an inside joke that, eventually, we'll all become carpenters. This joke didn't come from nowhere, and it actually comes from a trend we've noticed in websites such as [HackerNews](https://news.ycombinator.com/) and [r/programming](https://www.reddit.com/r/programming/).
Every time a question such as *"What would you do if you were not a developer?"* pops up, many [answers](https://news.ycombinator.com/item?id=6952949) seem to [gravitate](https://news.ycombinator.com/item?id=12900827) towards [woodworking](https://news.ycombinator.com/item?id=5182121).

Initially, I thought this was a matter of abstract versus concrete types of work, and I still think this is somewhat the case.
Programming is a highly intellectual activity, and, even though you can see the effects of the CSS you wrote or the 3D engine you developed, it rarely results in a palpable object.
While being able to create something out of nothing other than a computer is impressive, human beings still crave the sensorial feedback that something was actually done.

Still, there's something more to it: control and predictability.

Abstraction is just a way of getting predictable results without all the fuss of the real world.
If a car is accelerating at 2m/s², and I abstract away drag and friction, I know exactly where it will be after 5 seconds and how fast.
If 2m/s² is too much, I can decrease it without worrying about additional effects of variables that are not under my control.

Compare this to any experiment in the real world:
the acceleration will hardly be constant; air resistance will have a significant impact;
and friction will definately affect the end result.

At first, it feels like programming should be much more like the first example than the second.
If I write `print("Hello, world!")`, it should always print `Hello, world!`.
I think this is programming's main allure[^1]:
whatever I type, that's what will happen.
No more, no less.

[^1]: At least for me. Of course, I'm projecting a lot in this article.

Yet, in spite of being a highly intellectual/abstract activity, programming's predictability doesn't resist contact with the real world.
I'm not even talking about business decisions that, often, change frequently and conflict with each other.
Programming in itself is highly unpredictable, because there's a lot going on:
hardware is way more complex than the models used for teaching and has its own [share of bugs](https://danluu.com/cpu-bugs/);
operating systems might not always do what we expect them to do;
and, most importantly, the dozens of dependencies we import into our projects are not as spotless as we pretend them to be.

I'm not advocating we dump it all and always write our software from scratch.
Economically, it makes sense to use whatever is available so we can deliver working software in a way that is cheaper and faster.
Yet, in the cases we run into an unpredictable behavior, we feel we have lost control.

Now, everyone gets frustrated when things don't go their way, but developers are unique in this regard because they thought their profession choice would make them invulnerable to it.
To cope with it, developers have created their own ways.
Some long for a simpler past, and will look into retrocomputing, NES emulation, and similar ways of reacquiring control over the software they develop.
Others will look at other professions with rose tinted glasses.

Is carpentry really less frustrating than software development?
I don't think so.

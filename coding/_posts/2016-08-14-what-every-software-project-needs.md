---
layout: post
title: What Every Software Project Needs
tags: [software engineering]
---

Recently, I had this idea of writing general guidelines that every software project should follow.
Lucky for me, I found an article that covers up almost everything, so I don't have to write one.

This [pre-coding checklist][ITH] at IT Hare contains what I think are the essentials.
However, there are also some other items that should be present:


### Code Reviews

The ~~guys~~ hares at IT Hare write *en passant* about code reviews, but they are really important.
Although most guidelines can be automatically checked by static analysis tools, architectural decisions can't.
Inefficient and over-complicated structures should be vetoed here.


### Logging

Logging is actually more related to software itself than to the project.
Still, making logging part of the solution from the beginning helps a lot down the road.


This checklist may look like lots of work, but it's worth it.
Besides, depending on the tools you decide to use, many items in this list might be checked at once.
For instance, tools like [GitLab][GL] already include source control, issue tracking, and continuous integration.
If you decide to use pull requests, it also includes a way for making code reviews.

[ITH]: http://ithare.com/pre-coding-checklist-things-everybody-hates-but-everybody-needs-them-too-from-source-control-to-coding-guidelines/
[GL]: https://about.gitlab.com/

---
layout: post
title: Notes on Effective Performance Engineering
tags: [software engineering, book review]
---

These are some notes I've written while reading [Effective Performance Engineering][EPE], a book written by Todd DeCapua and Shane Evans.
This book is available for free, you just have to give O'Reilly your email address.
Until now at least, I haven't received any spam on the account that I used to sign up, so I guess it's trustable.

[EPE]: http://www.oreilly.com/webops-perf/free/effective-performance-engineering.csp

### 1. Getting Started

The first chapter begins with a promise of defining what "effective performance engineering" is.
This is a fair goal, as different people may have different ideas of what it means.
The authors, though, do not deliver.
This is a bad start, especially for a book on *performance.*

Instead, it lingers on with buzzwords and trying to convince the reader that performance is important.
I do not think someone reading a book called Effective Performance Engineering needs convincing, but let us move on.
Perhaps it will improve in the later chapters?

Besides being a waste of a fifth of the book, this chapter reads like a paid article.
A good part of its contents is about how great it is to work at Google, Wegmans, DreamWorks, Salesforce, and Apple.
It is great to have some real world examples, but these sections offer no insights about how to implement a performance culture.

### 2. Overview of Performance Engineering

The second chapter is better overall, showing how Performance Engineering can be applied throughall the lifecycle.
Basing itself on the Scrum methodology, it suggests small improvements that can make your company more performance-focused.
It also shows how performance is related to security, usability, design, etc. and suggests ways to work with them all at the same time.

### 3. Proven Practices of Performance Engineering

I'd say this is the main chapter of the book (and its best).
The authors use some real cases to highlight the importance of having good performance practices in place.

The biggest lesson from this chapter for me was realizing that making the right choice doesn't mean your job is done.
In a real-world scenario taken from a financial company, they present three options:

1. Rolling out a new feature to all costumers at once;
2. Rolling out this same feature to a few costumers a time;
3. Making this feature opt-in initially, and after some time make it obligatory.

Although the company selected what's probably the best option (number 2), they still had problems.
Even though the number of costumers was small, they didn't consider the impact that this feature could have on other parts of the system.
So, despite the feature being rolled out only to some costumers, it ended effecting all of them.

### 4. Tying it all together

This chapter begins by rescuing what was presented in the second chapter.
Performance doesn't mean (only) making your software faster.
If your team is not developing the right features, in the right timeframe, with the right quality, then its not performant.

Afterwards, it gives some tips on how to implement this on your company.
This is a section that I wish the authors had extended a little more.
For instance, I know It's hard to get too much in the details of how to create a performance culture in a company.
Each company is different, and suggestions that apply to some may not apply to others.
However, I'd have expected this part to be longer.

Overall, it's an okay book.
It's free, so I can't complain; I don't feel like I've been cheated or something like that.
Nevertheless, I think [Joe Duffy's take on performance culture][JD] is a better and shorter introduction to the subject.

[JD]: http://joeduffyblog.com/2016/04/10/performance-culture/

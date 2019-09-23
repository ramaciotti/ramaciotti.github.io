---
title: Go, First Impressions
layout: post
date: 2019-09-23 00:00:00 +0000
tags:
- go
- plt
---

For a while now, I've been putting Go down.
As someone who's really into Programming Languages Theory, it just felt wrong to create a new language that, basically, just throws away almost everything that has been developed on the subject in the last years.
Forget about null tracking, innovative ways of handling errors, and so on.
Everything in Go is "simple," for some definition of simple.

After reading some blog posts on [Lobste.rs](https://lobste.rs/), though, I decided to give it a chance.
What I found was actually worse than what I expected.

It has become sort of a meme to make fun of Go for not having generics, for instance, but what would you expect from a language that doesn't even have `enum`s[^1]?
I know about type alias + `const` + `iota`, but that doesn't cover everything I expect from an `enum` type.
Most importantly, it doesn't properly introduce a parent type so you can use `Enum.Value` or `Enum::Value`.
It just polutes the global (package) namespace with a bunch of `const`s.
It also bugs me that you need to manually set the type alias and use `iota`.
How hard would it be to convert 

```go
type Color enum {
  Red
  Green
  Blue
}
```

into something like

```go
type Color int
const (
  Red = iota,
  Green,
  Blue
)
```

Go is a simple language, but simple for whom?

Error handling felt okay on the small projects that I created while practicing, but I don't think it would be pleasant to `if err != nil {}` all through a larger code base.
Worse than all of that, though, was the naming convention.

On theory, `privateThing` and `PublicThing` look okay.
Personally, I prefer uppercase for types and lowercase for everthing else, but that sounds acceptable...
Until you're working on a file with lots of private stuff, and you decide it makes sense to move them into their own package.
Refactoring this is terrible.
Not only you need to rename all the types, functions and variables that you are moving, but you also need to rename everywhere they are used too.

To be fair, though, there are some nice things about the language.
Its compile times are great, for one.
The concorrence primitives are also well thought out.
For instance, the exercise on [Equivalent Binary Trees](https://tour.golang.org/concurrency/8) is quite mind opening.
Having an easy way of executing code concurrently with "goroutines" and communicating using channels really opens up the possibilities when writing algorithms.
I also like having something like [`Once`](https://golang.org/pkg/sync/#Once.Do) in the standard library.

I feel that taking the time to learn it better wasn't a complete waste.
It certainly sets the bar on compiling speeds and standard library support really high, so I can see why people love it so much.
That being said, given the choice, I'd still not use it, but at least now I have proper grounding for saying that.

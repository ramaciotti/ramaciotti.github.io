---
layout: post
title: Object-Oriented Programming is a Bunch of Things
tags: [functional programming, object-oriented programming, ocaml]
---

One of the major guidelines when writing object-oriented programs is the Single Responsibility Principle from SOLID.
Much to my delight, object-oriented programming languages in general don't follow this rule.

In these languages, different concepts end up being represented by the same language constructs:
classes and inheritance.
Although this isn't a problem per se, it can be confusing when many of them are being used at the same time.
It may also make it harder to teach object-oriented programming to someone for the first time.

In this article, I'll show how almost all of these concepts can be represented without depending on classes and inheritance.
Although I'm using OCaml, I'm not trying to convince anybody that functional programming is better.
My intention here is to show that these concepts are actually unrelated, so you can better notice when they're being mixed.


## Encapsulation

Encapsulation is probably the first thing that comes to peoples' minds when they think about object-oriented programming.
According to [Wikipedia][E], it means both:

- A language mechanism for restricting access to some of the ~~object's~~ module's components.
- A language construct that facilitates the bundling of data with the ~~methods (or other functions)~~ functions operating on that data.

I've replaced objects with modules and removed the reference to methods.
Still, the meaning is basically the same.

Access can be restricted in many ways through the use of modules.
For instance, the module `counter.mli` below encapsulates both the type `Counter.t` and the functions `empty`, `touch`, `to_list`, and `median` together.
At the same time, it prevents data from `Counter.t` from being directly accessed.

```ocaml
(** A collection of string frequency counts .*)
type t

(** The empty set of frequency counts *)
val empty : t

(** Bump the frequency count for the given string. *)
val touch : t -> string -> t

(** Converts the set of frequency counts to an association list.  A string
    shows up at most once, and the counts are >= 1. *)
val to_list : t -> (string * int) list
```

This can be done in C, too, even though it has no explicit concept of modules.
A partial translation of the code above could be present in a `counter.h` file.
The drawback from this approach is that `counter_t` must always be accessed from a pointer, as the compiler doesn't know its size to allocate it in the stack.
It is, anyway, a better approach than using `void*` for everything.

```c
struct counter_t;

/** The empty set of frequency counts */
struct counter_t* empty();

/** Bump the frequency count for the given string */
void touch(struct counter_t* t, char* string);
```

Notice also that, in both cases, the implementation details are hidden from the user.
Encapsulation is not an object-oriented concept.
It's a general best-practice that applies to any kind of programming:
structured, object-oriented or functional.

[E]: https://en.wikipedia.org/wiki/Encapsulation_%28computer_programming%29


## Extension

Generally, extension is implemented as inheritance in object-oriented languages.
`extends` is even a keyword in Java and JavaScript (ES6).
However, if the module system of a language allows re-exporting symbols, classes are unnecessary.

In OCaml, there's the keyword `include` that imports all identifiers from a module an re-export them.
As an example, the file `ext_list.mli` expands the `List` module adding a `my_intersperse` function.

```ocaml
include (module type of List)

val my_intersperse : 'a list -> 'a -> 'a list
```

It's possible to use this module in another file as if it was the original `List`, the only difference being the added function.

```ocaml
module List = Ext_list

let () =
  let my_list = [1; 2; 3] in
  List.my_intersperse my_list 5
  ()
```

OCaml also has a feature called polymorphic variants.
Though their use is usually frowned upon, they permit the introduction of new types and new functions in a easy manner.
Garrigue gives a nice [explanation about them][G] and their relation to the [Expression problem][EP] (which I'll talk a bit later).

[G]: http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.128.7169

As a quick overview, consider there's a function for storing a file in a library like the code below.

```ocaml
```

The use of polymorphic variants make it possible to write a function that expands `foo`'s behavior.

```ocaml
```

It's not the only way to do it (nor is it the only use of polymorphic variants), but I wanted to share this quite peculiar feature.


## Sum types



This is a well known tradeoff in programming languages design called the [Expression problem][EP].
Three common ways to deal with it are the Visitor pattern (from the object-oriented side of the fence) or polymorphic variants and type classes (from the functional).

[EP]: https://en.wikipedia.org/wiki/Expression_problem


## Dynamic Dispatch

Finally, something that is

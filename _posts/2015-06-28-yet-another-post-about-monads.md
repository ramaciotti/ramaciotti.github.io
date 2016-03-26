---
layout: post
title: Yet another post about monads
tags: [haskell, functional programming]
---

Recently, the concept of monads finally snapped in me.
I believe the secret is to use them until you have some intuitive understanding.
Then, you can read those zillion other articles on Category Theory and understand what they actually are.

Most articles I've seen focus on what monads *are.*
This is problematic, because many things are monads, but they share almost no similarity.
Instead, I'd like to focus on the syntatic and operational aspect of using monads.
I believe it's easier to understand what they *do* than what they *are.*
Actually, what they are may not matter so much after all.

Let's start with some Haskell code.
If you're reading about monads, you probably already know some Haskell, right?
Ok, so you know we can write a silly function such as this:

{% highlight haskell %}
silly :: String -> Int -> Int -> Int
silly s x y = ((length s) * x) + y
{% endhighlight %}

If, for some reason, we want to separate the steps for computing this function, we can use `let`.

```haskell
silly :: String -> Int -> Int -> Int
silly s x y = let a = length s
                  b = a * x
                  c = b + y
               in c
```

We can also transform it into a monadic function by using the `Identity` monad.
Don't worry so much about what monadic means.
Think of it as a different syntax for Haskell[^fn1].

[^fn1]: Generally people don't use braces and semi-colons in Haskell, but I think it makes it easier to understand what I'm trying to show.

```haskell
import Control.Monad.Identity

silly :: String -> Int -> Int -> Identity Int
silly s x y = do {
  a <- return $ length s;
  b <- return $ a * x;
  c <- return $ b + y;
  return c;
}
```

Behold, however, for these are no ordinary semicolons!
They work as some sort of macro expansion.
They mean: you see, there's this expression on the left.
Evaluate it, do something with its result, and then evaluate the expression on the right (or in the next line, in this case).

To describe what this "do something" means, we use monads.
They're only an interface (a typeclass, actually) specifying what should be done during this macro expansion.
Let's take some of the most common monads and see what they do:

* `Maybe`: take the value on the left.
  If it's `Nothing`, short-circuit the rest of the function and return `Nothing`.
  Else, evaluate the value on the right.
* `Either`: take the value on the left.
  If it's `Left`, short-circuit the rest of the function and return this value.
  Else, evaluate the value on the right.
* `List`: take the list on the left.
  For each value on this list, evaluate the function on the right, and append all the results together.
* `State`: take the `(value, state)` pair on the left.
  Evaluate the value on the right using this same `state`.

Actually, this is no original idea.
It's been presented on [Real World Haskell][RWH] before.
Unfortunately, the authors only give a [single paragraph to this thought][SP].
Now go and read again the chapters about monads in Haskell books.
See if thinking of them as something that happens in between the expressions you wrote help you understand what's actually happening.  It's certainly helped me.

[RWH]: http://book.realworldhaskell.org/
[SP]: http://book.realworldhaskell.org/read/monads.html#id642960


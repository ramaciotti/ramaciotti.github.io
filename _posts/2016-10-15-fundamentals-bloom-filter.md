---
layout: post
title: "Fundamentals: Bloom Filter"
tags: [c, fundamentals]
---

In this *Fundamentals* series, I'll write about some Computer Science concepts that I haven't paid much attention before.
For this first one, I wrote a simple [Bloom Filter][BF] based on an article that introduces the concept of [Enhanced Double Hashing][A].

[BF]: https://github.com/ramaciotti/fundamentals/tree/master/bloom-c
[A]: http://www.ccs.neu.edu/home/pete/pub/bloom-filters-verification.pdf

The concept behind Bloom Filters is pretty simple (simpler than I thought, actually).
They're a probabilistic data structure that work similarly to Sets, but are much more space efficient.
Of course, this space efficiency isn't free.
As a tradeoff, Bloom Filters are less precise than Sets.
Sometimes, they may return false positives, claiming they contain an element that they do not actually have.
The opposite, however, never happens: Bloom Filters never return false negatives.

They are implemented as a bit array of size *m.*
Initially, all bits are set to zero.
When a value is added to a bloom filter, *k* hash functions are computed, and the bits at the indexes returned by the *k* functions are set to one.

For instance, suppose we have a Bloom Filter with size *m = 8.*
In the beginning, all bits are zero: *0000 0000.*
Now, suppose we have two hashing functions, *x,* and *y,* and we want to include the number 17 in this Bloom Filter.
If *x(17)* returns 1, and *y(17)* returns 4, then the bits will be *0100 1000* (assuming that we count bits from left to right).

Querying whether a value is present in a Bloom Filter is made in a similar way.
The same *k* hash functions are computed, and the bits at returned indexes are checked.
If they're **all** one, then the querying function will return true.

Continuing the same example as before, suppose we want to query if the filter contains the number 17.
Again, we compute *x(17)* (which returns 1) and *y(17)* (which returns 4).
Checking these bits in *0100 1000,* we see they're both ones, so the Bloom filter contains this value.

False positives occur when the bits checked are all ones, even though the value being queried hasn't been actually added to the Bloom Filter.
Expanding on the same example, suppose now we want to query if the filter contains the value 85.
In this case, *x(85)* returns 4 and *y(85)* returns 1.
Checking these bits again in *0100 1000,* they're both ones, so we get a false positive.
The rate in which false positives happen can be tuned according to the size of the bit array and the number of hash functions.

The hardest part of it all is finding good *k* hashing functions that are independent.
Fortunatelly, thanks to the concept of Enhanced Double Hashing, it's possible to implement only two hashing functions, and create the others from the initial two.

### Comments on my code

My implementation takes form of a C module.
It defines an opaque type `bloom_t` and functions to operate on it.
All public functions are documented in `bloom.h`, and the `static` functions in `bloom.c` are "private" to the module.

The functions `bloom_add` and `bloom_query` show how Enhanced Double Hashing works.
First, `value` is hashed with both `hash1` and `hash2`.
Then, these two values are added together to give the next hash; `y` is also updated on each iteration.
More details on how this work can be found in the article I linked up above.

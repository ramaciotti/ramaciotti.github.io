---
title: Never Call an Enum “ai” on Rails
layout: post
date: 2020-07-10 00:00:00 +0000
tags:
- rails
---

This one happened recently, we couldn't find anything online, and it took us some time to solve.
In case this happens to someone else, I decided to document it here.

Say you have an ActiveRecord model with an enum.
For instance, you want to keep track of whether a match was played against a human or a computer-controlled adversary:

```ruby
class Match < ApplicationRecord
  enum opponent_type: {
    human: 'human',
    ai: 'ai'
  }
end
```

Now, you try to call `Match.all` and it doesn't do what you expect it to do.
For some reason, it behaves as if you had created a default scope, and it adds an `WHERE` clause to it.
You called `Match.all`, but it is as if you had called `Match.where(opponent_type: :ai)`.

To make matters worse, that only happens when you call `Match.all` by itself.
If, instead, you call `Match.all.to_sql`, the `WHERE` is gone.
If you call `Match.all.count`, it doesn't show up either.

This happens because, when you define an enum on an ActiveRecord model, it also generates some scopes.
For the example above, it will generate both `Match.human` and `Match.ai`.
The problem happens because ActiveRecord models already have an `ai` method, so the enum is overriding it.

Fixing it is relatively simple, just add a prefix or a suffix to the enum.
For instance, using the code below, the generated scopes will be called `Match.opponent_type_human` and `Match.opponent_type_ai`.

```ruby
class Match < ApplicationRecord
  enum opponent_type: {
    human: 'human',
    ai: 'ai'
  }, _prefix: true
end
```

As for why there already is a method called `ai`, that is a gift from [Awesome Inspect](https://www.rubydoc.info/github/michaeldv/awesome_print/Kernel#ai-instance_method).
To figure that out, I had to use a bit of Ruby's introspection features:

```ruby
Match.method(:ai).source_location
```

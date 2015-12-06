---
layout: post
title: Postmortem&#58; Angular 2 and TypeScript
tags: [postmortems, angular2, typescript]
---

Notice: this postmortem is about a piece of software that's still on alpha.
At the time of writing, Angular 2 latest version was `alpha44`.
Things might have changed since then.

In one of our projects, we decided to use Angular 2 with TypeScript.
Although it's still on alpha, the framework core feels mature, and it was a breeze to get started.
It's still an alpha, though, and it shows on some points.
For instance, there's a gap between the tutorial and the more advanced references.
You're better off looking for examples in GitHub instead of in the documentation.
This isn't so much a problem, though, as the framework is well structured.
It's easy to understand what an example is doing (and how it is doing it) just by looking at it.

Another point I had some issues was with its `Http` class.
I felt `window.fetch` was more flexible and consistent with the rest of the language.
Which is curious, because `fetch` isn't defined for `window` in TypeScript.
To solve this, I created an interface that extended from `Window` and had a `fetch` method.
It's a little cumbersome because you have to cast whenever you want to fetch something, but it works.

{% highlight javascript %}
interface WindowWithFetch extends Window {
  fetch(url: string, options?: {}): Promise<any>;
}

(<WindowWithFetch> window).fetch("myClassUrl")
  .then((response: Response) => response.json())
  .then((data: MyClass) => console.log(data));
{% endhighlight %}

TypeScript also feels leaky when dealing with high-order functions.
This is caused by `this` having different values depending on the context in JavaScript.
If you run into this kind of problem, remember: the fat arrow is your friend.

{% highlight javascript %}
function callAndLog(fn: any) {
  console.log(fn());
}

class Example {
  constructor(private value: string) { }
    
  public getValue(): string {
    return this.value;
  } 
}

let e = new Example("example");

// callAndLog(e.getValue) won't do what you might expect.
callAndLog(() => e.getValue());
{% endhighlight %}

In conclusion, I feel it's already possible to use Angular 2, at least on small projects.
There are some issues yet, but none of them make the framework impossible to use.
TypeScript was also a nice surprise.
It makes it easier to keep your code organized by making each file a JavaScript module.
Also, as the name says, it has (static) types, something I enjoy.


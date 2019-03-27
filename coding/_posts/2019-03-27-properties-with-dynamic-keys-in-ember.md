---
title: Creating Properties with Dynamic Keys in Ember
layout: post
date: 2019-03-27 00:00:00 +0000
tags:
- ember
---

Recently, I had to create a computed property that depended on an attribute value.
Initially, I was inclined to try something like the code below, but that *doesn't work.*
You actually need to call `get` to be able to use the `propertyName` value.

```js
import Component from '@ember/component';
import { computed, get } from '@ember/object';

export default Component.extend({
  model: null,
  propertyName: null,
  
  value: computed(`model.${propertyName}`, () => {
    const propertyName = get(this, 'propertyName');
    const value = get(this, `model.${propertyName}`);
    
    return value;
  })
};
```

The correct way to do it is quite simple.
I'm not sure why it took me so long to discover how to do it, so I decided to record it here.
I figured it out by accident from this [reply to an issue in GitHub][GH].

[GH]: https://github.com/emberjs/ember.js/issues/16504#issuecomment-380793961

You can create a computed property with dynamic dependent keys by using the `defineProperty` function.
For instance, the code below will create a component that renders the specified property from an object.

```js
import Component from '@ember/component';
import { computed, defineProperty, get } from '@ember/object';

export default Component.extend({
  model: null,
  propertyName: null,
  
  init() {
    const propertyName = get(this, 'propertyName');
    
    defineProperty(this, 'value', computed(`model.${propertyModel}`, () => {
      return get(this, `model.${propertyName}`);
    });
  }
};
```

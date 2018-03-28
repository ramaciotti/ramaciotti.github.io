---
layout: post
title: Quick note on Co- and Contravariance
tags: [type systems]
---

This is something that I keep forgetting, so I decided to write a quick note on it.
Basically, *variance* -- in a Computer Science context -- is a relation between **subtypes** and **type constructors**.

In a type system with subtypes, whenever a value with type `T` is expected, any value with subtype `S` can be used.
This is true as long as `S` is a subtype of `T`, of course.
Symbolically: `S <: T`.
As a more practical example, see the code below.
It is valid C# code because `ComboBox` is a subtype of `UIElement`[^fn1].

````c#
UIElement element = new ComboBox();
````

[^fn1]: There is no special reason I am using C# here.  Variance is a concept that is language agnostic.

A type constructor `C` can be thought as a function from types to types.
That is, it takes a parameter `T` and returns a new type, `C<T>`.
For a commonly used example, see `List<T>`.
It takes a type (let's say, `UIElement`) and returns other (`List<UIElement>`).

It does not necessarily follow that, if `S` is a subtype of `T`, `C<S>` is also a subtype of `C<T>`.
For instance, `List<ComboBox>` is not a subtype of `List<UIElement>`, nor is the opposite true.
In this case, we say `List<T>` is *invariant* in regards to `T`.
To see why this is the case, consider the code below.
If it was valid, after the third line there would be a `TextBox` in a `List<ComboBox>`, which should not happen.

````c#
List<ComboBox> comboBoxes = new List<ComboBox>();
List<UIElement> elements = comboBoxes; // invalid assignment
elements.Add(new TextBox());
````

Sometimes, though, it might make sense to make `C<S>` a subtype of `C<T>`.
We call this property *(co)variance.*
Notice that `C` does not change the direction of the relation:
if `S <: T`, then `(C<S>) <: (C<T>)`.
This is what *co-* means, they change together.

One of these cases is `IEnumerable<T>`.
On a first look, it is very similar to `List<T>`, but as it is readonly, there is no risk of accidentally creating an invalid collection.

````c#
List<ComboBox> comboBoxes = new List<ComboBox>();
IEnumerable<UIElement> elements = comboBoxes;
````

In other scenarios, the opposite might be true: `C<T>` is a subtype of `C<S>`.
This is what we call *contravariance.*
In this case, the direction of the relations is inverted:
if `S <: T`, then `(C<T>) <: (C<S>)`.
This is what *contra-* means, they change in opposite ways.

For one of these scenarios, look at `Action<T>`, a type that represents functions from `T` to `void`.
To understand why it should be contravariant, see the code below.
Whenever the user calls `ActionOnComboBox`, the compiler will guarantee that the parameter is of type `ComboBox`.
As all `ComboBox`es are `UIElement`s too, all valid parameters for `ActionOnComboBox` are also valid for `ActionOnUIElement`.
The opposite, though, is not true.
Not all `UIElement`s are `ComboBox`es, so it is not possible to use any valid parameter for `ActionOnUIElement` in `ActionOnComboBox`.

````c#
void ActionOnUIElement(UIElement uiElement) { }
void ActionOnComboBox(ComboBox comboBox) { }
````

Another way to illustrate it is through the code below.
`ComboBox` is a subtype of `UIElement`, so it is OK if `Valid` calls `ActionOnUIElement`.
However, `UIElement` is not a subtype of `ComboBox`, so `Invalid` will not compile.

````c#
void Valid(ComboBox comboBox) =>
    ActionOnUIElement(comboBox);
void Invalid(UIElement uiElement) =>
    ActionOnComboBox(uiElement);
````

For a last case study, let us analyze `Func<T1, T2>`, a function from `T1` to `T2`.
This one is interesting because `Func` is contravariant in regards to `T1`, but it is covariant in regards to `T2`.
The case for it being contravariant in `T1` is roughly the same as for `Action<T>`:
a function which expects parameters of subtype `S` can be replaced by a function that accepts parameters of `T` because every `S` is a valid `T`.

The covariance in `T2` is easier to understand, perhaps because it is frequently used implicitly.
If a function signature claims to return an object of type `T`, it is possible for it to return any of its subtypes also.
This is easily illustrated by the code below.

````c#
UIElement MakeElement() =>
    new ComboBox();
````

Thus, `Func<ComboBox, UIElement>` is a subtype of `Func<UIElement, ComboBox>`.

Summing up:

* `S <: T` and `(C<S>) <: (C<T>)`: `C` is (co)variant (in `T`).
* `S <: T` and `(C<T>) <: (C<S>)`: `C` is contravariant.
* `S <: T`, but no relation between `C<S>` and `C<T>`: `C` is invariant.


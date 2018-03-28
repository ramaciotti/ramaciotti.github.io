---
layout: post
title: Postmortem&#58; Rails for APIs
tags: [postmortems, ruby]
---

I realize I'm a little late to talk about Ruby on Rails and still say something new, but here I go.

In our current project we use Rails as a dumb backend.

Although I like its scaffolding capabilities, I feel they're not _ for APIs.
I described the feeling for my friends with this slogan: "I don't need anything here, and nothing I need is here."

From a technical perspective, I dislike the Active Record approach.
I still think Data Mapper is a better pattern, but ActiveRecord worked well for our use case.

Although Rails calls itself RESTful, there are certain routes that break its RESTfulness.


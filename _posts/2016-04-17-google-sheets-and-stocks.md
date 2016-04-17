---
layout: post
title: Google Sheets, Stocks, and Funds
tags: [finance]
---

Although I'm a developer, I still think spreadsheets are the best tool for certain tasks.
I thought I'd had to giveup my portfolio sheet if I was to automate it, but I was happy to see I was wrong.
With `GOOGLEFINANCE` I'm able to fetch quotes for stocks and funds from Google Finance, so I don't have to type it manually anymore.

You can use it to:

- Fetch an American share/fund price: `GOOGLEFINANCE("GOOG")`.

- Fetch a Brazilian share/fund price: `GOOGLEFINANCE("BVMF:ABEV3")`.

- Fetch conversion rates between currencies: `GOOGLEFINANCE("USDBRL")`.
Keep in mind that it might not be necessary to do any conversion.

Besides the price, this function also allows you to fetch other data.
[Check `GOOGLEFINANCE` documentation][DOC] to see what else you can do.

[DOC]: https://support.google.com/docs/answer/3093281?hl=en

Now I need to find a way to fetch Brazilian bonds data.
Email me if you know a way to do it in Google Sheets.


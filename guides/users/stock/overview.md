# Overview

You can manage your store's stock from the **Stock** page of the Solidus
backend.

The stock interface allows you to search for and filter products and
variants, as well as update whether they are in stock and backorderable when
sold out.

## Stock locations

You can track stock across multiple stock locations if you have them configured.

When you have multiple stock locations, products have a **Count On Hand** value
for each stock location. For example, if you keep all of your T-Shirt products
at *Stock Location A*, your T-Shirts should still have a count on hand of `0` at
*Stock Location B*.

## Product stock filters

You can search and filter products by stock location or variant information:

- The **Stock Location** picker allows you to filter by your store's
  configured stock location.
- The **Variant** search field allows you to enter SKUs or [option
  values][option-types] from the available variants.

[option-types]: option-types.md

## Backorderable stock

When you manage a product's stock, you can set whether a product or variant
should be [backorderable][backorder].

[backorder]: https://www.investopedia.com/terms/b/backorder.asp

## Count on hand

You can change each product's **Count On Hand** value for each [stock
location](#stock-location) that you have configured.

When you change the **Count On Hand** value, you *reset* the number of
items you have in stock from `0`. For example: 

- A stock item has a **Count On Hand** value of `7`.
- You receive 25 new items to add to inventory.
- You now have `7 + 25` items on hand. (`33`.)
- You log into the Solidus backend and change the count on hand from `7` to `33`.


# WegmansCLI

Admin Command Synopsis
======================
```
help    Displays help information about the specified command
quit    quit the application
store   allows the user to do store related actions
   search   search for active stores
       -i, --item-name=<item_name>                    search stores that have a particular item
       -s, --state=<state_abbr>                       search by state abbreviation (i.e MA)
       -t, --times=<start>=<end>[|<start>=<end>...]   4-digit int between 0000-2400 representing 24-hr time
   set     <id>   set your current store
   show           show your current store
browse   allows the user to browse wegmans inventory
   -b, --brand=<brand>                                query by brand name
   -n, --name=<name>                                  search a product by name
   -r, --price-range=<start>=<end>[|<start>=<end>...] A double representing 24-hr time
   -t, --type=<type>                                  the type of product you want to search for
statistics, stats  get statistics about how wegmans2 is doing
   customer-mvp  gets the customer who has spent the most money
   item-sales    get first 3 best or worst items sold
           --rank=TOP|BOT                             either display the top or bottom three items
       -a, --all                                      search all store's best/worst items
   store-sales   gets the customer who has spent the most money
         --rank=TOP|BOT                               display top or bottom store in sales
       -s, --state=<state_abbr>                       narrow sales search to a specific state
```
Customer Command Synopsis
=========================

```
help    Displays help information about the specified command
quit    quit the application
cart    allows the user to do cart based actions
   add       <item_name> <count>                      Add an item to your cart
   remove    <item_name> <count>                      remove an item from your cart
   checkout                                           finalize your purchase
   show      Show the contents of your cart
store   allows the user to do store related actions
   search   search for active stores
       -i, --item-name=<item_name>                    search stores that have a particular item
       -s, --state=<state_abbr>                       search by state abbreviation (i.e MA)
       -t, --times=<start>=<end>[|<start>=<end>...]   4-digit number representing 24-hr time
   set     <id>   set your current store
   show           show your current store
browse     allows the user to browse wegmans inventory
   -b, --brand=<brand>                                query by brand name
   -n, --name=<name>                                  search a product by name
   -r, --price-range=<start>=<end>[|<start>=<end>...] A int between 0000-2400 representing 24-hr time
   -t, --type=<type>                                  the type of product you want to search for
```

### SQL Queries

##### All Users
> These queries can be used by both customers and admins to accomplish the same tasks.

Find a store by an id
```sql
SELECT * FROM Store WHERE id = ?
```

Find all stores that are open between a start time and an end time
```sql
SELECT * FROM Store WHERE openTime >= ? AND closeTime <= ?
```

Find all stores in a given state
```sql
SELECT * FROM Store WHERE state = ?
```

Get all stores that carry a specific product
```sql
SELECT * FROM Store WHERE id IN (SELECT storeID FROM soldBy WHERE productid IN (SELECT upc FROM Product WHERE name = ?))
```

Get all products with a given name
```sql
SELECT * FROM Product WHERE name = ?
```

Get a product with a specific UPC
```sql
SELECT * FROM Product WHERE upc = ?
```

Find all products in a given store with a certain name
```sql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? AND product.name = ? ORDER BY product.name ASC
```

Find all products in a given store within a certain price range
```sql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? AND product.price > ? AND price < ? ORDER BY product.name ASC
```

Find all products within a certain range and are of a certain type (i.e Snack)
```sql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? AND product.price > ? AND price < ? AND type = ? ORDER BY product.name ASC
```

Find all products in a store that are of a certain brand
```sql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? AND brand = ?
```

Find all products in a store that are of a certain type
``ostgresql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? AND type = ? ORDER BY product.name ASC
```

Find all products in a store
```sql
SELECT product.* FROM Product JOIN soldBy ON soldBy.productId = product.upc WHERE soldBy.storeId = ? ORDER BY product.name ASC
```

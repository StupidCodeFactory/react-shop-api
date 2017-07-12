[![wercker status](https://app.wercker.com/status/02c50650497b0495c55c42d3aec4f1ef/s/master "wercker status")](https://app.wercker.com/project/byKey/02c50650497b0495c55c42d3aec4f1ef)

# Instruction

Run the app

```bash
./bin/setup
```

## [ShopingBasket](https://github.com/StupidCodeFactory/react-shop-api/blob/master/app/models/shopping_basket.rb) ##

    Class responsible for managing the shopping basket


### ShopingBasket#new

```ruby
products         = Product.all
jeans            = products.detect {|name| name == 'jeans' }
delivery_charges = DeliveryCharge.all

# a Hash indexed by product code, takes a SpecialOffer as value.
# Currently on one offer is supported but easily could be extended
# to multiple offers per product by passing an array of special offers.
special_offer_catalogue = {
  jeans.code => SpecialOffer.new(
      -> (products) { products.size == 2 }, # called to determine if the discount apply
      -> (products) { products[-1].price_in_cents / 2.0 } # called to apply the discount
    )
  }

basket = ShopingBasket.new(products, delivery_charges, special_offer_catalogue)
```

### ShopingBasket#add

Add a product to the basket, check and apply any discount on the fly.

```ruby
basket.add(jeans.code)
```

### ShopingBasket#total

The the basket's total amount, with discounts applied.


## [SpecialOffer](https://github.com/StupidCodeFactory/react-shop-api/blob/master/app/models/special_offer.rb)

Keeps track of wether to apply a discount. This class is completely independant from the basket.

```ruby

# Both procs are passed in as an argument an array of products
# which have not had a discount applied yet of the same price


# For 3 items purchase
rule = ->(products) { products.length == 3 }

# get 25% discount on all 3 items
price_processor = ->(product) { products.each {|p| p.price -= (p.price / 4 ) } }

price = SpecialOffer.new(rule, price_processor)
price.total # <= makes you customer happy
```


This should serve as a backend for a [React demo app](https://github.com/StupidCodeFactory/react-shop) which is under construction...

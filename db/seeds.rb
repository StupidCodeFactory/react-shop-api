# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create! 'name' => 'Jeans',  'code' => 'JO1', 'price_in_cents' => 3295
Product.create! 'name' => 'Blouse', 'code' => 'JO1', 'price_in_cents' => 2495
Product.create! 'name' => 'Socks',  'code' => 'JO1', 'price_in_cents' => 795

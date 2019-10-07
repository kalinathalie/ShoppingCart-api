# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RegisteredProduct.create(
  [{name: "Banana", prize: 10},
   {name: "Apple", prize: 20},
   {name: "Orange", prize: 30}])

Coupon.create(
  [{code: "AAAAAA", kind: 0, value: 30},
   {code: "FOOOOO", kind: 1, value: 100},
   {code: "CCCCCC", kind: 2, value: 300.5}])
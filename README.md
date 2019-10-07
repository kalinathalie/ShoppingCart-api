# ShoppingCart-API

### Overview

Awesome solution for your online shop cart.

## Api Version: 1.0

## Required
```
bundle install
rails c
Rails.application.load_seed
```

## http://localhost:3000/

## Endpoints

### New Cart

Creates a new purchase and return the `TOKEN`.

```
POST /new_cart
```

##### Params
- `cart`.

#### Exemple

```
curl -H "Content-Type: application/json" -X POST http://localhost:3000/new_cart -d '{"cart":"PASS_HERE"}'
```

### Update products on the cart

Creates or update a purchased product by name with kilogram on user cart.

```
POST /cart/update
```

##### Params
- `token`,
- `name`,
- `kilogram`.

##### Exemple
```
curl -H "Content-Type: application/json" -X POST http://localhost:3000/cart/update -d '{"token":"eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjpudWxsfQ.3hmEUP1dHMsEVrMm8gKb-GHyM2mKwAL5J9QbnYyrNzY", "name":"Banana", "kilogram":"5.0"}'
```

### Add Coupon

Add a valid coupon to purchase by the code.

```
POST /cart/add_coupon
```

##### Params
- `token`,
- `code`.

##### Exemple
```
curl -H "Content-Type: application/json" -X POST http://localhost:3000/cart/add_coupon -d '{"token":"eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjpudWxsfQ.3hmEUP1dHMsEVrMm8gKb-GHyM2mKwAL5J9QbnYyrNzY", "code":"Banana", "code":"FOOOOO"}'
```

### Finish the checkout and get calculations

```
POST /cart/finish
```

##### Params
- `token`.

##### Exemple
```
curl -H "Content-Type: application/json" -X POST http://localhost:3000/cart/finish -d '{"token":"eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjpudWxsfQ.3hmEUP1dHMsEVrMm8gKb-GHyM2mKwAL5J9QbnYyrNzY"}'
```
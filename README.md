# Jungle

A mini online store where users can browse and buy plants! It’s a full-stack Ruby on Rails app. This project was initially provided as a base — I worked on fixing bugs and adding new functionality and validations to improve user experience.

## Table of Contents

- [Setup](#setup)
- [Database](#database)
- [Features](#features)
- [Testing](#testing)
- [Dependencies](#dependencies)
- [Dependencies](#dependencies)
- [Currently working on](#currently-working-on)
- [Final product](#currently-working-on)

## Setup

1. Clone this repo
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rails db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Features

- You can see all available plants with name, price, and stock info or search by category
- If an item is not available you'll see a **Sold Out** badge and the "Add" button will be disabled
- View detailed info for each plant including descriptions when you click on each item.
- Add one or many plants to your cart
- Modify your order directly from your cart
- Checkout via Stripe (test mode)
- If your cart is empty you'll get a friendly message and a link back to the home page
- After placing an order, users see an order summary with their order number, total cost, and associated email
- User authentication (registration & login) using bcrypt — though login isn't required to use features

### Admin

- Admins can manage products and categories.
- View a dashboard with total counts for products and categories.
- Protected by HTTP basic authentication to keep things secure.

## Testing

- Unit tests using **RSpec**
- End-to-end testing with **Cypress**

To run the RSpec tests:
`bundle exec rspec`

To run Cypress (you may need to start the server in another terminal):
`bin/rails cypress:init`
`bin/rails cypress:open`

## Dependencies

- **Ruby** & **Ruby on Rails**
- **PostgreSQL**
- **Puma** (App server)
- **Sass-Rails**, **Webpacker**
- **Bootstrap** + **Font Awesome**
- **Money Rails** (for currency handling)
- **BCrypt** (for secure authentication)
- **Stripe** API for payments (test mode)

## Currently working on

- Email confirmation after placing an order using action mailer
- Product ratings
- Inventory adjustments

## Final product
!["Home page"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Homepage.png)
!["Register"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Register.png)
!["Login"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Login-page.png)
!["Category list"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Product-list.png)
!["Product detail"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Product-details.png)
!["My cart"](https://github.com/alemolina43/jungle-rails/blob/master/docs/My-cart.png)
!["Order page"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Order-details.png)
!["Admin product list"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Admin-all-products.png)
!["Admin categories"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Admin-all-categories.png)
!["Stripe checkout"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Stripe-checkout.png)
!["Empty cart alert message"](https://github.com/alemolina43/jungle-rails/blob/master/docs/Empty-cart.png)

# Bertram Beans
---
Bertram Beans is the latest in pay determining technology. With this product you can add you and your coworkers, your favorite beverages and their cost, associate those beverages with you and your coworkers, and even determine whose turn it is to pay with our sophisticated pay determining algorithm.

## Technologies
---
- [Ruby](https://www.ruby-lang.org/en/) 2.7.5
- [Rails](https://rubyonrails.org/) 7.0.8
- [PostgreSQL](https://www.postgresql.org/)

## Setup
---
The following steps are required to instantiate the application locally:
- `git clone` this repository into the directory of your choice, then navigate to the root of the cloned repository
- run `bundle install` in your terminal to install all dependencies for the project
- run `rails db:create` in your terminal to create the database
- run `rails db:migrate` in your terminal to run migrations
- run `rails s` in your terminal to spin up a local server

## Functionality
---
#### Navigating Home
At any point, you may click on Bertram Beans in the navbar to return to the homepage

#### Adding Coworkers
Adding coworkers is foundational to the Bertram Beans experience. This can be done by:
- navigating to the add coworker form by clicking `add a coworker` in the navbar
- once there, the form will prompt you to enter your or a coworker's name, the names must be unique, so if it's already taken try including a last initial.
- click submit to create the coworker

#### Adding Beverages
Adding a Beverage is similar to adding a coworker:
- navigating to the add beverage form by clicking `add a beverage` in the navbar
- once there, the form will prompt you to enter the name of the beverage, the names must be unique
- the form will also prompt you to add the cost of the beverage. You can enter this manually by typing, or use the included incrementer. The currency is USD.
- click create to submit the beverage

#### Adding an Order
Adding an order is similar in functionality, minus the typing:
- navigating to the add order form by clicking `add a coworker's order` in the navbar
- once there, you will be able to find two drop downs, one to select the coworker, and one to select their beverage
- click submit to create the order
Not finding yourself or your coworker? Either you haven't created them/you via create a coworker, or you've already associated the worker with an order (a worker may only be associated with one beverage currently)

#### Determine Payer
Clicking the `determine payer` link in the navbar will navigate you to a page that returns whose turn it is to pay, and also provide them with a receipt of everyone's order, and the grand total. By clicking the `determine payer` link again, or the `see you tomorrow` link at the bottom of the receipt you may determine the next person's turn to pay.

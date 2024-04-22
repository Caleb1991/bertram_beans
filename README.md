# Bertram Beans
---
Bertram Beans is the latest in pay determining technology. With this product you can add you and your coworkers, your favorite beverages and their cost, associate those beverages with you and your coworkers, and even determine whose turn it is to pay with our sophisticated pay determining algorithm.

## Technologies
---
- [Ruby](https://www.ruby-lang.org/en/) 2.7.5
- [Rails](https://rubyonrails.org/) 7.0.8
- [PostgreSQL](https://www.postgresql.org/)
- [RSpec](https://rspec.info/) 6.1.1

## Setup
---
The following steps are required to instantiate the application locally:
- `git clone` this repository into the directory of your choice, then navigate to the root of the cloned repository
- run `bundle install` in your terminal to install all dependencies for the project
- run `rails db:create` in your terminal to create the database
- run `rails db:migrate` in your terminal to run migrations
- run `rails s` in your terminal to spin up a local server

## Prepopulate Data
---
Running short on time? To bypass having to create a number of coworkers/beverages/orders you can simply run `rails db:seed` in your terminal while in the root directory of the repository and it will add a number of cowrkers/beverages/orders.

## Functionality
---
### Home Page

#### Navigating Home
At any point, you may click on Bertram Beans in the navbar to return to the homepage

### Coworkers

#### Adding Coworkers
Adding coworkers is foundational to the Bertram Beans experience. This can be done by:
- navigating to the add coworker form by clicking `add a coworker` in the navbar
- once there, the form will prompt you to enter your or a coworker's name, the names must be unique, so if it's already taken try including a last initial.
- click submit to create the coworker

#### Deleting Coworkers
If at any time you need to delete a coworker (that feels weird typing) or just want to see a list of all of the coworkers currently in the system, the footer at the bottom of the page contains a link titled `all coworkers` clicking on it will navigate you to the coworker index with a list of all current coworkers. Clicking delete on one will delete them and their associated drink order.

### Beverages

#### Adding Beverages
Adding a Beverage is similar to adding a coworker:
- navigating to the add beverage form by clicking `add a beverage` in the navbar
- once there, the form will prompt you to enter the name of the beverage, the names must be unique
- the form will also prompt you to add the cost of the beverage. You can enter this manually by typing, or use the included incrementer. The currency is USD.
- click create to submit the beverage

#### Deleting Beverages
Similar to coworkers, if at any time you need to delete a beverage or just want to see a list of all of the coworkers currently in the system, the footer at the bottom of the page contains a link titled `all beverages`. Clicking on it will navigate you to the beverage index with a list of all current beverages. Clicking delete on one will delete it and any coworker's order they are currently associated with.

### Orders

#### Adding an Order
Adding an order is similar in functionality, minus the typing:
- navigating to the add order form by clicking `add a coworker's order` in the navbar
- once there, you will be able to find two drop downs, one to select the coworker, and one to select their beverage
- click submit to create the order

Not finding yourself or your coworker? Either you haven't created them/you via create a coworker, or you've already associated the worker with an order (a worker may only be associated with one beverage currently)

### Payer

#### Determine Payer
Clicking the `determine payer` link in the navbar will navigate you to a page that returns whose turn it is to pay, and also provide them with a receipt of everyone's order, and the grand total. By clicking the `determine payer` link again, or the `see you tomorrow` link at the bottom of the receipt you may determine the next person's turn to pay.

## Testing
---
Betram's Beans currently utilizes RSpec and two other gems (capybara and shoulda-matchers) to provide a suite of unit and fucntional testing. To run the tests navigate to the root of the repository and simply type `rspec` into the terminal. Entering the command will run all of the tests and return whether or not they have passed. You can refine your test running by providing the file path/directory as follows `rspec <file_path>`.

## Further Iterations
---
While I am proud of the current state of the application, Bertram's Beans has an eye to the future. Further functionality and refinement is as follows:
- Only returning one payer for the day, and providing a list of the upcoming payers
- Move forms to modals, and have them appear on the homepage when clicking the associated link in the navbar rather than navigating to a page
- expand upon index pages for both beverages and coworkers, implementing better styling
- add order page that lists all of the current orders and add the functionality to delete them
- ability to edit all items (coworkers/beverages/orders)
- when removing a coworker, if they have any remaining cost burden, they must pay out and that is distributed to the remaining employees
- when a beverage is removed, the affected coworkers are notified to select another drink

## Assumptions When Creating This Product
---
As I was working through this product the following assumptions were made:
- coworkers would only be associated with one drink
- coworkers would not have food items with their drink
- the currency was in USD

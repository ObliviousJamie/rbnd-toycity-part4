require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes
@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

def db_seed
  # Your code goes here!
   10.times do
       brand = Faker::Commerce.department(1)
       name = Faker::Commerce.product_name
       price = Faker::Commerce.price
       Product.create(brand:brand ,name:name ,price:price) 
   end
end

require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
    @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

    #Methods called on self
    class << self

        def create(attributes = nil)
            #New product created
            product = self.new attributes
            #Product written to file
            #puts product.name
            CSV.open(@@data_path, "ab") do |csv|
                csv << [product.id,product.brand,product.name, product.price]
            end
            return product
        end

        def all
            items = Array.new
            CSV.foreach(@@data_path, headers: true) do |row|
                id = row['id']
                brand = row['brand']
                name = row['name']
                price = row['price']
                items << self.new(id:id, brand:brand, name:name, price:price)
            end
            return items
        end

        def first(number = 1)
            number == 1 ? result = all.first : result = all.take(number)
            return result
        end

        def last(number = 1)
            number == 1 ? result = all.last : result = all.last(number)
        end
    end

    private


end

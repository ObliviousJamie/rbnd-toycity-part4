require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
    attr_reader :name, :brand
    @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

    #Methods called on self
    class << self

        def create(attributes = nil)
            #New product created
            product = self.new attributes
            #Product written to file
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
                name = row['product']
                price = row['price']
                items << self.new(id:id, brand:brand, name:name, price:price)
            end
            return items
        end

        create_finder_methods("brand","name")

        def first(number = 1)
            number == 1 ? result = all.first : result = all.take(number)
            return result
        end

        def last(number = 1)
            number == 1 ? result = all.last : result = all.last(number)
        end

        def find(id)
            all.select{|item| item.id == id}[0]
        end

        def destroy(number)
            data = latest_data
            killed = nil
            data.delete_if{|item| item["id"] == number.to_s && killed = item}
            rewrite(data)
            return Product.new(id:killed['id'],brand:killed['brand'],name:killed['name'], price:killed['price'])
        end


        #def find_by_brand(brand)
        #    all.select{|item| item.brand == brand}[0]
        #end

        #def find_by_name(name)
        #    all.select{|item| item.name == name}[0]
        #end

        private
        #Reads the latest information from CSV
        def latest_data
            CSV.read(@@data_path,headers: true)
        end

        #Rewrites the file with new data
        def rewrite(data)
            CSV.open(@@data_path, "wb") do |csv|
                csv << ["id", "brand", "product", "price"]
                data.each do |item|
                    csv << item
                end
            end
        end
    end

    private




end

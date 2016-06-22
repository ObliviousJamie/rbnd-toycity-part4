require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
    @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

    def self.create(options={})
        #New product created
        product = self.new(options)
        #Product written to file
        CSV.open(@@data_path, "a+") do |csv|
            csv << [product.id,product.brand,product.name, product.price]
        end
        return product
    end

end

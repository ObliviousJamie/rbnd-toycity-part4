module Analyzable
    # Your code goes here!
    def average_price(array)
        (array.inject(0){|sum,n| sum + (n.price).to_f}/array.size.to_f).round(2)
    end

    def print_report(products)
        report = ""
        brand = count_by_brand products
        name = count_by_name products
        
        report << "Inventory by brand:\n"

        brand.each do |key, value|
            report << "  - #{key}: #{value}\n"
        end
        
        report << "Inventory by name:\n"

        name.each do |key, value|
            report << "  - #{key}: #{value}\n"
        end
        return report

    end

    def count_by_name(products)
        make_hash(products,"name")
    end

    def count_by_brand(products)
        make_hash(products,"brand")
    end

    private

    def make_hash(products, key)
        hash = Hash.new(0)
        products.each do |item|
            converted_key = item.send key.to_sym
            hash[converted_key] += 1
            return hash
        end
    end


end

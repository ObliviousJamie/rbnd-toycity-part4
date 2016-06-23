class Module
  def create_finder_methods(*attributes)
      attributes.each do |attribute|
        finder = %Q{
            def find_by_#{attribute}(value)
                self.all.each{|item| return item if item.#{attribute} == value}
            end
        }
        self.class_eval finder
      end
  end
end

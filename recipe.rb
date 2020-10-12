class Recipe
    attr_reader :name, :description, :prep_time, :done, :rating
  
    def initialize(attributes = {})
      @name = attributes[:name]
      @description = attributes[:description]
      @prep_time = attributes[:prep_time]
      @done = attributes[:done]
      @rating = attributes[:rating]
    end
  
    def done?
      @done
    end
  
    def mark_recipe_as_done!
      @done = "done"
    end
  end
  
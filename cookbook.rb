require 'csv'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []

    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # storing in the Ruby world (array)
    @recipes << recipe

    # also store in the CSV
    store_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    store_csv
  end

  def find(index)
    @recipes[index]
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new( name: row[0], description: row[1], prep_time: row[2], done: row[3], rating: row[4] )
    end
  end

  def store_csv
    csv_options = { force_quotes: true, quote_char: '"', col_sep: ',' }

    CSV.open(@csv_file, "wb", csv_options) do |csv_file|
      @recipes.each do |recipe|
        csv_file << [recipe.name, recipe.description, recipe.prep_time, recipe.done, recipe.rating]
      end
    end
  end
end

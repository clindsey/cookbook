namespace :recipes do
  desc 'parse recipe yaml and generate page'
  task :add, :recipe_name do |t, args|
    puts "Inserting new recipe"

    require 'yaml'

    recipe_file = YAML::load(File.open("recipes/#{args[:recipe_name]}.yaml"))
    puts recipe_file["title"]

    require './app'

    recipe = Recipe.new :title => recipe_file["title"],
                        :date => recipe_file["date"],
                        :description => recipe_file["description"]
    recipe_file["categories"].each do |category_title|
      category = Category.first_or_create :title => category_title
      if category.valid?
        recipe.categories << category
      else
        "Failed to auto add category!"
      end
    end
    recipe_file["ingredients"].each do |ingredient_body|
      ingredient = Ingredient.create :body => ingredient_body
      recipe.ingredients << ingredient
    end
    recipe_file["directions"].each do |direction_body|
      direction = Direction.create :body => direction_body
      recipe.directions << direction
    end
    if recipe.valid?
      puts recipe.save!
      puts "Added recipe!"
    else
      puts "Failed to add recipe!"
    end
  end

  desc 'list all recipes'
  task :list do
    puts "Listng all recipes..."

    require './app'

    Recipe.all.each do |recipe|
      puts "#{recipe.slug}"
    end
  end
end

namespace :categories do
  desc "list all categories"
  task :list do
    puts "Listing all categories..."

    require './app'

    Category.all.each do |category|
      puts "#{category.title}"
    end
  end

  desc 'add category'
  task :add, :title do |t, args|
    title = args[:title]

    puts "Inserting new category - #{title}"

    require './app'

    category = Category.new :title => title
    if category.valid?
      puts c.save!
      puts "Added category!"
    else
      puts "Failed to add category!"
    end
  end
end


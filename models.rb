require 'rubygems'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/db/cookbook.db")

class Recipe
  include DataMapper::Resource

  property :title, String, :required => true
  property :slug, String, :required => true, :key => true
  property :date, String
  property :description, Text

  has n, :ingredients
  has n, :directions
  has n, :categorizations
  has n, :categories, :through => :categorizations

  before :valid? do
    self.slug = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

class Ingredient
  include DataMapper::Resource

  property :id, Serial
  property :body, String

  belongs_to :recipe
end

class Direction
  include DataMapper::Resource

  property :id, Serial
  property :body, String

  belongs_to :recipe
end

class Category
  include DataMapper::Resource

  property :title, String, :required => true
  property :slug, String, :required => true, :key => true

  has n, :categorizations
  has n, :recipes, :through => :categorizations

  before :valid? do
    self.slug = self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

class Categorization
  include DataMapper::Resource

  belongs_to :category, :key => true
  belongs_to :recipe, :key => true
end

DataMapper.finalize

Recipe.auto_migrate! unless Recipe.storage_exists?
Ingredient.auto_migrate! unless Ingredient.storage_exists?
Direction.auto_migrate! unless Direction.storage_exists?
Category.auto_migrate! unless Category.storage_exists?
Categorization.auto_migrate! unless Categorization.storage_exists?

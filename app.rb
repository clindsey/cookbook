require 'rubygems'
require 'sinatra'
require './models'

# index, recipes/index
get '/' do
  @recipes = Recipe.all
  @categories = Category.all
  erb :"recipes/index"
end

get '/categories/:category_id' do
  category = Category.get params[:category_id]
  @recipes = category.nil? ? [] : category.recipes
  @categories = Category.all
  @category_title = category.title
  erb :"recipes/index"
end

get '/categories/?' do
  redirect '/cookbook'
end

# index, redirect
get '/recipes/?' do
  redirect '/cookbook'
end

# recipes/show
get '/recipes/:recipe_id' do
  @recipe = Recipe.get params[:recipe_id]
  erb :"recipes/show"
end

helpers do
  def partial(template, *args)
    options = args.last.is_a?(Hash) ? args.last : {}
    options.merge!(:layout => false)
    if collection = options.delete(:collection) then
      collection.inject([]) do |buffer, member|
        buffer << erb(template, options.merge(
                                  :layout => false,
                                  :locals => {template.to_s.split('/').last.gsub('_','').to_sym => member}
                                )
                      )
      end.join("\n")
    else
      erb template, options
    end
  end
end

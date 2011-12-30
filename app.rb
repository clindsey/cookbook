require 'rubygems'
require 'sinatra'
require './models'

# index, recipes/index
get '/' do
  @recipes = Recipe.all
  erb :"recipes/index"
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

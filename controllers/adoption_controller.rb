require( 'sinatra')
require( 'sinatra/contrib/all')if development?
require_relative( '../models/adoption.rb')
require_relative('../models/animal.rb')
require_relative('../models/hero.rb')


get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

get '/adoptions/:id' do
  @adoption = Adoption.find_by_id(params[:id])
  erb(:"adoptions/show")
end

get '/adoptions/new' do
  @adoptions = Adoption.all
  @heroes = Hero.all
  @animals = Animal.all
  erb(:"adoptions/new")
end

post '/adoptions' do
  @animals = Animal.all()
  @heroes = Hero.all()
  erb(:"adoptions/new")
end

post '/adoptions/:id' do
  adoption = Adoption.new(params)
  adoption.update
  redirect to "/adoptions/#{params['id']}"
end

post '/adoptions' do
  Adoption.new(params).save
  redirect to '/adoptions'
end

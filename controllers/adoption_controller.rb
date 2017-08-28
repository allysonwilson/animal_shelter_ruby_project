require( 'sinatra')
require( 'sinatra/contrib/all')if development?
require_relative( '../models/adoption.rb')
require_relative('../models/animal.rb')
require_relative('../models/hero.rb')


get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/all")
end

post '/adoptions/new' do
  @animals = Animal.all()
  @heroes = Hero.all()
  erb(:"adoptions/new")
end

post '/adoptions/:id' do
  adoption = Adoption.new(params)
  adoption.update
  redirect to "/adoptions/#{params['id']}"
end

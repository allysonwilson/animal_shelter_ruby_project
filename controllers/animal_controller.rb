require('sinatra')
require('sinatra/contrib/all')if development?
require_relative('../models/animal.rb')

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

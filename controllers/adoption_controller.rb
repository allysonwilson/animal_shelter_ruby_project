require( 'sinatra')
require( 'sinatra/contrib/all')
require_relative( '../models/adoption.rb')
require_relative('../models/animal.rb')
require_relative('../models/hero.rb')
require( 'pry-byebug' )

get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

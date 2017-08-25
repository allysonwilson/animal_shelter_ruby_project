require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/hero.rb' )

get '/heroes' do
  @heroes = Hero.all()
  erb ( :"heroes/index" )
end

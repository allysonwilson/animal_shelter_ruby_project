require( 'sinatra' )
require( 'sinatra/contrib/all' )if development?
require_relative( '../models/hero.rb' )

get '/heroes' do
  @heroes = Hero.all()
  erb ( :"heroes/index" )
end

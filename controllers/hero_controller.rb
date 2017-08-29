require( 'sinatra' )
require( 'sinatra/contrib/all' )if development?
require_relative( '../models/hero.rb' )

get '/heroes' do
  @heroes = Hero.all()
  erb ( :"heroes/index" )
end

get '/heroes/new' do
  @heroes = Hero.all()
  erb ( :"heroes/new" )
end

post '/heroes/:id' do
  hero = Hero.new(params)
  hero.update
  redirect to "/heroes/#{params['id']}"
end

post '/heroes' do
  Hero.new(params).save
  redirect to '/heroes'
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/genre')

get '/genres/new' do
  @genres = Genre.all()
  erb(:"genres/new")
end

get '/genres' do
  @genres = Genre.all()
  erb(:"genres/show")
end

post '/genres' do
  Genre.new(params).save
  redirect to '/albums'
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/artist')

get '/artists/new' do
  @artists = Artist.all()
  erb(:"artists/new")
end

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/show")
end

post '/artists' do
  Artist.new(params).save
  redirect to '/albums'
end

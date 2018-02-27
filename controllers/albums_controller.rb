require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/album')
require_relative('../models/artist')
require_relative('../models/genre')

get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  erb(:"albums/index")

end

get '/albums/new' do
  @genres = Genre.all()
  @artists = Artist.all()
  erb(:"albums/new")
end
#
post '/albums' do
  Album.new(params).save
  redirect to '/albums'
end
#
get '/albums/:id' do
  @artists = Artist.all()
  @genres = Genre.all()
  @albums = Album.find_by_id(params['id'])
  erb(:"albums/show")
end

get '/albums/:id/edit' do
  @artists = Artist.all()
  @genres = Genre.all()
  @albums = Album.find_by_id(params['id'])
  erb(:"albums/edit")
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end

post '/albums/:id/delete' do
  album = Album.find_by_id(params['id'])
  album.delete
  redirect to '/albums'
end

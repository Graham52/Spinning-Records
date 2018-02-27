require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/albums_controller.rb')
require_relative('controllers/artists_controller.rb')
require_relative('controllers/genres_controller.rb')

get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  # erb(:show)
  erb(:"albums/index")

end

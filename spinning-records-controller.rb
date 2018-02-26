require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./models/album')
require_relative('./models/artist')

# get '/' do
#   erb(:index)
# end

get '/albums' do
  @albums = Album.all()
  @artists = Artist.all()
  # erb(:show)
  erb(:"albums/index")

end

get '/show_artists' do
  @artists = Artist.all()
  erb(:show_artists)
end
# get '/students' do
#   @students = Student.all
#   erb(:index)
# end
#
get '/albums/new' do
  # @albums = Album.all
  @artists = Artist.all()
  erb(:"albums/new")
end
#
post '/albums' do
  Album.new(params).save
  redirect to '/albums'
end
#
get '/artists/new' do
  # @albums = Album.all
  @artists = Artist.all()
  erb(:"artists/new")
end

post '/artists' do
  Artist.new(params).save
  redirect to '/albums'
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'])
  erb(:show)
end
#
# get '/albums/:id/edit' do
#   @artist = Artist.all
#   @albums = Albums.find_by_id(params['id'])
#   erb(:edit)
# end
#
post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end
#
# post '/albums/:id/delete' do
#   album = Album.find_by_id(params['id'])
#   album.delete
#   redirect to '/albums'
# end

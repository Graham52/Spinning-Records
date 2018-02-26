require_relative( "../models/album.rb" )
require_relative( "../models/artist.rb" )
require("pry-byebug")

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({
  "name" => "Madonna"
})

artist1.save()

artist2 = Artist.new({
  "name" => "Dire Straits"
})

artist2.save()

album1 = Album.new({
  "name" => "True Blue",
  "quantity" => 6,
  "artist_id" => artist1.id
})

album1.save()

album2 = Album.new({
  "name" => "Bothers in Arms",
  "quantity" => 12,
  "artist_id" => artist2.id
})

album2.save()

album3 = Album.new({
  "name" => "On Every Street",
  "quantity" => 8,
  "artist_id" => artist2.id
})

album3.save()

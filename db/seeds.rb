require_relative( "../models/album.rb" )
require_relative( "../models/artist.rb" )
require_relative( "../models/genre.rb" )
require("pry-byebug")

Album.delete_all()
Artist.delete_all()
Genre.delete_all()


artist1 = Artist.new({
  "name" => "Madonna"
})

artist1.save()

artist2 = Artist.new({
  "name" => "Dire Straits"
})

artist2.save()

genre1 = Genre.new({
  "type" => "Rock"
  })

genre1.save()

genre2 = Genre.new({
  "type" => "Pop"
  })

genre2.save()

album1 = Album.new({
  "name" => "True Blue",
  "quantity" => 6,
  "artist_id" => artist1.id,
  "buy_price" => 2,
  "sell_price" => 6,
  "genre_id" => genre2.id
})

album1.save()

album2 = Album.new({
  "name" => "Bothers in Arms",
  "quantity" => 12,
  "artist_id" => artist2.id,
  "buy_price" => 3,
  "sell_price" => 5,
  "genre_id" => genre1.id
})

album2.save()

album3 = Album.new({
  "name" => "On Every Street",
  "quantity" => 8,
  "artist_id" => artist2.id,
  "buy_price" => 2,
  "sell_price" => 7,
  "genre_id" => genre1.id
})

album3.save()

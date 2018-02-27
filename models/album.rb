require_relative( '../db/sql_runner' )

class Album

  attr_accessor(:name, :quantity, :artist_id, :buy_price, :sell_price, :genre_id )
  attr_reader(:id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
    @genre_id = options['genre_id'].to_i
  end


  def save()
      sql = "INSERT INTO albums
      (
        name,
        quantity,
        artist_id,
        buy_price,
        sell_price,
        genre_id
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6
      )
      RETURNING id"
      values = [@name, @quantity, @artist_id, @buy_price, @sell_price, @genre_id]
      album = SqlRunner.run(sql, values)
      @id = album.first()['id'].to_i
    end

    def update()
        sql = "UPDATE albums
        SET
        (
          name,
          quantity,
          artist_id,
          buy_price,
          sell_price,
          genre_id
        ) =
        (
          $1, $2, $3, $4, $5, $6
        )
        WHERE id = $7"
        values = [@name, @quantity, @artist_id, @buy_price, @sell_price, @genre_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.all()
    sql = "
      SELECT * FROM albums;
    "
    all_albums = SqlRunner.run(sql).map { |album| Album.new(album) }
    return all_albums
  end

  def self.find_by_id(id)
  sql = "
    SELECT * FROM albums
    WHERE id = #{id};
  "
  album = SqlRunner.run(sql)[0]
  return Album.new(album)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def stock_level()
    if @quantity > 20
      return "High"
    elsif @quantity > 10
      return "Medium"
    else
      return "Low"
    end
  end

def profit_level()
  profit = @sell_price - @buy_price
  return profit.to_i
end

end

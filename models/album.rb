require_relative( '../db/sql_runner' )

class Album

  attr_accessor ( :artist_id )
  attr_reader( :name, :quantity, :id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end


  def save()
      sql = "INSERT INTO albums
      (
        name,
        quantity,
        artist_id
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING *;"
      values = [@name, @quantity, @artist_id]
      album = SqlRunner.run(sql, values)
      @id = album.first()['id'].to_i
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
  return album
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
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

end
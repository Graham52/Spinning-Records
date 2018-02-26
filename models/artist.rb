require_relative( '../db/sql_runner' )

class Artist

    attr_accessor( :name, :id )

    def initialize( options )
      @id = nil || options['id'].to_i
      @name = options['name']
    end

    def save()
      sql = "INSERT INTO artists
      (
        name
      )
      VALUES
      (
        $1
      )
      RETURNING *;"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
      # @id = SqlRunner.run(sql)[0]['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM artists;"
      all_artists = SqlRunner.run(sql).map { |artist| Artist.new(artist) }
      return all_artists
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM artists WHERE id = #{id};"
      artists = SqlRunner.run(sql)[0]
      return artist
    end

    def self.artist(id)
      sql = "SELECT name FROM artists WHERE id = #{id};"
      artist = SqlRunner.run(sql)[0]
      return artist
    end

    def self.delete_all
      sql = "DELETE FROM artists"
      SqlRunner.run( sql )
    end

   def self.artist_name(id)
     sql = "SELECT name FROM artists WHERE id = #{id};"
     artist_name = SqlRunner.run(sql)[0]["name"]
     return artist_name
   end

end

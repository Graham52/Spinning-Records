require_relative( '../db/sql_runner' )

class Genre

    attr_accessor( :type, :id )

    def initialize( options )
      @id = nil || options['id'].to_i
      @type = options['type']
    end

    def save()
      sql = "INSERT INTO genres
      (
        type
      )
      VALUES
      (
        $1
      )
      RETURNING id"
      values = [@type]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
      # @id = SqlRunner.run(sql)[0]['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM genres;"
      all_genres = SqlRunner.run(sql).map { |genre| Genre.new(genre) }
      return all_genres
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM genres WHERE id = #{id};"
      genre = SqlRunner.run(sql)[0]
      return genre
    end

    def self.genre(id)
      sql = "SELECT type FROM genres WHERE id = #{id};"
      genre = SqlRunner.run(sql)[0]
      return genre
    end

    def self.delete_all
      sql = "DELETE FROM genres"
      SqlRunner.run( sql )
    end

   def self.genre_type(id)
     sql = "SELECT type FROM genres WHERE id = #{id};"
     genre_type = SqlRunner.run(sql)[0]["type"]
     return genre_type
   end

end

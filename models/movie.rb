require_relative("../db/sql_runner")

class Movie
attr_reader :id
attr_accessor :title, :genre

  def initialize(options)
    @id = options ['id'].to_i if options ['id']
    @title = options ['title']
    @genre = options [ 'genre']
  end

  def save
    sql = 'INSERT INTO movies (title, genre) VALUES ($1, $2) RETURNING id'
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def find_star
    sql = 'SELECT stars.*, movies.title FROM stars
    INNER JOIN castings
    ON stars.id = castings.star_id
    INNER JOIN movies
    WHERE movie_id = $1'
    values =
  end
end

require_relative("../db/sql_runner")

class Movie
  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def update()
    sql = "UPDATE movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM movies where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  def stars()
    sql ="SELECT stars.* FROM stars
    INNER JOIN castings
    on castings.star_id = star_id  WHERE movie_id = $1
     "
     values = [@id]
     stars = SqlRunner.run(sql, values)
     result =stars.map{|star| Star.new(star)}
     return result 
  end


  # class methods:
  def self.all()
    sql = "SELECT * FROM movies"
    movie_data = SqlRunner.run(sql)
    return Movie.map_items(movie_data)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|movie| Movie.new(movie)}
    return result
  end

end

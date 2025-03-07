module MoviesHelper
  def day_and_time(movie)
    movie.released_on.strftime("%Y")
  end

  def truncate_title(movie)
    truncate(movie.description, length: 40, separator: " ")
  end
end

module MoviesHelper
  def year_of(movie)
    movie.released_on.strftime("%Y")
  end

  def truncate_title(movie)
    truncate(movie.description, length: 40, separator: " ")
  end
end

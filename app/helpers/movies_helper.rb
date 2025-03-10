module MoviesHelper
  def year_of(movie)
    movie.released_on.strftime("%Y")
  end

  def truncate_title(movie)
    truncate(movie.description, length: 40, separator: " ")
  end

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No reviews")
    else
      "*" * movie.average_stars.round
    end
  end
end

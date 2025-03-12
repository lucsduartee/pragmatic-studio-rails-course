module FavoritesHelper
  def fave_or_unfave_button(movie, favorite)
    if favorite
      button_to "</3 Unfave", movie_favorites_path(movie, favorite), method: :delete
    else
      button_to "<3 Fave", movie_favorites_path(movie)
    end
  end
end

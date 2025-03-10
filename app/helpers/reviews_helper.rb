module ReviewsHelper
  def stars_as_percent
    (stars / 5.0) * 100.0
  end
end

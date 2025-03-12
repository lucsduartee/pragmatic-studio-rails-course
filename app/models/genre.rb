class Genre < ApplicationRecord
  has_many :characterizations, dependent: :destroy
  has_many :movies, through: :characterizations

  validates :genre, presence: true, uniqueness: true
end
Genre.create(genre: "Action")
Genre.create(genre: "Comedy")
Genre.create(genre: "Drama")
Genre.create(genre: "Romance")
Genre.create(genre: "Thriller")
Genre.create(genre: "Fantasy")
Genre.create(genre: "Documentary")
Genre.create(genre: "Adventure")
Genre.create(genre: "Animation")
Genre.create(genre: "Sci-Fi")

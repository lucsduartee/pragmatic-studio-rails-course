class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)

    if @review.save
      redirect_to [ @movie, @review ], notice: "tks for review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end

class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :require_signin

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
    @review.user = current_user

    if @review.save
      redirect_to [ @movie, @review ], notice: "tks for review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end

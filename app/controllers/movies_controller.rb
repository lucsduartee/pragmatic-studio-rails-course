class MoviesController < ApplicationController
  def index
    # case params[:filter]
    # when "upcoming"
    #   @movies = Movie.upcoming
    # when "recent"
    #   @movies = Movie.recent
    # else
    #   @movies = Movie.released
    # end

    # isso aqui embaixo é ruim, pois podem mandar um delete_all como filtro
    # if params[:filter]
    # @movies = Movie.send(params[:filter])
    # else
    # @movies = Movie.released
    # end
    # O ideal é fazer o seguinte
    @movies = Movie.send(movies_filter)
  end

  def show
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
    @genres = @movie.genres.order(:name)

    if current_user
      @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      # flash[:notice] = "Movie succesfully updated!"
      redirect_to @movie, notice: "Movie succesfully updated!"
    else
      render :edit, status: :unprocessable_entity; return
    end

    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie succesfully created!"
    else
      render new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy


    redirect_to movies_url, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross, :description, :released_on,
                                  :duration, :director, :image_file_name, genre_ids: [])
  end

  def movies_filter
    if params[:filter].in? %w[upcoming recent hits flops]
      params[:filter]
    else
      :released
    end
  end
end

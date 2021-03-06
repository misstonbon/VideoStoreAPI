class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies,
    status: :ok
  end

  def show
    movie = Movie.find_by(title: params[:id])
    if movie
      render json: movie, status: :ok
    else
      render json: {ok: false}, status: :not_found
    end
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: movie, status: :ok
    else
      render json: {errors: movie.errors.messages},
      status: :bad_request
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :release_date, :inventory)
  end
end

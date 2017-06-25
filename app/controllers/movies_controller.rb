class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

  def search
    movie = Movie.find_by(title: params[:title].downcase)
    if movie
      redirect_to "/#{'#'+ movie.title.downcase}"
    else
      flash[:err] = 'Sorry, could not find movie'
      redirect_to :back
    end
  end

  def create
  	movie = Movie.create(title: params[:title].downcase, storyline: params[:storyline], release: params[:release], genre: params[:genre], imdb: params[:imdb] )
  	if movie.valid?
  		redirect_to :back
  	else
  		flash[:errors] = movie.errors.full_messages 
		redirect_to :back
	end
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	movie = Movie.find(params[:id])
  	movie.update_attributes(title: params[:title], storyline: params[:storyline], release: params[:release], genre: params[:genre], imdb: params[:imdb])
  	if movie.valid?
  		redirect_to '/'
  	else
  		flash[:errors] = movie.errors.full_messages 
		redirect_to :back
	end	
  	
  end

  def destroy
  	Movie.find(params[:id]).destroy
  	redirect_to :back
  end


end

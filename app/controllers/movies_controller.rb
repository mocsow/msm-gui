class MoviesController < ApplicationController
  def create
    puts "Parameters: #{params.inspect}" # This line will print all parameters to the log

    #Parameters: {"the_title"=>"1", "the_year"=>"1", "the_duration"=>"1", "the_description"=>"1", "the_image"=>"1", "the_director_id"=>"1"}
    
    #Create a new movie with parameters from the form
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    m.save

    #Redirect to the movies index page after saving
    redirect_to("/movies")
  end
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end

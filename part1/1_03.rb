class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = "Doctor Strangelove"

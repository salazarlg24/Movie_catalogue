class Movie < ApplicationRecord
	validates :title, :storyline, :release, :genre, :imdb, presence: true
end

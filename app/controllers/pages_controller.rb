class PagesController < ApplicationController
	include PagesHelper

	HEAVY_LIMIT = 75

	before_action :set_characters, only: [:heavy_characters]

	def set_characters
		@characters = ask_url('https://swapi.dev/api/people/')[:results]
	end

	def heavy_characters
		@heavy_characters = @characters.select{ |char| char[:mass].to_i > 75 }.group_by{ |char| char[:films] }
	end
end

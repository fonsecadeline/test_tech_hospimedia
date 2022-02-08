class PagesController < ApplicationController
	HEAVY_LIMIT = 75

	before_action :set_characters, only: [:heavy_characters]

	def set_characters
		response = RestClient.get 'https://swapi.dev/api/people/'
		if response.code == 200
			@characters = JSON.parse(
				RestClient.get('https://swapi.dev/api/people/', headers={}), symbolize_names: true)[:results]
		else
			# TODO : edit flash to say something did not go as expected and reload page
			@characters = []
		end
	end

	def heavy_characters
		@heavy_characters = @characters.select{ |char| char[:mass].to_i > 75 }.group_by{ |char| char[:films] }
	end
end

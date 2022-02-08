module PagesHelper
	def ask_url(url_adress)
		response = RestClient.get url_adress


		# TODO : edit flash to say something did not go as expected and reload page
		return {} unless response.code == 200

		JSON.parse(response.body, symbolize_names: true)
	end
end

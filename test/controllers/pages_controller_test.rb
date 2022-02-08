require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "heavy_characters are heavy" do
    @characters = (50..80).collect{ |mass| { name: mass.to_s, mass: mass, films: 'movie name' } }
    # TODO : ensure heavy_characters contains 5 values
    @characters = (50..60).collect{ |mass| { name: mass.to_s, mass: mass, films: 'movie name' } }
    # TODO : ensure heavy_characters contains no values
    @characters = []
    # TODO : ensure heavy_characters contains no values and no error is thrown
  end

  test "heavy_characters are grouped_by movie"
    @characters =
      ['movie1', 'movie2', 'movie3'].collect.with_index{ |movie_name, index|
        { name: "name_#{index}", mass: 80, films: movie_name }
      }
    # TODO : ensure 3 groups are created, all characters were kept

    @characters.each{ |char| char[:films] = 'same_movie' }
    # TODO : ensure only 1 group is created, all characters were kept
  end
end

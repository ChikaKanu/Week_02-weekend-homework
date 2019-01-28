require("minitest/autorun")
require('minitest/rg')
require_relative("../songs")


class SongsTest < MiniTest::Test

  def setup
    @songs = Songs.new("The moment", "Instrumental")
  end


  def test_add_new_song_title
    new_title = "The moment"
    assert_equal("The moment", @songs.title)
  end

  def test_add_new_song_type
    new_title = "Instrumental"
    assert_equal("Instrumental", @songs.type)
  end
end

class Songs

  attr_accessor :title, :type

  def initialize(title, type)
    @title = title
    @type = type
  end


  def get_song
    @songs.pop
  end

end

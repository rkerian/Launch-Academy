class Jukebox

attr_reader :songs_available
attr_accessor :playlist

def initialize(songs)
  @playlist = []
  @songs_available = [
    'Hello - Lionel Ritchie',
    'Kokomo – The Beach Boys',
    "Girl You Know It’s True – Milli Vanilli",
    'Agadoo – Black Lace',
    'Down Under - Men at Work',
    "Nothing's Gonna Stop Us Now - Starship",
    'Get Outta My Dreams, Get Into My Car - Billy Ocean',
    'I Just Called To Say I Love You - Stevie Wonder',
    "Hangin' Tough - New Kids on the Block",
    'We Built This City - Starship',
    'Wake Me Up Before You Go Go - Wham!',
    "We Didn't Start The Fire - Billy Joel",
    'I Wanna Dance With Somebody - Whitney Houston',
    "U Can't Touch This - MC Hammer"
  ]

  songs.each do |song|
    if @songs_available.include?(song)
      @playlist << song
    end
  end
end

def shuffle!
  @playlist.shuffle!
end

def play!
  @playlist.delete_at(0)
end

def add_track(song)
  if @songs_available.include?(song)
    @playlist << song
    true
  else
    false
  end
end


end

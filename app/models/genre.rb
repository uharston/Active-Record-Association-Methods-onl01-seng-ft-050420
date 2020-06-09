require 'pry'
class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.order("artist_id DESC").first.artist_id
  end

  def all_artist_names
    # return an array of strings containing every musician's name

     self.songs.map {|s| s.artist.name}
  end
end

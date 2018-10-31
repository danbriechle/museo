class Curator
  attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << photo
    photographs
  end

  def add_artist(artist)
    @artists << artist
    artists
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist[:id] == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo[:id] == id
    end
  end

  def find_photographs_by_artist(artist_object)
    @photographs.find do |photograph|
      photograph[:artist_id] == artist_object[:id]
    end
  end

  def artists_with_multiple_photographs
    photo_ids = []
    @photographs.each do |photo|
      photo_ids << photo[:artist_id]
    end
    artists_with_multiple = photo_ids.find_all do |id|
    photo_ids.count(id) >= 2
    end
     artists_with_multiple.uniq
  end


end

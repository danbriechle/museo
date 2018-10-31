require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require 'pry'


class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_with_empty_array_collections_for_artits_and_photograph
    curator = Curator.new
    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_photographs_can_be_added_and_their_attributes_returned
     curator = Curator.new
     photo_1 = {
       id: "1",
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"}
     photo_2 = {
       id: "2",
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
     }

     curator.add_photograph(photo_1)
     curator.add_photograph(photo_2)

     assert_equal [photo_1, photo_2], curator.photographs
     assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first[:name]
  end

  def test_artists_can_be_added_to_collection_and_their_attributes_returned
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

   assert_equal [artist_1, artist_2], curator.artists
   assert_equal "Henri Cartier-Bresson", curator.artists.first[:name]
  end

  def test_artists_can_be_searched_by_name
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_equal artist_1, curator.find_artist_by_id("1")
  end

  def test_photos_can_be_foiund_by_id
    curator = Curator.new
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"}
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_equal photo_2, curator.find_photograph_by_id("2")
  end

end


# curator = Curator.new
#=> #<Curator:0x00007fd3a0383dc8...>

# curator.artists
# #=> []
#
# curator.photographs
# #=> []
#
# photo_1 = {
#   id: "1",
#   name: "Rue Mouffetard, Paris (Boy with Bottles)",
#   artist_id: "1",
#   year: "1954"
# }
#
# photo_2 = {
#   id: "2",
#   name: "Moonrise, Hernandez",
#   artist_id: "2",
#   year: "1941"
# }
#
# curator.add_photograph(photo_1)
#
# curator.add_photograph(photo_2)
#
# curator.photographs
# #=> [#<Photograph:0x00007fd3a10cda60...>, #<Photograph:0x00007fd3a1801278...>]
#
# curator.photographs.first
# #=> #<Photograph:0x00007fd3a10cda60 @artist_id="1", @id="1", @name="Rue Mouffetard, Paris (Boy with Bottles)", @year="1954">
#
# curator.photographs.first.name
# #=> "Rue Mouffetard, Paris (Boy with Bottles)"
#
 # artist_1 = {
 #   id: "1"
 #   name: "Henri Cartier-Bresson",
 #   born: "1908",
 #   died: "2004",
 #   country: "France"
 # }
 #
 # artist_2 = {
 #   id: "2",
 #   name: "Ansel Adams",
 #   born: "1902",
 #   died: "1984",
 #   country: "United States"
 # }
#
# curator.add_artist(artist_1)
#
# curator.add_artist(artist_2)
#
# curator.artists
# #=> [#<Artist:0x00007fd3a02a8890...>, #<Artist:0x00007fd3a02d3130...>]
#
# curator.artists.first
# #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
#
# curator.artists.first.name
# #=> "Henri Cartier-Bresson"
#
# curator.find_artist_by_id("1")
# #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
#
# curator.find_photograph_by_id("2")
# #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">

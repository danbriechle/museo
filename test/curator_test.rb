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

  def test_it_can_find_photographs_based_on_artist_object
    photo_4 = {
       id: "4",
       name: "Child with Toy Hand Grenade in Central Park",
       artist_id: "3",
       year: "1962"
     }
    artist_3 = {
       id: "3",
       name: "Diane Arbus",
       born: "1923",
       died: "1971",
       country: "United States"
     }
    curator = Curator.new

    curator.add_photograph(photo_4)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")

    assert_equal photo_4, curator.find_photographs_by_artist(diane_arbus)
  end

  def test_it_can_find_artists_with_multiple_photographs
    photo_2 = {
       id: "2",
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
     }

    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
       id: "4",
       name: "Child with Toy Hand Grenade in Central Park",
       artist_id: "3",
       year: "1962"
     }
    artist_3 = {
       id: "3",
       name: "Diane Arbus",
       born: "1923",
       died: "1971",
       country: "United States"
     }

     artist_2 = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }

    curator = Curator.new

    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_3)
    curator.add_artist(artist_2)

    assert_equal [artist_3[:id]], curator.artists_with_multiple_photographs
  end

end





# * `find_photographs_by_artist(artist)` - This method takes an `Artist` object and returns an Array of all the Artist's photographs. A `Photograph` is linked to an `Artist` by its `artist_id`
# * `artists_with_multiple_photographs` - This method returns an Array of all `Artist`s who have more than one photograph
# * `photographs_taken_by_artists_from(string)` - This method takes a String representing a country. It returns an Array of `Photograph`s that were taken by a photographer from that country.
#
# The `Curator` class should now respond to the following interaction pattern:
#
# ```ruby
# pry(main)> photo_1 = {
#   id: "1",
#   name: "Rue Mouffetard, Paris (Boy with Bottles)",
#   artist_id: "1",
#   year: "1954"
# }
#
# pry(main)> photo_2 = {
#   id: "2",
#   name: "Moonrise, Hernandez",
#   artist_id: "2",
#   year: "1941"
# }
#
# pry(main)> photo_3 = {
#   id: "3",
#   name: "Identical Twins, Roselle, New Jersey",
#   artist_id: "3",
#   year: "1967"
# }
#
# pry(main)> photo_4 = {
#   id: "4",
#   name: "Child with Toy Hand Grenade in Central Park",
#   artist_id: "3",
#   year: "1962"
# }
#
# pry(main)> artist_1 = {
#   id: "1",
#   name: "Henri Cartier-Bresson",
#   born: "1908",
#   died: "2004",
#   country: "France"
# }
#
# pry(main)> artist_2 = {
#   id: "2",
#   name: "Ansel Adams",
#   born: "1902",
#   died: "1984",
#   country: "United States"
# }
#
# pry(main)> artist_3 = {
#   id: "3",
#   name: "Diane Arbus",
#   born: "1923",
#   died: "1971",
#   country: "United States"
# }
#
# pry(main)> curator = Curator.new
# #=> #<Curator:0x00007fa3c182da18...>
#
# pry(main)> curator.add_photograph(photo_1)
#
# pry(main)> curator.add_photograph(photo_2)
#
# pry(main)> curator.add_photograph(photo_3)
#
# pry(main)> curator.add_photograph(photo_4)
#
# pry(main)> curator.add_artist(artist_1)
#
# pry(main)> curator.add_artist(artist_2)
#
# pry(main)> curator.add_artist(artist_3)
#
# pry(main)> diane_arbus = curator.find_artist_by_id("3")
# #=> #<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">
#
# pry(main)> curator.find_photographs_by_artist(diane_arbus)
# #=> [#<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
#
# pry(main)> curator.artists_with_multiple_photographs
# #=> [#<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">]
#
# pry(main)> curator.artists_with_multiple_photographs.length
# #=> 1
#
# pry(main)> diane_arbus == curator.artists_with_multiple_photographs.first
# #=> true
#
# pry(main)> curator.photographs_taken_by_artists_from("United States")
# #=> [#<Photograph:0x00007fa3c286b088...>, #<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
#
# pry(main)> curator.photographs_taken_by_artists_from("Argentina")
# #=> []
#
#
# # curator = Curator.new
# #=> #<Curator:0x00007fd3a0383dc8...>
#
# # curator.artists
# # #=> []
# #
# # curator.photographs
# # #=> []
# #
# # photo_1 = {
# #   id: "1",
# #   name: "Rue Mouffetard, Paris (Boy with Bottles)",
# #   artist_id: "1",
# #   year: "1954"
# # }
# #
# # photo_2 = {
# #   id: "2",
# #   name: "Moonrise, Hernandez",
# #   artist_id: "2",
# #   year: "1941"
# # }
# #
# # curator.add_photograph(photo_1)
# #
# # curator.add_photograph(photo_2)
# #
# # curator.photographs
# # #=> [#<Photograph:0x00007fd3a10cda60...>, #<Photograph:0x00007fd3a1801278...>]
# #
# # curator.photographs.first
# # #=> #<Photograph:0x00007fd3a10cda60 @artist_id="1", @id="1", @name="Rue Mouffetard, Paris (Boy with Bottles)", @year="1954">
# #
# # curator.photographs.first.name
# # #=> "Rue Mouffetard, Paris (Boy with Bottles)"
# #
#  # artist_1 = {
#  #   id: "1"
#  #   name: "Henri Cartier-Bresson",
#  #   born: "1908",
#  #   died: "2004",
#  #   country: "France"
#  # }
#  #
#  # artist_2 = {
#  #   id: "2",
#  #   name: "Ansel Adams",
#  #   born: "1902",
#  #   died: "1984",
#  #   country: "United States"
#  # }
# #
# # curator.add_artist(artist_1)
# #
# # curator.add_artist(artist_2)
# #
# # curator.artists
# # #=> [#<Artist:0x00007fd3a02a8890...>, #<Artist:0x00007fd3a02d3130...>]
# #
# # curator.artists.first
# # #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
# #
# # curator.artists.first.name
# # #=> "Henri Cartier-Bresson"
# #
# # curator.find_artist_by_id("1")
# # #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
# #
# # curator.find_photograph_by_id("2")
# # #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">

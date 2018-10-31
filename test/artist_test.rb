attributes = {
  id: "2",
  name: "Ansel Adams",
  born: "1902",
  died: "1984",
  country: "United States"
}

artist = Artist.new(attributes)
#=> #<Artist:0x00007fc2d0a6c080...>

artist.id
#=> "2"

artist.name
#=> "Ansel Adams"

artist.born
#=> "1902"

artist.died
#=> "1984"

artist.country
#=> "United States"
```

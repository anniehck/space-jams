## Instructions

Build an app that uses Ruby Objects.

### Getting Set Up
```
$ cd ~/challenges
$ et get space-jams
$ cd space-jams
& ruby runner.rb
```

## Meets Expectations Requirements

Executing `runner.rb` the first time should produce an error.
Your task is to build out an Album class (in the `album.rb` file provided) that `runner.rb` interacts with.
The ultimate goal of the challenge is to successfully execute `runner.rb` and have each album's information output to the command line in the following format:

```no-highlight
Name: Space Jams
Artist(s): Tony Wrecks
Duration (min.): 41.45
Tracks:
- Bout My Bread
- Grindin Skit
- Drop It In Tha Bank
- Batter Up
- I Get Toe Up
- My Drop
- Heavyweights
- Preapproved - Freestyle
- Soldiers
- Don't Wanna See Me
- Lookin Clean
- One For Tha Money
- Toe Up Slowed And Chopped
- Swagger Up Slowed And Chopped
```

The challenge's `space_jams.csv` file stores a list of tracks. Don't worry about working directly with or on the `space_jams.csv` file. The `runner.rb` file does that work for you. It reads in the tracks from the CSV, creates a new `Album` object for each album in the data, and prints out the summary for each album:

```ruby
# runner.rb

require 'csv'
require_relative 'album'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  # find an album by matching the album.id with track[:album_id]
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
```

You should *not* edit this file unless you are attempting the Exceeds Expectations portion of the challenge.

For _this_ portion of the challenge, just focus on creating an `Album` class with the necessary instance methods. Be attentive to the data structure(s) you're working with!

Your `Album` class should have the following instance methods:

* `id` - returns the ID of the album
* `title` - returns the title of the album
* `artists` - returns the name of the artist(s) on the album
* `tracks` - returns an array of hashes representing each track on the album
* `duration_min` - returns the duration of the album in minutes (`duration_ms` in the CSV is duration in milliseconds)
* `summary` - __returns a string__ of summary information in the format specified in the example above. No `puts` or `print` statements should exist in this method! That is a job delegated to the `runner.rb` file.

### Tips

If you're having trouble getting started, ignore the tracks to start. Build an `Album` class that has only `id`, `title`, and `artists` attributes, and a summary method that prints out just album name and artists:

  ```no-highlight
  Name: Space Jams
  Artist(s): Tony Wrecks
  ```

Then you can add a `tracks` attribute and populate each album's `@track`'s instance variable when you iterate through the tracks to create your `albums` hash.

Finally, you can write the `duration_min` method and modify your `summary` method to return duration and track information.

Use the `\n` newline character as needed to properly format the string your `summary` will return.

When you use multiple files to hold your classes, remember that you must `require_relative 'filename'` at the top of any *other* file where you want access to the class. For example, if you create an `Album` class within an `album.rb` file, add `require_relative 'album'` to import that class.

## Exceeding Expectations Requirements

You know what would be nice? If tracks were their own objects, instead of just hashes.

Add a `Track` class (and a file to put it in). A track should have the following attributes, with getter methods for each attribute:

- `album_id`
- `id` (`track_id` in the CSV)
- `title`
- `track_number`
- `duration_ms` (duration in milliseconds)

Change your `Album` class so that the `@tracks` instance variable is an array of `Track` objects instead of an array of hashes. Modify the `runner.rb` file to get this working. (*Hint* You'll need to `require_relative` your new `track.rb` file with your `Track` class.)

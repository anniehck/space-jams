#Do not modify this code unless you are attempting the Exceeds Expectation portion of the challenge.
require 'csv'
require_relative 'album'
require_relative 'track'

albums = []

# WITHOUT TRACK CLASS; track as hash obj
# CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
#   track = row.to_hash
#
#   # find an album by matching the album.id with track[:album_id]
#   album = albums.find { |a| a.id == track[:album_id] }
#
#   # if the album hasn't been added to the albums array yet, add it
#   if album.nil?
#     album = Album.new(track[:album_id], track[:album_name], track[:artists])
#     albums << album
#   end
#
#   # add the track to the album's @tracks instance variable
#   album.tracks << track
# end

# WITH TRACK CLASS
CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = Track.new(row[0], row[1], row[2], row[3], row[4])

  album = albums.find { |a| a.id == track.album_id }

  if album.nil?
    album = Album.new(track.album_id, row[5], row[6])
    albums << album
  end

  album.tracks << track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end

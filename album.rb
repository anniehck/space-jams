require_relative 'track'
require 'colorize'

class Album
  attr_reader :id, :title, :artists, :tracks
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    duration_total = 0.0
    @tracks.each do |track|
      duration_total += (track.duration_ms).to_i
    end
    # Without Tracks class
    # @tracks.each do |track|
    #   track.each do |key, val|
    #     duration_total += val.to_i if key == :duration_ms
    #   end
    # end
    @duration_min = duration_total.fdiv(60000).round(2)
  end

  def summary
    track_list = ""
    @tracks.each do |track|
      track_list += "#{track.track_number.light_blue}. #{track.title.cyan}\n"
    end

    # Without Tracks class
    # track_titles = []
    # @tracks.each do |track|
    #   track.each do |key, val|
    #     # duration_total += val.to_i if key == :duration_ms
    #     track_titles << val if key == :title
    #   end
    # end
    # track_titles.each { |track| track_list += "- #{track}\n"}

    "Album Name: #{title.light_red.italic}\nArtist(s): #{artists.light_red.bold}\nDuration (min.): #{duration_min.to_s.green}\nTracks:\n#{track_list}\n"
  end

end

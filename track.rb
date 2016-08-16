class Track
  attr_reader :album_id, :id, :title, :track_number, :duration_ms

  def initialize(album_id, track_id, title, track_number, duration_ms)
    @album_id = album_id
    @id = track_id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end
end

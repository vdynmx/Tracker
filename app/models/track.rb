class Track
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :title, type: String
  field :trackpoint, type: Array
  field :timestamp, type: Timestamp
  field :duration, type: Integer, default: 0
  field :moving_time, type: Integer
  field :speed_avg, type: Integer
  field :moving_speed_avg, type: Integer
  field :speed_max, type: Integer
  field :elevation_max, type: Integer
  field :elevation_min, type: Integer
  field :elevation_gain, type: Integer
  field :grade_max, type: Integer
  field :grade_min, type: Integer
  track :total_dist, type: Integer

end

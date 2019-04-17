class Event < ApplicationRecord
  after_save :find_path, :find_path_selected

  belongs_to :user
  has_many :bookings, :dependent => :destroy
  # validates :user_id, presence: true
  validates :activity_type, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

  def find_path()
    activity = { "Kites" => "/image/kite.png", "Dance" => "/image/dance2.png", "Spinning Top" => "/image/tops.png", "Taichi" => "/image/taichi.png", "Wushu" => "/image/wushu.png", "Sword Dance" => "/image/sword_dance.png", "Chinese Chess" => "/image/chinese_chess.png", "Water Calligraphy" => "/image/water_calligraphy.png" }
    self.update_column(:iconPathYellow, activity[self.activity_type])
  end

  def find_path_selected()
    activity = { "Kites" => "/image/kite-select.png", "Dance" => "/image/dance2-select.png", "Spinning Top" => "/image/tops-select.png", "Taichi" => "/image/taichi-select.png", "Wushu" => "/image/wushu-select.png", "Sword Dance" => "/image/sword_dance-select.png", "Chinese Chess" => "/image/chinese_chess-select.png", "Water Calligraphy" => "/image/water_calligraphy-select.png" }
    self.update_column(:iconPathRed, activity[self.activity_type])
  end

end



class Event < ApplicationRecord
  after_save :find_path

  belongs_to :user
  has_many :bookings
  # validates :user_id, presence: true
  validates :activity_type, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

  def find_path()
    activity = { "Kites" => "/image/kite.png", "Dance" => "/image/dance.png", "Spinning Top" => "/image/tops.png", "Taichi" => "/image/taichi.png", "Wushu" => "/image/wushu.png", "Sword Dance" => "/image/sword_dance", "Chinese Chess" => "/image/chinese_chess", "Water Calligraphy" => "/image/water_calligraphy" }
    self.update_column(:iconPath, activity[self.activity_type])
  end

end



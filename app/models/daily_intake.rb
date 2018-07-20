class DailyIntake < ApplicationRecord
  belongs_to :user
  validates :user_id, presence:true
  validates :calories, presence:true
  validates :day, presence:true
end

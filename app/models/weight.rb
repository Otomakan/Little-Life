class Weight < ApplicationRecord
  belongs_to :user
  validates :user_id, presence:true
  validates :weight, presence:true
  validates :day, presence:true
end

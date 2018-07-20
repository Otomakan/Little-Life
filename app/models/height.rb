class Height < ApplicationRecord
  belongs_to :user
  validates :user_id, presence:true
  validates :height, presence:true
  validates :day, presence:true
end

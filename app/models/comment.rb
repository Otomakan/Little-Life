class Comment < ApplicationRecord
  belongs_to :user
  validates :content, presence:true
  validates :title, presence:true
  validates :grade, presence:true
end

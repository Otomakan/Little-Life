class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :daily_intake
  has_many :height
  has_many :weight
  has_many :comment
  validates :dob, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :diet_type, :inclusion => ['vegetarian', 'vegan', 'pesciterian', 'raw', 'everything', 'NA']
  validates :blood_type, :inclusion => ['A+','A-','B+','B-','AB+','AB-','O+','O-','NA']
end

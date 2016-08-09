class Song < ActiveRecord::Base

  belongs_to :user
  has_many :votes
  has_many :reviews

  validates :title, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
end 
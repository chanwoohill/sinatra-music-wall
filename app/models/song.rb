class Song < ActiveRecord::Base

  validates :title, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

end 
class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :song
  
  validates :user_id, presence: true
  validates :song_id, presence: true
  validates :content, length: { minimum: 1 }
  validates :rating, numericality: { only_integer: true, in: 1..5 }

  validate :user_cannot_review_song_twice, on: :create


  def user_cannot_review_song_twice
    song_review = user.reviews.find_by(song_id: song.id)
    if song_review
      errors.add(:base, "cannot review the same song twice")
    end
  end

end 
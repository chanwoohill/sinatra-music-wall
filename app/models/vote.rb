class Vote < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

  validate :user_cannot_vote_twice

  def user_cannot_vote_twice
    song_vote = user.votes.find_by(song_id: song.id)
    if song_vote
      errors.add(:base, "User cannot vote on the same song twice")
    end
  end
  
end 
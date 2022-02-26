class Vote
  def initialize(voter: nil, object: nil, **attr)
    @voter = voter
    @object = object
  end

  attr_reader :voter, :object

  def votes
    if voter.voted_up_on?(object)
      object.unliked_by(voter)
    else
      object.liked_by(voter)
    end
  end

  def toggle_thumbs_up
    votes
  end

  def toggle_smile
    votes
  end

  def toggle_like
    votes
  end

  def get_upvoters
    object.votes_for.up.voters
  end
end

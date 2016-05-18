class Player < ActiveRecord::Base
  enum strong_leg: [:right, :left, :ambidextrous]
  enum status: [:active, :inactive]
  belongs_to :team


  def fired
    update(team_id: nil)
  end
end

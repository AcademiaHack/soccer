class Player < ActiveRecord::Base
  enum strong_leg: [:right, :left, :ambidextrous]
  enum status: [:active, :inactive]
  belongs_to :team

  before_create :active
  scope :free, -> { where(team_id: nil) }

  def fired
    update(team_id: nil)
  end

  private

  def active
    self.status = 'active'
  end
end

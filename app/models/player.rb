# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  strong_leg :integer
#  status     :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base
  enum strong_leg: [:right, :left, :ambidextrous]
  enum status: [:active, :inactive]
  belongs_to :team

  before_create :active
  scope :free, -> { where(team_id: nil) }
  # scope :active, -> { where(status: 0) }

  def fired
    update(team_id: nil)
  end

  private

  def active
    self.status = 'active'
  end
end

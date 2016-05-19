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


  def fired
    update(team_id: nil)
  end
end

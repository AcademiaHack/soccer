# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  datetime        :date
#  status          :integer
#  local_team_id   :integer          not null
#  invited_team_id :integer          not null
#  stadium_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Match < ActiveRecord::Base
  enum status: [:pending, :ongoing, :finished, :cancelled]
  belongs_to :stadium
  belongs_to :local_team, class_name: 'Team', foreign_key: 'local_team_id'
  belongs_to :invited_team, class_name: 'Team', foreign_key: 'invited_team_id'

  before_create :peding

  private

  def pending
    self.status = 'pending'
  end
end

class Match < ActiveRecord::Base
  enum status: [:pending, :ongoing, :finished, :cancelled]
  belongs_to :stadium
  belongs_to :local_team, class_name: 'Team', foreign_key: 'local_team_id'
  belongs_to :invited_team, class_name: 'Team', foreign_key: 'invited_team_id'
end

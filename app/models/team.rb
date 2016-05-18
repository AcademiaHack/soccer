class Team < ActiveRecord::Base
  has_many :players
  has_many :local_matches, class_name: 'Match', foreign_key: 'local_team_id'
  has_many :invited_matches, class_name: 'Match', foreign_key: 'invited_team_id'
end

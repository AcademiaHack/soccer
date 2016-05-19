# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string
#  nationality  :string
#  owner        :string
#  games_played :integer
#  wins         :integer
#  ties         :integer
#  loses        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :players

  has_many :local_matches, class_name: 'Match', foreign_key: 'local_team_id'
  has_many :invited_matches, class_name: 'Match', foreign_key: 'invited_team_id'
end

# == Schema Information
#
# Table name: stadia
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :text
#  capacity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stadium < ActiveRecord::Base
  has_many :matches
end

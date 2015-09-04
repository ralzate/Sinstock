# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rol < ActiveRecord::Base
  has_many :manage_users
	def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end
end

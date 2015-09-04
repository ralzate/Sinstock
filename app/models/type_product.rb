# == Schema Information
#
# Table name: type_products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeProduct < ActiveRecord::Base
	has_many :products
	def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end

end

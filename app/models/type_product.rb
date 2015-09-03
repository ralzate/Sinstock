class TypeProduct < ActiveRecord::Base
	has_many :products
	def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end

end

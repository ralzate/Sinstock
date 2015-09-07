class Pages < ActiveRecord::Base
  

	def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end

end

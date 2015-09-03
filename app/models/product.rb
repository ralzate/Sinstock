class Product < ActiveRecord::Base
  belongs_to :type_product
  belongs_to :user

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, 
    :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end

end

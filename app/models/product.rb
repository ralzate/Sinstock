# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :string
#  stock               :integer
#  reference           :string
#  type_product_id     :integer
#  user_id             :integer
#  quantity            :integer
#  unit_price          :decimal(, )
#  state_product       :integer
#  total               :decimal(, )
#  new_used            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

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

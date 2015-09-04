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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

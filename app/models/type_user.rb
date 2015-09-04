# == Schema Information
#
# Table name: type_users
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeUser < ActiveRecord::Base
end

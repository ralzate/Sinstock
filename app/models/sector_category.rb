# == Schema Information
#
# Table name: sector_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SectorCategory < ActiveRecord::Base
end

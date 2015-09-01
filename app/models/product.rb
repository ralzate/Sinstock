class Product < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, :price, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :price, numericality: { less_than_or_equal_to: 999999.99, message:"too high. Nobody will buy it."}
  validates :title, length: {minimum: 3, message: "too short. Must be at least 5 characters long." }
  validates :image_file, allow_blank:true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end

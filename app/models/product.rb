class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image_file, PictureUploader
  validate :picture_size

  validates :title, :description, :price, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :price, numericality: { less_than_or_equal_to: 9999999999.99, message:"Demasiado alto. Nadie lo va a comprar."}
  validates :title, length: {minimum: 3, message: "Demasiado corto. Debe tener al menos 5 caracteres." }
  #validates :image_file, allow_blank:true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'debe ser una URL para una imagen PNG GIF, JPG o' }


  private


  def picture_size
    if image_file.size > 5.megabytes
      errors.add(:image_file, "should be less than 5MB")
    end
  end



end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_messageable
  has_many :products, dependent: :destroy
  before_save { self.email = email.downcase }
  mount_uploader :picture, PictureUploader

  validates :password, presence: true, length: { minimum: 3 }, confirmation: true, if: :new_user?
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }, uniqueness: {message: " Ya fue registrado "}
  validates :name, presence: true, length: { minimum:4 }
  validate :picture_size


  class << self
    def current_users
      where("#{sorcery_config.last_activity_at_attribute_name} IS NOT NULL") \
      .where("#{sorcery_config.last_logout_at_attribute_name} IS NULL
      OR #{sorcery_config.last_activity_at_attribute_name} > #{sorcery_config.last_logout_at_attribute_name}") \
      .where("#{sorcery_config.last_activity_at_attribute_name} > ? ", sorcery_config.activity_timeout.seconds.ago.utc.to_s(:db))
    end
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
      #if true
        return email
      #if false
        #return nil
    end


  private

  def new_user?
    new_record?
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end

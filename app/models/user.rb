# == Schema Information
#
# Table name: users
#
#  id                               :integer          not null, primary key
#  first_name                       :string
#  second_name                      :string
#  first_surname                    :string
#  second_surname                   :string
#  identification                   :string
#  address                          :string
#  phone                            :string
#  cell_phone                       :string
#  rut                              :string
#  business_name                    :string
#  nit                              :string
#  web_page                         :string
#  description                      :text
#  first_name_of_contact_person     :string
#  second_name_of_contact_person    :string
#  first_surname_of_contact_person  :string
#  second_surname_of_contact_person :string
#  first_phone_of_contact_person    :string
#  second_phone_of_contact_person   :string
#  email                            :string           not null
#  crypted_password                 :string
#  salt                             :string
#  created_at                       :datetime
#  updated_at                       :datetime
#  remember_me_token                :string
#  remember_me_token_expires_at     :datetime
#  reset_password_token             :string
#  reset_password_token_expires_at  :datetime
#  reset_password_email_sent_at     :datetime
#  activation_state                 :string
#  activation_token                 :string
#  activation_token_expires_at      :datetime
#  picture                          :string
#  admin                            :boolean          default(FALSE)
#  failed_logins_count              :integer          default(0)
#  lock_expires_at                  :datetime
#  unlock_token                     :string
#  last_login_at                    :datetime
#  last_logout_at                   :datetime
#  last_activity_at                 :datetime
#  last_login_from_ip_address       :string
#  type_user                        :string
#  rol_id                           :integer
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  acts_as_messageable
  has_many :products, dependent: :destroy
  has_many :manage_users
  before_save { self.email = email.downcase }
  mount_uploader :picture, PictureUploader

  validates :email, uniqueness: true, email_format: { message: ' Tiene un Formato invalido' }, uniqueness: {message: " Ya fue registrado "}
  validates :first_name, :presence => { :message => "Por Favor Ingresa tu nombre"}
  validate :picture_size
  validates_confirmation_of :password, :message => " Debe ser igual"



  def self.search(search)
    where("email like '%#{search}%' or first_name like '%#{search}%'")
  end


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

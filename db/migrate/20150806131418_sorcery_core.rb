class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
	    t.string  :first_name
	    t.string  :second_name
	    t.string  :first_surname
	    t.string  :second_surname
	    t.string  :identification
	    t.string  :address
	    t.string  :phone 
	    t.string  :cell_phone
	    t.string  :rut
	    t.string  :business_name
	    t.string  :nit
	    t.string  :web_page
	    t.text    :description
	    t.string  :first_name_of_contact_person
	    t.string  :second_name_of_contact_person
	    t.string  :first_surname_of_contact_person
	    t.string  :second_surname_of_contact_person
	    t.string  :first_phone_of_contact_person
	    t.string  :second_phone_of_contact_person
      	t.string :email,            :null => false
      	t.string :crypted_password
      	t.string :salt
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
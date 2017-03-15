class CreateClientContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :client_contacts, id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :salutation, limit: 15
      t.string :first_name, limit: 25
      t.string :middle_name, limit: 25
      t.string :last_name, limit: 25
      t.string :job_title, limit: 41
      t.string :phone, limit: 21
      t.string :alt_phone, limit: 21
      t.string :fax, limit: 21
      t.string :email, limit: 1023
      t.string :cc, limit: 1023
      t.string :contact, limit: 41
      t.string :alt_contact, limit: 41
      t.string :primary_contact
      t.string :primary_email
      t.string :primary_phone
    end
  end
end

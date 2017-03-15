class CreateClientShipAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :client_ship_addresses, id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :addr1, limit: 41
      t.string :addr2, limit: 41
      t.string :addr3, limit: 41
      t.string :addr4, limit: 41
      t.string :addr5, limit: 41
      t.string :city, limit: 31
      t.string :state, limit: 21
      t.string :postal_code, limit: 13
      t.string :country, limit: 31
      t.string :note, limit: 41
    end
  end
end

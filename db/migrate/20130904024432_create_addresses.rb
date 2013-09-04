class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :agent_id, :null => false
      t.string :postcode
      t.text :address1, :null => false
      t.text :address2
      t.text :address3
      t.string :town, :null => false
      t.string :county, :null => false
      t.string :country, :null => false

      t.timestamps
    end
  end
end

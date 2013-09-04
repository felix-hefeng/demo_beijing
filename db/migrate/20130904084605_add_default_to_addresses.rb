class AddDefaultToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :is_default, :boolean, :default => false
  end
end

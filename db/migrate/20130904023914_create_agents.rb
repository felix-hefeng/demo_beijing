class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :agent_no, :null => false, :unique => true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end

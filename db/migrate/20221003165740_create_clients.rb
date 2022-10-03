class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :node_count
      t.timestamps
    end
  end
end

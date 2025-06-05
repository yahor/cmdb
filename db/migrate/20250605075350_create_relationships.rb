class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |t|
      t.references :configuration_item
      t.string :using_type, null: false, index: true
      t.integer :connected_item_id, null: false, index: true

      t.timestamps
    end
  end
end

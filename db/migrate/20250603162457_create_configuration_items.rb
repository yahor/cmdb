class CreateConfigurationItems < ActiveRecord::Migration[8.0]
  def change
    create_table :configuration_items do |t|
      t.string :name
      t.string :type, index: true
      t.string :status, index: true
      t.string :environment, index: true

      t.timestamps
    end

    add_index :configuration_items, :name, unique: true
  end
end

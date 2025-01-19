class CreateRegions < ActiveRecord::Migration[7.2]
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :boulders
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end

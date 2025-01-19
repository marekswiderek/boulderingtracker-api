class CreateBoulders < ActiveRecord::Migration[7.2]
  def change
    create_table :boulders do |t|
      t.string :name
      t.string :grade
      t.integer :ascents
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end

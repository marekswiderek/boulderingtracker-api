class CreateAscents < ActiveRecord::Migration[7.2]
  def change
    create_table :ascents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boulder, null: false, foreign_key: true
      t.date :ascent_date
      t.integer :attempts

      t.timestamps
    end
  end
end

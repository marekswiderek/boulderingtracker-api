class ChangeColumnNamesForRegionsAndBoulders < ActiveRecord::Migration[7.2]
  def change
    rename_column :regions, :boulders, :boulders_count
    rename_column :boulders, :ascents, :ascents_count
  end
end

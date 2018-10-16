class ChangeBaseColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :base, :to_base
  end
end

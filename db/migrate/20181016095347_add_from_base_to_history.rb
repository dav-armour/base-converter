class AddFromBaseToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :from_base, :integer
  end
end

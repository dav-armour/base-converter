class ChangeInputToBeStringInHistories < ActiveRecord::Migration[5.2]
  def change
    change_column :histories, :input, :string
  end
end

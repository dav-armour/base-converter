class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :input
      t.integer :base
      t.string :output

      t.timestamps
    end
  end
end

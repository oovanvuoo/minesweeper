class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :mine_boards do |t|
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mine_number
      t.timestamps
      t.datetime :deleted_at
    end
  end
end

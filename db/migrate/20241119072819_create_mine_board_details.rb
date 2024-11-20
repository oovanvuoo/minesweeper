class CreateMineBoardDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :mine_board_details do |t|
      t.references :mine_board
      t.integer :x
      t.integer :y
      t.timestamps
      t.datetime :deleted_at
    end
  end
end

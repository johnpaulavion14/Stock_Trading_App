class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :symbol
      t.string :company
      t.integer :current_price
      t.integer :shares
      t.string :commit
      t.integer :user_id

      t.timestamps
    end
    add_index :transactions, :user_id
  end
end

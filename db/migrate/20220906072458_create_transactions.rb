class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :symbol
      t.string :action
      t.integer :current_price
      t.integer :shares
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

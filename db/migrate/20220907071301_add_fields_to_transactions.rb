class AddFieldsToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :user_id, :integer
    add_index :transactions, :user_id
  end
end

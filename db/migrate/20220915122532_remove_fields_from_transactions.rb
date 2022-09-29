class RemoveFieldsFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :date, :date
    remove_column :transactions, :time, :time
  end
end

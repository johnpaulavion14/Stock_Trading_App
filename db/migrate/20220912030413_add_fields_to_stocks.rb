class AddFieldsToStocks < ActiveRecord::Migration[7.0]
  def change
    add_column :stocks, :percent_change, :string
  end
end

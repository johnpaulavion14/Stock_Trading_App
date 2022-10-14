require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe "#symbol" do
    it 'symbol should not be null' do
      transaction = create(:transaction)
      transaction.symbol = nil
      transaction.save
      expect(transaction).to_not be_valid
    end

    it 'symbol should not be the same' do
      transaction = create(:transaction)
      transaction.symbol = "unique symbol"
      transaction.save

      transaction2 = create(:transaction)
      transaction2.symbol = "unique symbol"
      transaction2.save
      expect(transaction2).to_not be_valid
    end

    it 'symbol should be less than 6 chars' do
      transaction = create(:transaction)
      transaction.symbol = 'SYMBO'
      transaction.save
      expect(transaction).to be_valid
    end
  end
  
end
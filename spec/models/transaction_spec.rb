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

  describe '#company' do
    it 'company should not be null' do
      transaction = create(:transaction)
      transaction.company = nil
      transaction.save
      expect(transaction).to_not be_valid
    end
    it 'company should not be the same' do
      transaction = create(:transaction)
      transaction.company = "unique company"
      transaction.save

      transaction2 = create(:transaction)
      transaction2.company = "unique company"
      transaction2.save
      expect(transaction2).to_not be_valid
    end
    it 'company should not be greater than 30 chars' do
      transaction = create(:transaction)
      transaction.company = "this is more than 30 characters"
      transaction.save
      expect(transaction).to_not be_valid
    end
  end

  describe '#current_price' do
    it 'current_price should not be null' do
      transaction = create(:transaction)
      transaction.current_price = nil
      transaction.save
      expect(transaction).to_not be_valid
    end

    it 'current_price should accept integer' do
      transaction = create(:transaction)
      transaction.current_price = 14
      transaction.save
      expect(transaction).to be_valid
    end

    it 'current_price should accept float' do
      transaction2 = create(:transaction)
      transaction2.current_price = 14.00
      transaction2.save
      expect(transaction2).to be_valid
    end
  end

  describe '#commit' do
    it 'commit should not be null' do
      transaction = create(:transaction)
      transaction.commit = nil
      transaction.save
      expect(transaction).to_not be_valid
    end

    it 'commit should be equal to buy' do
      transaction = create(:transaction)
      transaction.commit = 'buy'
      transaction.save
      expect(transaction).to be_valid
    end

    it 'commit should reject string not equal to buy' do
      transaction2 = create(:transaction)
      transaction2.commit = 'buyyy'
      transaction2.save
      expect(transaction2).to_not be_valid
    end

    it 'commit should be equal to sell' do
      transaction = create(:transaction)
      transaction.commit = 'sell'
      transaction.save
      expect(transaction).to be_valid 
    end

    it 'commit should reject string not equal to sell' do
      transaction2 = create(:transaction)
      transaction2.commit = 'selllll'
      transaction2.save
      expect(transaction2).to_not be_valid
    end
  end

  describe '#shares' do
    it 'shares should not be null' do
      transaction = create(:transaction)
      transaction.shares = nil
      transaction.save
      expect(transaction).to_not be_valid
    end
    it 'shares should accept integer only' do
      transaction = create(:transaction)
      transaction.shares = 13
      transaction.save
      expect(transaction).to be_valid
    end

    it 'shares should reject float' do
      transaction2 = create(:transaction)
      transaction2.shares = 13.00
      transaction2.save
      expect(transaction2).to_not be_valid
    end
  end



end

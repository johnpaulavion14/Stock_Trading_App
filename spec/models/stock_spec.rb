require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe '#company_name' do
    it "company_name should not be null" do
        stock = create(:stock)
        stock.name = nil
        stock.save
        expect(stock).to_not be_valid
    end
    it 'company_name should not be the same' do
      stock = create(:stock)
      stock.name = "unique name"
      stock.save

      stock2 = create(:stock)
      stock2.name = "unique name"
      stock2.save
      expect(stock2).to_not be_valid
    end

    it 'company_name should not be greater than 30 chars' do
      stock = create(:stock)
      stock.name = "this is more than 30 characters"
      stock.save
      expect(stock).to_not be_valid
    end
  end

  describe '#symbol' do
    it "symbol should not be null" do
        stock = create(:stock)
        stock.symbol = nil
        stock.save
        expect(stock).to_not be_valid
    end
    it 'symbol should not be the same' do
      stock = create(:stock)
      stock.symbol = "unique symbol"
      stock.save

      stock2 = create(:stock)
      stock2.symbol = "unique symbol"
      stock2.save
      expect(stock2).to_not be_valid
    end

    it 'symbol should not be greater than 5 chars' do
      stock = create(:stock)
      stock.symbol = 'greater than 5'
      stock.save
      expect(stock).to_not be_valid
    end
  end

  describe '#price' do
    it "price should not be null" do
        stock = create(:stock)
        stock.price = nil
        stock.save
        expect(stock).to_not be_valid
    end
    it 'price should only accept number' do
      stock = create(:stock)
      stock.price = 'string'
      stock.save
      expect(stock).to_not be_valid
    end

    it 'price should accept integer and float ' do
      stock = create(:stock)
      stock.price = 14
      stock.save
      expect(stock).to be_valid

      stock2 = create(:stock)
      stock2.price = 14.00
      stock2.save
      expect(stock2).to be_valid
    end
  end

  describe '#percent_change' do
    it "percent_change should not be null" do
        stock = create(:stock)
        stock.percent_change = nil
        stock.save
        expect(stock).to_not be_valid
    end
  end


end

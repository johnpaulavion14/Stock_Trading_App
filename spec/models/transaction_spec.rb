require 'rails_helper'

describe Transaction, type: :model do
    subject {
      user = User.last
      user.transactions.create(symbol:nil)
    }

    it 'symbol is not valid more than 10 chars' do
        expect(subject).to_not be_valid
      end

end

RSpec.describe Transaction, type: : model do
  let!(:transaction) {Transaction.new}
  
  context 'Validations' do
    
    it '1. is not valid without symbol' do
      transaction.symbol = 'hello'
      
      expect(article).to_not be_valid
      expect(article.errors).to be_present
      expect(article.errors.to_h.keys).to include(:name)
      
    end
      
      it '2. is not valid without body' do
        article.name = 'sample name'
        
        expect(article).to_not be_valid
        expect(article.errors).to be_present
        expect(article.errors.to_h.keys).to include(:body)
    end

  end
end
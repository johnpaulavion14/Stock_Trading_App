class Stock < ApplicationRecord
    validates :name, :symbol, :price, :percent_change, presence: true
    validates :name, uniqueness: true, length: {maximum: 30}
    validates :symbol, uniqueness: true, length: {maximum: 5}
    validates :price, numericality: true
        
end

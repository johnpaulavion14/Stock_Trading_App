class Transaction < ApplicationRecord
    belongs_to :user

    validates :symbol, :shares, :company, :commit, :current_price, presence: true
    validates :symbol, length: { maximum: 5 }, uniqueness: true
    validates :commit, inclusion: { in: %w(buy sell), message: "%{value} is not valid" }
    validates :current_price, numericality: true
    validates :shares, numericality: { only_integer: true }
    validates :company, length: { maximum: 30 }, uniqueness: true
end

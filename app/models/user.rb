class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :transactions

  validates :first_name, :last_name, :age, :gender, :address, :password, :is_approved, presence: true
  validates :age, numericality: {less_than_or_equal_to: 100, only_integer: true}
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not male or female" }
  # validates :is_approved, inclusion: { in: [true, false] }
  
end

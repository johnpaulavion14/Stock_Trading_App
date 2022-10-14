FactoryBot.define do
  factory :transaction do
    user
    shares { 100 }
    sequence(:company) {|n| "google#{n}" }
    commit { "buy"}
    sequence(:symbol) {|n| "GO#{n}"}
    sequence(:user_id) {|n| n}
    current_price {1000.00}
  end
end
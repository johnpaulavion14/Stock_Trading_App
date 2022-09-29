FactoryBot.define do
  factory :stock do
    sequence(:name) {|n| "Advanced Micro Devices#{n}"}
    sequence(:symbol) {|n|"AMD#{n}"}
    price {140.35}
    percent_change {"+1.39%"}
  end
end
# t.string "name"
# t.string "symbol"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.float "price"
# t.string "percent_change"


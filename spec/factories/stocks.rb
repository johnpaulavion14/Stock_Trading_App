FactoryBot.define do
    factory :stock do
      sequence(:name) {|n| "Advanced Micro Devices#{n}"}
      sequence(:symbol) {|n|"AMD#{n}"}
      price {140.35}
      percent_change {"+1.39%"}
    end
end
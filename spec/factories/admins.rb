FactoryBot.define do
  factory :admin do
    sequence(:email) {|n| "john#{n}@test.test"}
    sequence(:password) {|n| "password+#{n}"}
  end

end

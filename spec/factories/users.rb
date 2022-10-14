FactoryBot.define do
    factory :user do
      sequence(:email) {|n| "john#{n}@test.test"}
      sequence(:password) {|n| "password+#{n}"}
      first_name {"john paul"}
      last_name {"bocatija"}
      age {23}
      gender {"male"}
      address {"manila"}
      is_approved {true}
      confirmed_at {Time.now}
    end
  
end
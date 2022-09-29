FactoryBot.define do
  factory :user do
    # sequence(:id) {|n| n}
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

  # factory :login_user do
  #   sequence(:email) {|n| "john+#{n}@test.test"}
  #   sequence(:password) {|n| "password+#{n}"}
  # end
end


# t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "confirmation_token"
#     t.datetime "confirmed_at"
#     t.datetime "confirmation_sent_at"
#     t.string "unconfirmed_email"
#     t.string "first_name"
#     t.string "last_name"
#     t.integer "age"
#     t.string "gender"
#     t.string "address"
#     t.boolean "is_approved", default: false
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
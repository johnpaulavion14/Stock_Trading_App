FactoryBot.define do
  factory :admin do
    sequence(:email) {|n| "john#{n}@test.test"}
    sequence(:password) {|n| "password+#{n}"}
  end

  # factory :admin do
  #   email {"admin@test.com"}
  #   password {"qwertyu"}
  # end
end

# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["email"], name: "index_admins_on_email", unique: true
# t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

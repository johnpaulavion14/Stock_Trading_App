require 'rails_helper'

RSpec.describe User, type: :model do

describe '#email' do
  it "email should not be null" do
      user = create(:user)
      user.email = nil
      user.save
      expect(user).to_not be_valid
  end

  it "input shoud be email address" do
    user = create(:user)
    user.email = 'test@test.com'
    user.save
    expect(user).to be_valid
  end

  it "input not equal to email address should be invalid" do
    user = create(:user)
    user.email = 'not an email address'
    user.save
    expect(user).to_not be_valid
  end
end

describe '#password' do
  it "password should not be null" do
      user = create(:user)
      user.password = nil
      user.save
      expect(user).to_not be_valid
  end
end
  
describe '#first_name' do
  it "first_name should not be null" do
      user = create(:user)
      user.first_name = nil
      user.save
      expect(user).to_not be_valid
  end
end

describe '#last_name' do
  it "last_name should not be null" do
      user = create(:user)
      user.last_name = nil
      user.save
      expect(user).to_not be_valid
  end
end

describe '#age' do
  it "age should not be null" do
      user = create(:user)
      user.age = nil
      user.save
      expect(user).to_not be_valid
  end
  it "age should be integer only" do
    user = create(:user)
    user.age = 'number'
    user.save
    expect(user).to_not be_valid

    user2 = create(:user)
    user2.age = 99.00
    user2.save
    expect(user2).to_not be_valid
  end
  it "age should not be greater than 100" do
    user = create(:user)
    user.age = 101
    user.save
    expect(user).to_not be_valid
  end
end

describe '#gender' do
  it "gender should not be null" do
      user = create(:user)
      user.gender = nil
      user.save
      expect(user).to_not be_valid
  end
  it "gender should be male or female" do
    user = create(:user)
    user.gender = "maleee"
    user.save
    expect(user).to_not be_valid

    user2 = create(:user)
    user2.gender = "femaleeee"
    user2.save
    expect(user2).to_not be_valid
  end
end

describe '#address' do
  it "address should not be null" do
      user = create(:user)
      user.address = nil
      user.save
      expect(user).to_not be_valid
  end
end

describe '#is_approved' do
  it "is_approved should not be null" do
      user = create(:user)
      user.is_approved = nil
      user.save
      expect(user).to_not be_valid
  end
  # it "is_approved should only accept true or false" do
  #   user = create(:user)
  #   user.is_approved = 'asdfsd'
  #   user.save
  #   expect(user).to_not be_valid
  # end

end

end
# sequence(:id) {|n| n}
# sequence(:email) {|n| "john+#{n}@test.test"}
# sequence(:password) {|n| "password+#{n}"}
# first_name {"john paul"}
# last_name {"bocatija"}
# age {23}
# gender {"male"}
# address {"manila"}
# is_approved {true}
# confirmation_token {@token}
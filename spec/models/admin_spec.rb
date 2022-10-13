require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '#email' do
    it "email should not be null" do
        admin = create(:admin)
        admin.email = nil
        admin.save
        expect(admin).to_not be_valid
    end

    it "input shoud be email address" do
      admin = create(:admin)
      admin.email = 'test@test.com'
      admin.save
      expect(admin).to be_valid
    end

    it "input not equal to email address should be invalid" do
      admin = create(:admin)
      admin.email = 'not an email address'
      admin.save
      expect(admin).to_not be_valid
    end
  end

  describe '#password' do
    it "password should not be null" do
        admin = create(:admin)
        admin.password = nil
        admin.save
        expect(admin).to_not be_valid
    end
  end

end
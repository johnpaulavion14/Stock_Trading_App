require 'rails_helper'

describe User, type: :model do
  subject {
    User.new(first_name:'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sed voluptas dolor numquam soluta suscipit aperiam illo neque in similique providentddsf')
  }

#   subject{
#     User.new(first_name:nil)
#   }
#   subject {
#     user = User.new(first_name:'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sed voluptas dolor numquam soluta suscipit aperiam illo neque in similique providentddsf')
#     user.save
#   }
  it 'Firstname is not valid more than 20 chars' do
    expect(subject).to_not be_valid
  end

#   it 'Firstname is not valid more than 20 chars' do
#     expect(name).to_not be_valid
#   end

#   it 'Firstname is not valid more than 20 chars' do
#     expect(subject).to eq(false)
#   end

#   it 'is not valid without a title' do
#     subject.first_name = nil
#     expect(subject).to_not be_valid
#   end
end
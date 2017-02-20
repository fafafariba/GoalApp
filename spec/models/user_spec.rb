# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
  end

  describe 'associations' do
    #it { should have_many(:goals) }
  end

  describe 'class methods' do

    before(:each) do
      subject(:user) { User.create!(username: "username", password: "password") }
      let (:bad_password) { "bad_password" }
    end

    it 'returns user with valid login credentials' do
      found_user = User.find_by_credentials(user[:username], user[:])
      expect(User).to receive(:find_by_credentials).and return(:user)

    end
    it 'returns nil with invalid login credentials' do

    end

  end
end

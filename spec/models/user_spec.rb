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

  subject(:user) { FactoryGirl.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
  end

  describe 'associations' do
    #it { should have_many(:goals) }
  end



  describe 'User::find_by_credentials' do
    before { user.save! }
    let (:bad_password) { "bad_password" }

    it 'returns user with valid login credentials' do
      founder_user = User.find_by_credentials(user.username, user.password)

      expect(founder_user).to eq(user)
    end

    it 'returns nil with invalid login credentials' do
      founder_user = User.find_by_credentials(user.username, bad_password)

      expect(founder_user).to be nil
    end
  end

  describe '#reset_session_token' do

    it 'reset_session_token' do
      current_session_token = user.session_token
      user.reset_session_token
      expect(current_session_token).not_to eq(user.session_token)
    end
  end
end

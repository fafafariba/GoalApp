require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  subject(:user) { FactoryGirl.build(:user) }

  scenario "has a new user page" do
    visit "users/new"
    expect(page).to be_present
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up(user.username, user.password)
      expect(page).to have_content(user.username)
    end
  end
end

feature "logging in" do

  subject(:user) { FactoryGirl.build(:user) }
  let (:password) { user.password }

  scenario "shows username on the homepage after login" do
    user.save!
    login(user.username, password)
    expect(page).to have_content(user.username)
  end

end

feature "logging out" do

  subject(:user) { FactoryGirl.build(:user) }
  # let (:password) { user.password }

  before(:each) do
    user.save
    p user.username
    p user.password

    login(user.username, password)
    logout
  end

  scenario "begins with a logged out state" do
    p user.username
    expect(page).to have_content("Login")
    expect(page).to have_content("Create Account")
  end

  scenario "doesn't show username on the homepage after logout" do
    p user.username
    expect(page).not_to have_content(user.username)
  end

end

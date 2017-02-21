require 'rails_helper'
require 'spec_helper'

feature "creating goals" do
  subject(:user) { FactoryGirl.build(:user) }
  let (:password) { user.password }


   before do
     p password
     p user.password
     user.save
     p password
     login(user.username, password)
     p password
   end

  scenario "user has add goal button on user page when logged in" do
    visit "/users/#{user.id}"
    expect(page).to have_content("Add New Goal")
  end

  scenario "user does not have add goal button when not logged in" do
    logout
    visit "/users/#{user.id}"
    expect(page).not_to have_content("Add New Goal")
  end

  scenario "user can create goal and it will show up on their page"

end

feature "showing goals" do

  scenario "users goal visible to all users on user page if goal is public"

  scenario "user goals not visible only to user when set to private"

end

feature "editing goals" do

  scenario "user can successfully edit goal"

  scenario "users cannot edit goals that are not theirs"

end

feature "deleting goals" do

  scenario "user can successfully delete goal"

  scenario "users cannot delete goals that are not theirs"

end

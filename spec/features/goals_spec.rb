require 'rails_helper'
require 'spec_helper'

feature "creating goals" do

  scenario "user has create goal button on user page"

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

feature "deleating goals" do

  scenario "user can successfully delete goal"

  scenario "users cannot delete goals that are not theirs"

end

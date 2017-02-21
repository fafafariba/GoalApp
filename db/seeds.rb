# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl_rails'
require 'faker'

User.destroy_all
user1 = FactoryGirl.create(:user)
user2 = FactoryGirl.create(:user)
user3 = FactoryGirl.create(:user)
user4 = FactoryGirl.create(:user)



Goal.destroy_all
goal1 = FactoryGirl.create(:goal, user_id: user1.id)
goal2 = FactoryGirl.create(:goal, user_id: user1.id)
goal3 = FactoryGirl.create(:goal, user_id: user1.id)
goal4 = FactoryGirl.create(:goal, user_id: user1.id)
goal5 = FactoryGirl.create(:goal, user_id: user2.id)
goal6 = FactoryGirl.create(:goal, user_id: user2.id)
goal7 = FactoryGirl.create(:goal, user_id: user2.id)
goal8 = FactoryGirl.create(:goal, user_id: user3.id)
goal9 = FactoryGirl.create(:goal, user_id: user3.id)
goal10 = FactoryGirl.create(:goal, user_id: user4.id)
goal11 = FactoryGirl.create(:goal, user_id: user4.id)
goal12 = FactoryGirl.create(:goal, user_id: user4.id)
goal13 = FactoryGirl.create(:goal, user_id: user4.id)
goal14 = FactoryGirl.create(:goal, user_id: user4.id)

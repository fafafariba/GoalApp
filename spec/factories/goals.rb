FactoryGirl.define do
  factory :goal do
    name { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
  end
end

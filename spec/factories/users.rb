# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email 'larahy@gmail.com'
  	password 'hugothedog'
  	password_confirmation 'hugothedog'
  end
end

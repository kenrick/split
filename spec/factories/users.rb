FactoryGirl.define do
  factory :user do
    provider "github"
    uid "12345"
    name "john"
  end
end

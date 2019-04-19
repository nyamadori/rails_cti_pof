FactoryBot.define do
  factory :feature_request do
    issue
    sponser { FFaker::Name.name }
  end
end

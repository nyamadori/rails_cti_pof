FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.safe_email }
  end
end

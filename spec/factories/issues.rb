FactoryBot.define do
  factory :issue do
    user
    product
    title { FFaker::Lorem.phrase }
    description { FFaker::Lorem.paragraphs }
  end
end

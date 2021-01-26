FactoryBot.define do
  factory :post_image do
    caption { Faker::Lorem.character(number: 5) }
    address { Faker::Lorem.character(number: 5) }
    user
  end
end
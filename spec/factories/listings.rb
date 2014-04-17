# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    description Faker::Lorem.sentence
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zipcode Faker::Address.zip
    number_of_people Faker::Number.digit
    price_per_night Faker::Number.number(3)

    factory :entire_place do
      property_type "Entire Place"
    end

    factory :private_room do
      property_type "Private Room"
    end

    factory :shared_room do
      property_type "Shared Room"
    end
  end
end

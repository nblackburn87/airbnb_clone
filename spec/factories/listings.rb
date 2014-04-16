# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zipcode Faker::Address.zip
    number_of_people Faker::Number.digit
    price_per_night Faker::Number.number(3)

    factory :entire_place do
      type "Entire Place"
    end

    factory :private_room do
      type "Private Room"
    end

    factory :shared_room do
      type "Shared Room"
    end
  end
end

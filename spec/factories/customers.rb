FactoryBot.define do
    factory :customer do
      surname { Faker::Lorem.word }
      othernames { Faker::Lorem.word }
    end
  end
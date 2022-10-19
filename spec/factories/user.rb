FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      email {'test@email.com'}
      password_digest {'Testpassword15151gss'}
    end
  end
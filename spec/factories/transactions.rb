  FactoryBot.define do
    factory :transaction do
      in_amount { Faker::Number.number(digits: 10) }
      in_currency { Faker::Currency.code }
      out_amount { Faker::Number.number(digits: 10) }
      out_currency { Faker::Currency.code }
      date_of_transaction {Faker::Date.in_date_period(year: 2022, month: 9)}
      
    end
  end

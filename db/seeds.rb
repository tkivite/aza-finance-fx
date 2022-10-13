# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def seed_customers
    id = 0
    10.times do 
      Customer.create(
        surname: "surname_#{id}",
        othernames: "othernames_#{id}"        
      )
      id = id + 1
    end
  end
 
  
  def seed_transactions
    customers = Customer.all 
    amount = 100 
    customers.each do |customer|
      5.times do
       p = Transaction.create(
            inAmount: amount,
            inCurrency: 'KES',
            outAmount: amount+10,
            outCurrency: 'USD',
            dateOfTransaction: '20221017',
            customer_id: customer.id,
        ) 
        amount++      
      end
    end
  end

  seed_customers
seed_transactions
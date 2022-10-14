class Customer < ApplicationRecord
  self.implicit_order_column = 'created_at'
  # model association
  has_many :transactions, dependent: :destroy

  # validations
  validates_presence_of :surname, :othernames
end

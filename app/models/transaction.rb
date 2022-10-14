class Transaction < ApplicationRecord
  self.implicit_order_column = 'created_at'
#   associations 
  belongs_to :customer

#   validation
  validates_presence_of :in_amount, :in_currency, :out_amount, :out_currency, :date_of_transaction
  validates :in_amount, :out_amount, numericality: true
#   Should we allow future dates for this field, if not we can enable this validation
#   validates :date_of_transaction, comparison: { less_than: (Time.now).strftime("%Y%m%d%H%M%S%L") }
end

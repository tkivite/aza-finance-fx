require 'rails_helper'

# Test suite for the Transaction model
RSpec.describe Customer, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:transactions) }
  # Validation tests
  # ensure columns tin_amount,in_currency,out_amount,out_currency and date_of_transaction are present before saving
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:othernames) }
end
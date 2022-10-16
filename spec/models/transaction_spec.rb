require 'rails_helper'

# Test suite for the Transaction model
RSpec.describe Transaction, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should belong_to(:customer) }
  # Validation tests
  # ensure columns tin_amount,in_currency,out_amount,out_currency and date_of_transaction are present before saving
  it { should validate_presence_of(:in_amount) }
  it { should validate_presence_of(:in_currency) }
  it { should validate_presence_of(:out_amount) }
  it { should validate_presence_of(:out_currency) }
  it { should validate_presence_of(:date_of_transaction) }
  it { should validate_numericality_of(:in_amount) }
  it { should validate_numericality_of(:out_amount) }
end
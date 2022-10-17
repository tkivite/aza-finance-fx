require 'rails_helper'
RSpec.describe 'Transactions API' , type: :request do
    # Initialize the test data
    let!(:customer) { create(:customer) }
    let!(:transactions) { create_list(:transaction, 10, customer_id: customer.id) }
    let(:customer_id) { customer.id }
    let(:id) { transactions.first.id }
    # Test suite for GET /api/v1/transactions
    describe 'GET /api/v1/transactions' do
      before { get "/api/v1/transactions" }
  
      context 'when transactions  exists' do
        it 'returns status code 200' do
          p JSON.parse(response.body).size
          expect(response).to have_http_status(200)
        end
  
        it 'returns all transactions' do
          expect(JSON.parse(response.body).size).to eq(10)
        end
      end
    end
  
    # Test suite for GET /api/v1/transactions/:id
    describe 'GET /api/v1/transactions/:id' do
      before { get "/api/v1/transactions/#{id}" }
  
      context 'when  transaction exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns the transaction' do
          expect(JSON.parse(response.body)['id']).to eq(id)
        end
      end
  
      context 'when transaction does not exist' do
        let(:id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  
  end
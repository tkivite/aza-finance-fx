require 'rails_helper'
RSpec.describe 'Transactions API' , type: :request do
    # Initialize the test data
    let!(:customer) { create(:customer) }
    let!(:transactions) { create_list(:transaction, 20, customer_id: customer.id) }
    let(:customer_id) { customer.id }
    let(:id) { transactions.first.id }
    # @controller =  Api::V1::TransactionsController.new
    
    # Test suite for GET /api/v1/transactions
    describe 'GET /api/v1/transactions' do
      before { get "/api/v1/transactions" }
  
      context 'when transactions  exists' do
        it 'returns status code 200' do
          p JSON.parse(response.body).size
          expect(response).to have_http_status(200)
        end
  
        it 'returns all transactions' do
          expect(JSON.parse(response.body).size).to eq(20)
        end
      end

    end
  
    # Test suite for GET /todos/:todo_id/items/:id
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
  
        # ß
      end
    end
  
    # # Test suite for PUT /todos/:todo_id/items
    # describe 'POST /todos/:todo_id/items' do
    #   let(:valid_attributes) { { name: 'Visit Narnia', done: false } }
  
    #   context 'when request attributes are valid' do
    #     before { post "/todos/#{todo_id}/items", params: valid_attributes }
  
    #     it 'returns status code 201' do
    #       expect(response).to have_http_status(201)
    #     end
    #   end
  
    #   context 'when an invalid request' do
    #     before { post "/api/v1/transactions", params: {} }
  
    #     it 'returns status code 422' do
    #       expect(response).to have_http_status(422)
    #     end
  
    #     it 'returns a failure message' do
    #       expect(response.body).to match(/Validation failed: Name can't be blank/)
    #     end
    #   end
    # end
  
    # # Test suite for PUT /todos/:todo_id/items/:id
    # describe 'PUT /api/v1/transactions/:id' do
    #   let(:
    #     valid_attributes) { { name: 'Mozart' } }
  
    #   before { put "/todos/#{todo_id}/items/#{id}", params: valid_attributes }
  
    #   context 'when item exists' do
    #     it 'returns status code 204' do
    #       expect(response).to have_http_status(204)
    #     end
  
    #     it 'updates the item' do
    #       updated_item = Item.find(id)
    #       expect(updated_item.name).to match(/Mozart/)
    #     end
    #   end
  
    #   context 'when the item does not exist' do
    #     let(:id) { 0 }
  
    #     it 'returns status code 404' do
    #       expect(response).to have_http_status(404)
    #     end
  
    #     it 'returns a not found message' do
    #       expect(response.body).to match(/Couldn't find Item/)
    #     end
    #   end
    # end
  
    # Test suite for DELETE /api/v1/transactions:id
    # describe 'DELETE /api/v1/transactions/:id' do
    #   before { delete "/api/v1/transactions/#{transaction_id}" }
  
    #   it 'returns status code 204' do
    #     expect(response).to have_http_status(204)
    #   end
    # end
  end
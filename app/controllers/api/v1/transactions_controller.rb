class Api::V1::TransactionsController < ApplicationController
  def index
    # transactions = Transaction.all
    # @transactions = Transaction
    transactions = Transaction.joins(:customer)
    .order(created_at: :desc)
    .select(
      "transactions.id,
      transactions.in_amount,
      transactions.in_currency,
      transactions.out_amount,
      transactions.out_currency,
      transactions.date_of_transaction,
      customers.surname,
      customers.othernames      
      ").paginate(:page => params[:page], :per_page => ENV["DATA_PAGE_SIZE"])
    render json: transactions, status: 200
  end

  def create
    transaction = Transaction.new(
      in_amount: params[:in_amount],
      in_currency: params[:in_currency],
      out_amount: params[:out_amount],
      out_currency: params[:out_currency],
      date_of_transaction: params[:date_of_transaction],
      customer_id: params[:customer_id],
    )
    if transaction.save
      render json: transaction, status: 200
    else
      render json: {error: transaction.errors.objects.first.full_message}, status: 422
    end
  end


  def show
    transaction = Transaction.find_by(id: params[:id])
    if transaction
      render json: transaction, status: 200   
    else
      render  nil, status: 404 
    end
  end
end

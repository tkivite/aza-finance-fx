class Api::V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    render json: transactions, status: 200
  end

  def create
    transaction = Transaction.new(
      inAmount: params[:in_amount],
      inCurrency: params[:in_currency],
      outAmount: params[:out_amount],
      outCurrency: params[:out_currency],
      dateOfTransaction: params[:date_of_transaction],
      customer_id: params[:customer_id],
    )
    if transaction.save
      render json: transaction, status: 200
    else
      render json: {error: "Error creating transaction"}
    end
  end


  def show
    transaction = Transaction.find_by(id: params[:id])
    if transaction.save
      render json: transaction, status: 200
    else
      render json: {error: "Error creating transaction"}
    end
  end
end

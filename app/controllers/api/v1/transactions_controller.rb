class Api::V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
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

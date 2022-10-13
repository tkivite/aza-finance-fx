class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.decimal :in_amount
      t.string :in_currency
      t.decimal :out_amount
      t.string :out_currency
      t.string :date_of_transaction
      t.references :customer, null: false, foreign_key: true,type: :uuid


      t.timestamps
    end
  end
end

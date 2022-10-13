class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :inAmount
      t.string :inCurrency
      t.decimal :outAmount
      t.string :outCurrency
      t.string :dateOfTransaction
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

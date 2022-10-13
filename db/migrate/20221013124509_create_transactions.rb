class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :inAmount
      t.string :inCurrency
      t.decimal :outAmount
      t.string :outCurrency
      t.string :string
      t.string :dateOfTransaction

      t.timestamps
    end
  end
end

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :surname
      t.string :othernames

      t.timestamps
    end
  end
end

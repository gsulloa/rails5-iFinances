class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :expense_id
      t.integer :income_id
      t.timestamps
    end
    add_foreign_key :loans, :transactions, column: :expense_id
    add_foreign_key :loans, :transactions, column: :income_id

  end
end

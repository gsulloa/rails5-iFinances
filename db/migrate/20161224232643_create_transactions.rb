class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true
      t.string :commit
      t.date :when
      t.string :type

      t.timestamps
    end
  end
end

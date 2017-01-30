class AddAccountToLoans < ActiveRecord::Migration[5.0]
  def change
    add_reference :loans, :account, foreign_key: true
  end
end

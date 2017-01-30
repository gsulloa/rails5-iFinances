class AddCommitToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :commit, :string
  end
end

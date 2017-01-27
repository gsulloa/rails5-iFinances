class CreateConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_configurations do |t|
      t.references :account
      t.references :user

      t.timestamps
    end
  end
end

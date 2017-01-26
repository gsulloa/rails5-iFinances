class AddDefaultToAccount < ActiveRecord::Migration[5.0]
  	def up
		add_column :accounts, :default, :bool, default: false
	end

	def down
  		remove_column :accounts, :default, :bool
	end
end

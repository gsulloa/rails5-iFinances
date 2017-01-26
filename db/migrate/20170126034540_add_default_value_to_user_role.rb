class AddDefaultValueToUserRole < ActiveRecord::Migration[5.0]
  	def up
		change_column_default :users, :role, from: nil, to: 0
	end

	def down
  		change_column_default :users, :role, from: 0, to: nil
	end
end

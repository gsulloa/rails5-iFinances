class AddDefaultToCdefault < ActiveRecord::Migration[5.0]
  def up
		change_column_default :cdefaults, :default, from: nil, to: false
	end

	def down
  		change_column_default :cdefaults, :default, from: false, to: nil
	end
end

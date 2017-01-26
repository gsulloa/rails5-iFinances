class AddDefaultAndRemoveDeletableToCategories < ActiveRecord::Migration[5.0]
  def up
		add_column :categories, :default, :bool, default: false
		remove_column :categories, :deletable, :bool
	end

	def down
  		add_column :categories, :deletable, :bool, default: true
		remove_column :categories, :default, :bool
	end
end

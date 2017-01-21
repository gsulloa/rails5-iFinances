class Expense < Transaction
	def category_type
		if category.class.name != "Ecategory"
			errors.add(:category, "Category must be Ecategory")
		end
	end
end
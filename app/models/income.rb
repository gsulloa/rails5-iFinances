class Income < Transaction
	def category_type
		if category.class.name != "Icategory"
			errors.add(:category, "Category must be Icategory")
		end
	end
end
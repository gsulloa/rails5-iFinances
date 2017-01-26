class Cdefault < ApplicationRecord
  	validates :type, presence: true
  	validates :name, presence: true
	validates :name, length: {maximum: 50}

	def destroy?
		!default
	end
end

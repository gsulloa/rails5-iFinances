class Cdefault < ApplicationRecord
  	validates :type, presence: true
  	validates :name, presence: true
	validates :name, length: {maximum: 50}
end

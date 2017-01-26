class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :type, presence: true
  validates :name, presence: true
  validates :name, length: {maximum: 50}
end

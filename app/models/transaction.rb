class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :account
  validates :amount, numericality: {greater_than_or_equal_to: 0}
  validates :type, presence: true
  validates :when, presence: true
  validate :category_type
end

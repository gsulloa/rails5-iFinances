class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :account

  validates :amount, numericality: {greater_than: 0}
  validates :type, presence: true
  validates :when, presence: true
  validates :commit, length: {maximum: 100}
  validate :category_type
end

class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  has_many :user_configurations
  validates :name, presence: true
end

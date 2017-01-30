class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :loans
  has_one :user_configuration
  validates :name, presence: true

  def destroy?
  	!default
  end
end

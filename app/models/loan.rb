class Loan < ApplicationRecord
  belongs_to :income, optional: true
  belongs_to :expense, optional: true
  belongs_to :account
end

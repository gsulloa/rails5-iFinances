class Loan < ApplicationRecord
  belongs_to :income
  belongs_to :expense
end
json.extract! transaction, :id, :amount, :category_id, :commit, :when, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
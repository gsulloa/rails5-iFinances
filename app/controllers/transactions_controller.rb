class TransactionsController < ApplicationController
  def index
  	if current_user.admin?
  		redirect_to admin_index_url
  	else
    	@transactions = Transaction.where( account: current_user.user_configuration.account )
	end	
  end
end

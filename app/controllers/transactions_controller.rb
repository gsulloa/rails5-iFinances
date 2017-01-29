class TransactionsController < ApplicationController
  def index
  	if current_user.admin?
  		redirect_to admin_index_url
  	else
  		if(params[:account_id])
  			@transactions = Transaction.where( account_id: params[:account_id])
  		else
    		@transactions = Transaction.where( account: current_user.user_configuration.account )
    	end
	end	
  end

  def general_analytics
  	@total_data = {
  		:expenses => Expense.where(:account => current_user.user_configuration.account).sum(:amount),
		:incomes => Income.where(:account => current_user.user_configuration.account).sum(:amount)
  	}
  end
end

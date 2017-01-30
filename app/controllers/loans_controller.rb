class LoansController < ApplicationController
  def index
  end

  def lend
    @transaction = Expense.new
  end

  def lend_me
    @transaction = Income.new
  end

  def create_lend
    @transaction = Expense.new lend_params
    @transaction.account = current_user.user_configuration.account
    @transaction.category = Ecategory.where(:default => true, :user => current_user).second
    @transaction.when = Time.now
    create :lend
  end

  def create_lend_me
    @transaction = Income.new lend_me_params
    @transaction.account = current_user.user_configuration.account
    @transaction.category = Icategory.where(:default => true, :user => current_user).second
    @transaction.when = Time.now
    create :lend_me
  end

  def create type
    respond_to do |format|
      if @transaction.save
        case type
        when :lend
          Loan.create! :expense => @transaction, :account => current_user.user_configuration.account, :commit => @transaction.commit
        when :lend_me
          Loan.create! :income => @transaction, :account => current_user.user_configuration.account, :commit => @transaction.commit
        end
        format.html { redirect_to loans_path, :flash => { :success => "Loan was successfully created." } }
      else
        puts @transaction.errors.full_messages
        format.html { render type }
      end
    end
  end

  def finish
    @loan = Loan.find params[:id]
    if @loan.income
      @loan.expense = Expense.create! :amount => @loan.income.amount, :account => current_user.user_configuration.account, :when => Time.now, :category => Ecategory.where(:default => true, :user => current_user).second, :commit => @loan.commit
    else
      @loan.income = Income.create! :amount => @loan.expense.amount, :account => current_user.user_configuration.account, :when => Time.now, :category => Icategory.where(:default => true, :user => current_user).second, :commit => @loan.commit
    end
    respond_to do |format|
      if @loan.save
          format.html { redirect_to loans_path, :flash => { :success => "Loan finished successfully." } }
      else
          format.html { redirect_to loans_path, :flash => { :error => "An error occurred when finishing the loan." } }
      end
    end

  end

  private
  def lend_params
    params.require(:expense).permit(:amount, :commit)
  end
  def lend_me_params
    params.require(:income).permit(:amount, :commit)
  end
end

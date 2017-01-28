class AccountsController < ApplicationController
  before_action :set_account, only: [:edit, :update, :destroy, :select]
  def index
    @accounts = current_user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, :flash => { :success => "Account #{@account.name} was successfully created." } }
        format.json { render :show, status: :created, location: accounts_path }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html {redirect_to accounts_path, :flash => { :success => "Account #{@account.name} was successfully updated." }  }
        format.json {render :show, status: :ok, location: accounts_path }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @account.destroy?
        transactions = @account.transactions
        default_account = Account.where(:user => current_user, :default => true).first
        default_account.transactions += transactions
        if @account.user_configuration
          default_account.user_configuration = @account.user_configuration
        end
        @account.destroy
        format.html { redirect_to accounts_path, :flash => {:success => "Account was successfully destroyed." } }
        format.json { head :no_content }
      else
        format.html { redirect_to accounts_path, :flash => {:error => "Account #{@account.name} can not be destroyed." } }
        format.json { head :no_content }
      end
    end
  end

  def select 
    user_configuration = current_user.user_configuration
    user_configuration.account = @account
    respond_to do |format|
      if user_configuration.save!
        format.html { redirect_to accounts_path, :flash => {:success => "Account #{@account.name} was successfully selected."} }
      else
        format.html { redirect_to accounts_path, :flash => {:error => "An error occurred selecting Account #{@account.name}."} }
      end
    end
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
        params.require(:account).permit(:name, :default, :type)
    end
end

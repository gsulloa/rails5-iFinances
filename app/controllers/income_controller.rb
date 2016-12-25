class IncomeController < ApplicationController
  before_action :set_income, only: [:edit, :update, :destroy]
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:income).permit(:amount, :category_id, :commit, :when)
    end
end

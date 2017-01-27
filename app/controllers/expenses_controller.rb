class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.account = current_user.user_configuration.account
    respond_to do |format|
      if @expense.save
        format.html { redirect_to root_url, flash: { :success => 'Expense was successfully created.' } }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expense_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :category_id, :commit, :when)
    end
end

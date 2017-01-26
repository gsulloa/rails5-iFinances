class CdefaultsController < ApplicationController
  before_action :set_cdefault, only: [:edit, :update, :destroy]
  before_action :new_cdefault, only: [:new]
  def index
    @cdefaults = Cdefault.all
  end

  def new
  end

  def create
    @cdefault = Cdefault.new(cdefault_params)

    respond_to do |format|
      if @cdefault.save
        format.html { redirect_to admin_index_path, notice: 'Cdefault was successfully created.' }
        format.json { render :show, status: :created, location: admin_index_path }
      else
        format.html { render :new }
        format.json { render json: @cdefault.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cdefault.update(cdefault_params)
        format.html {redirect_to admin_index_path, notice: 'Cdefault was successfully updated.' }
        format.json {render :show, status: :ok, location: admin_index_path }
      else
        format.html { render :edit }
        format.json { render json: @cdefault.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @cdefault.destroy?
        @cdefault.destroy
        format.html { redirect_to admin_index_url, notice: 'Cdefault was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_index_url, notice: 'Cdefault can not be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cdefault
      @cdefault = Cdefault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cdefault_params
      params.require(:cdefault).permit(:name, :default, :type)
    end

    def new_cdefault
      @cdefault = Cdefault.new
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = get_categories
  end

  def new
    @category = new_category
  end

  def create
    @category = new_category(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save!
        format.html { redirect_to get_index_path, :flash => { :success => "#{type} Category #{@category.name} was successfully created." } }
        format.json { render :show, status: :created, location: get_index_path }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update!(category_params)
        format.html { redirect_to get_index_path, :flash => { :success => "#{type} Category #{@category.name} was successfully updated." } }
        format.json { render :show, status: :created, location: get_index_path }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.destroy?
        @category.destroy
        format.html { redirect_to get_index_path, :flash => {:success => "#{type} Category was successfully destroyed." } }
        format.json { head :no_content }
      else
        format.html { redirect_to get_index_path, :flash => {:error => "#{type} Category #{@category.name} can not be destroyed." } }
        format.json { head :no_content }
      end
    end
  end

end

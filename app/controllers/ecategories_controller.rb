class EcategoriesController < CategoriesController
    private
  def set_category
    @category = Ecategory.find(params[:id])
  end

  def category_params
    params.require(:ecategory).permit(:name)
  end

  def get_categories
    @categories = current_user.ecategories
  end

  def new_category params = nil
    @category = Ecategory.new params
  end

  def get_index_path
    ecategories_path
  end

  def type
    "Expense"
  end
end

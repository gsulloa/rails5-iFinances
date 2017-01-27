class IcategoriesController < CategoriesController
    private
  def set_category
    @category = Icategory.find(params[:id])
  end

  def category_params
    params.require(:icategory).permit(:name)
  end

  def get_categories
    @categories = current_user.icategories
  end

  def new_category params = nil
    @category = Icategory.new params
  end

  def get_index_path
    icategories_path
  end

  def type
    "Income"
  end
end

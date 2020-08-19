class CategoriesController < ApplicationController
    before_action :current_user
 

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        
        if @category.save
            redirect_to categories_path
        else
            flash[:error] = "Category already exists"
            render :new
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end
end

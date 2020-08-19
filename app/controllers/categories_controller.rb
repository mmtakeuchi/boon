class CategoriesController < ApplicationController
    before_action :current_user
    before_action :set_category, only: [:show, :edit, :update, :destroy]
 

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
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path
    end

    def set_category
        @category = Category.find_by_id(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end

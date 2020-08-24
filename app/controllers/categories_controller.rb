class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    before_action :set_category, only: [:show, :edit, :update, :destroy]
 

    def index
        @categories = Category.all
    end

    def show
        @result = category_name(set_category)
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

    private

    def set_category
        @category = Category.find_by_id(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end

    def category_name(category)
        @category.stocks.map {|stock| stock.name}.uniq
    end
end

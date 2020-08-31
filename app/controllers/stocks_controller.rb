class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    before_action :set_stock, only: [:show, :edit, :update, :destroy]
    

    def index
        if params[:term] || params.empty?
            @stocks = current_user.stocks.search(params[:term])
            if @stocks.empty?
                redirect_to user_stocks_path(current_user)
            end
        elsif params[:stock] && params[:stock][:category_id]
            @stocks = Stock.filtered(params[:stock][:category_id].to_i)
        else
            @stocks = current_user.stocks.sorted_date
        end
    end

    def new
        @category = Category.find_by_id(params[:category_id])
        @stock = Stock.new
        
    end

    def create
        @stock = current_user.stocks.build(stock_params)
        
        if @stock.save
            redirect_to stocks_path
        else
            render :new
        end
    end

    def show
        @stock_categories = @stock.categories.map { |category| category.name }.join(", ")
    end

    def edit
    end

    def update
        
        if @stock.update(stock_params)
            redirect_to stock_path(@stock)
        else
            
            render :edit
        end
    end

    def destroy
        @stock.destroy
        redirect_to stocks_path
    end

    private

    def set_stock
        @stock = Stock.find_by_id(params[:id])
    end

    def stock_params
        params.require(:stock).permit(:action_date, :name, :ticker, :price, :cost, :shares, category_ids:[], categories_attributes:[:name])
    end
end

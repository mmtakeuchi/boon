class StocksController < ApplicationController
    before_action :current_user
    before_action :set_stock, only: [:show, :edit, :update, :destroy]

    def index
        @stocks = current_user.stocks
    end

    def new
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

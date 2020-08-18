class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_stock, only: [:show, :edit, :update]

    def index
        @stocks = Stock.all
    end

    def new
        @stock = Stock.new
    end

    def create
        @stock = current_user.stocks.build(stock_params)
        if @stock.save
            redirect_to stock_path(@stock)
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

    private

    def set_stock
        @stock = Stock.find_by_id(params[:id])
    end

    def stock_params
        params.require(:stock).permit(:name, :ticker, :price, :cost, :shares)
    end
end

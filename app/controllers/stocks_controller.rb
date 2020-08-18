class StocksController < ApplicationController
    before_action :authenticate_user!

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
        @stock = Stock.find_by_id(params[:id])
    end

    private

    def stock_params
        params.require(:stock).permit(:name, :ticker, :price, :cost, :shares)
    end
end

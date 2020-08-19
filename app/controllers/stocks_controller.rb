class StocksController < ApplicationController
    before_action :current_user
    before_action :set_stock, only: [:show, :edit, :update, :destroy]

    def index
        @stocks = current_user.stocks.sorted_date
    end

    def new
        @stock = Stock.new
    end

    def create
         
        @stock = current_user.stocks.build(stock_params)
        
        if @stock.save
            redirect_to user_stocks_path(current_user)
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

# Parameters: {"authenticity_token"=>"UcWc7cuXnqNJp+FeJrlU8Jg9fngtVT2FEVPgpVdg5m0dVabMqLaD4+T+2oJSDW/SsrcZXpcmC8TirtVLEAABJg==", 
# "stock"=>{"action_date"=>"2020-08-03", "name"=>"Apple", "ticker"=>"AAPL", "price"=>"429", "cost"=>"450", "shares"=>"5", "category_ids"=>["", "1"], 
# "categories_attributes"=>{"0"=>{"name"=>""}}}, "commit"=>"Create Stock"}

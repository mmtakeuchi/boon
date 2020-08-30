module StocksHelper
    def market_value(stock)
        stock.price * stock.shares
    end

    def stock_return(stock)
        ((stock.price * stock.shares) - (stock.cost * stock.shares))
    end
end

class StockCategory < ApplicationRecord
    belongs_to :stock
    belongs_to :category
end

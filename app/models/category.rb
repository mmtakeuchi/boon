class Category < ApplicationRecord
    has_many :stock_categories
    has_many :stocks, through: :stock_categories
end

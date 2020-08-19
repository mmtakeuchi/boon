class Category < ApplicationRecord
    has_many :stock_categories
    has_many :stocks, through: :stock_categories
    
    # not be able to create category that already exists,
    #   but also have multiple categories for a stock

    # validates :name, presence: true
    before_validation :capitalize_name, on: [ :create, :update ]
    
    private

    def capitalize_name
      self.name = name.capitalize
    end
end

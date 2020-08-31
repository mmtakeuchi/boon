class Category < ApplicationRecord
    has_many :stock_categories
    has_many :stocks, through: :stock_categories

    validates :name, uniqueness: true
    before_validation :capitalize_name, on: [ :create, :update ]
    
    private

    def capitalize_name
      self.name = name.capitalize
    end

    
end

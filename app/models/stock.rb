class Stock < ApplicationRecord
    has_many :stock_categories
    has_many :categories, through: :stock_categories
    belongs_to :user

    accepts_nested_attributes_for :categories

    def categories_attribtues=(category_attributes)
        category_attributes.values.each do |category_attributes|
            category = Category.find_or_create_by(category_attributes)
            self.categories << category
        end
    end
end

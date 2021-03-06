class Stock < ApplicationRecord
    has_many :stock_categories
    has_many :categories, through: :stock_categories
    belongs_to :user

    validates :action_date, :name, :price, :cost, :shares, presence: true
    validates :shares, :cost, :price, numericality: true

    # accepts_nested_attributes_for :categories

    scope :profit, -> { where("(price - cost) > ?", 0) }
    scope :sorted_profit, -> {self.profit.order(action_date: :asc)}
    scope :sorted_date, -> {self.order(action_date: :desc)}

    def self.search(params)
        where("LOWER(name) LIKE :term OR LOWER(ticker) LIKE :term", term: "%#{params}%")
    end

    def self.filtered(params)
        left_joins(:categories).where("category_id = ?", params)
    end

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            if category_attribute[:name].present?
                category = Category.find_or_create_by(category_attribute)
                self.categories << category
            end
        end
    end
end

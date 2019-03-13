class FoodDish < ApplicationRecord
  # model association
  belongs_to :menu

  # validation
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :cost
  validates_presence_of :number_of_orders
end

class Menu < ApplicationRecord
  # model association
  has_many :food_dishes, dependent: :destroy

  # validations
  validates_presence_of :title
end

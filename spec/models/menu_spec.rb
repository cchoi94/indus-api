require 'rails_helper'

# Test suite for the Menu model
RSpec.describe Menu, type: :model do
  # ensure Menu model has a 1:m relationship with the FoodDish model
  it { should have_many(:food_dishes).dependent(:destroy)}
  # Validation tests
  # ensure colums title are present before saving
  it { should validate_presence_of(:title)}
end

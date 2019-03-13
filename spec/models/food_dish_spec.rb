require 'rails_helper'

# Test suite for the Item model
RSpec.describe FoodDish, type: :model do
  # ensure an item record belongs to a single menu record
  it { should belong_to(:menu) }
  # Validation test
  # ensure column name, description, cost, number_of_orders is present before saving
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:cost)}
  it { should validate_presence_of(:number_of_orders)}
end

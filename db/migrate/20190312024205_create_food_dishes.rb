class CreateFoodDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :food_dishes do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.integer :number_of_orders
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end

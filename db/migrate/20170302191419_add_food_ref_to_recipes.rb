class AddFoodRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :food, foreign_key: true
  end
end

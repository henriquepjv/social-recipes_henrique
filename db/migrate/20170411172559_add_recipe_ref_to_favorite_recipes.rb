class AddRecipeRefToFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorite_recipes, :recipe, foreign_key: true
  end
end

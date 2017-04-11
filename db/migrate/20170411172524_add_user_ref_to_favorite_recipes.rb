class AddUserRefToFavoriteRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorite_recipes, :user, foreign_key: true
  end
end

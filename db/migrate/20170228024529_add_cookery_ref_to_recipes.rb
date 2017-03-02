class AddCookeryRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :cookery, foreign_key: true
  end
end

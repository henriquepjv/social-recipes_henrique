class RemoveCookeryFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :cookery, :string
  end
end

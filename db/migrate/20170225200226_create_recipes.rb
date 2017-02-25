class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cookery
      t.string :food_type
      t.integer :people_portion
      t.string :preparation_time
      t.string :difficult
      t.text :ingredients
      t.text :steps

      t.timestamps
    end
  end
end

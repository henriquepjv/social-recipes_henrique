class CreateCookeries < ActiveRecord::Migration[5.0]
  def change
    create_table :cookeries do |t|
      t.string :name

      t.timestamps
    end
  end
end

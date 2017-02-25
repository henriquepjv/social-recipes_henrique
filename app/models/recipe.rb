class Recipe < ApplicationRecord

  validates :name,:cookery, :food_type, :people_portion,
            :preparation_time, :difficult, :ingredients,
            :steps, presence: true

end

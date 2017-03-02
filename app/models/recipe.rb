class Recipe < ApplicationRecord

  belongs_to :cookery

  validates :name, :food_type, :people_portion,
            :preparation_time, :difficult, :ingredients,
            :steps, presence: true

end

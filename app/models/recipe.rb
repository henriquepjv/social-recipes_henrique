class Recipe < ApplicationRecord

  belongs_to :cookery
  belongs_to :food

  validates :name, :people_portion,
            :preparation_time, :difficult, :ingredients,
            :steps, presence: true

end

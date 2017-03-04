class Recipe < ApplicationRecord

  belongs_to :cookery
  belongs_to :food

  validates :name, :people_portion,
            :preparation_time, :difficult, :ingredients,
            :steps, presence: true

  scope :most_recent, -> {order(id: :desc)}

  searchkick

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end

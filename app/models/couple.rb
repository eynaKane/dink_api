class Couple < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :username,
            presence: true,
            uniqueness: true,
            length: {
              in: 6..20
            }
  validates :number_of_kids,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }
end

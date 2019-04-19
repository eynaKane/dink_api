class User < ApplicationRecord
  belongs_to :couple

  validates :full_name,
            presence: true,
            uniqueness: {
              scope: :couple
            }
  validates :income_cents,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }
end

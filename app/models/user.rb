# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  email        :string           not null
#  full_name    :string           not null
#  income_cents :integer          default(0), not null
#  couple_id    :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  belongs_to :couple

  validates :email,
            presence: true,
            uniqueness: {
              scope: :couple
            }
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

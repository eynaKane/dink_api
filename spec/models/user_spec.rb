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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

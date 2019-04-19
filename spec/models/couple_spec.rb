# == Schema Information
#
# Table name: couples
#
#  id             :bigint(8)        not null, primary key
#  username       :string           not null
#  number_of_kids :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Couple, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

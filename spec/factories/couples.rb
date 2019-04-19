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

FactoryBot.define do
  factory :couple do
    username { Faker::Internet.username(8) }
    number_of_kids { 0 }
  end
end

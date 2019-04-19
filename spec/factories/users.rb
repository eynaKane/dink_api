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

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { Faker::Name.name }
    income_cents { 10_000_00 }
    couple
  end
end

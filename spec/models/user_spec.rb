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
  let(:couple) do
    FactoryBot.create(:couple)
  end

  let :attributes do
    FactoryBot.attributes_for(
      :user,
      couple_id: couple.id
    )
  end

  context 'when a user is created' do
    subject :create! do
      User.create!(attributes)
    end

    it 'creates a user' do
      expect { create! }
        .to change(described_class, :count).by(1)
    end
  end
end

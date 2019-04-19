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
  let :attributes do
    FactoryBot.attributes_for(:couple)
  end

  context 'when a couple is created' do
    subject :create! do
      Couple.create!(attributes)
    end

    it 'creates a couple' do
      expect { create! }
        .to change(described_class, :count).by(1)
    end
  end
end

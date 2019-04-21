RSpec.describe Users::FindOrCreate do
  let :couple do
    FactoryBot.create(:couple)
  end

  let :users_params do
    [
      FactoryBot.attributes_for(
        :user,
        couple_id: couple.id
      ),
      FactoryBot.attributes_for(
        :user,
        couple_id: couple.id
      )
    ]
  end

  describe '#perform' do
    subject :perform do
      described_class.new(users_params).perform
    end

    context 'with valid users_params' do
      it 'creates the users' do
        expect do
          subject
        end.to change(User, :count).by(2)
      end
    end
  end
end

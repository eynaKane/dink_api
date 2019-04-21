RSpec.describe Users::CreateOrUpdate do
  let :couple do
    FactoryBot.create(:couple)
  end

  let :users_params do
    [
      FactoryBot.attributes_for(
        :user,
        couple_id: couple.id
      ).with_indifferent_access,
      FactoryBot.attributes_for(
        :user,
        couple_id: couple.id
      ).with_indifferent_access
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

    context 'with existing users' do
      let! :user do
        FactoryBot.create(:user, users_params[0])
      end

      it 'updates the users' do
        expect do
          subject
        end.to change(User, :count).by(1)
      end
    end
  end
end

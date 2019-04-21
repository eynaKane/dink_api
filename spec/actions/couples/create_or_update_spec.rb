RSpec.describe Couples::CreateOrUpdate do
  let :couple_params do
    FactoryBot.attributes_for(:couple).with_indifferent_access
  end

  describe '#perform' do
    subject :perform do
      described_class.new(couple_params).perform
    end

    context 'with valid couple_params' do
      it 'creates a couple' do
        expect do
          subject
        end.to change(Couple, :count).by(1)
      end
    end

    context 'with existing couple' do
      let! :couple do
        FactoryBot.create(:couple, couple_params)
      end

      it 'updates the couple' do
        expect do
          subject
        end.to change(Couple, :count).by(0)
      end
    end
  end
end

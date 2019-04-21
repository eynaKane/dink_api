RSpec.describe Couples::Reckoner do
  let :users do
    [
      FactoryBot.create(:user),
      FactoryBot.create(:user)
    ]
  end

  let :response_body do
    {
      dink_reckoner: '84%',
      message: 'Okay, now you can talk about marriage!'
    }
  end

  before do
    response = double
    allow(RestClient).to receive(:post).and_return(response)
    allow(response).to receive(:body).and_return(response_body.to_json)
  end

  describe '#perform' do
    subject :perform do
      described_class.new(users).perform
    end

    context 'with valid users_params' do
      it 'creates the users' do
        expect(subject).to eq(response_body.stringify_keys)
      end
    end
  end
end

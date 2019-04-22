module Spinach
  module Features
    class DinkReckoner < Spinach::FeatureSteps
      include Concerns::Requests

      attr_reader :couple, :users, :response

      before do
        couple_reckoner = double

        allow(Couples::Reckoner).to receive(:new)
          .and_return(couple_reckoner)
        allow(couple_reckoner).to receive(:perform)
          .and_return(reckoner_response.as_json)
      end

      step 'a couple' do
        @couple = FactoryBot.attributes_for(:couple)
      end

      step 'users information' do
        @users = [
          FactoryBot.attributes_for(:user),
          FactoryBot.attributes_for(:user)
        ]
      end

      step 'I post the couple payload' do
        @response = PostRequest.new(payload).response
      end

      step 'the response is successful' do
        expect(response.code).to eq('200')
        expect(response.body).to match(/Hi /)
        expect(response.body).to match(/dink_reckoner/)
        expect(response.body).to match(/dink_evaluation/)
      end

      private

      def payload
        {
          couple: couple.merge(users: users)
        }
      end

      def reckoner_response
        {
          dink_reckoner: '41%',
          message: 'You\'re better off with someone else!'
        }
      end
    end

    class PostRequest < ActionDispatch::IntegrationTest
      def initialize(payload)
        post(
          '/couples',
          params: payload,
          headers: { 'Accept': 'application/json' }
        )
      end
    end
  end
end

module Concerns
  module Requests
    extend ActiveSupport::Concern

    include ActionDispatch::Integration::Runner

    def app
      Rails.application
    end
  end
end

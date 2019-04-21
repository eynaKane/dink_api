module Couples
  class Reckoner
    attr_reader :full_names, :incomes, :response

    def initialize(users)
      @full_names = users.map(&:full_name)
      @incomes = users.map(&:income_cents)
    end

    def perform
      build_request
      post_request
      parse_response_body
    end

    private

    def build_request
      {
        couple: [
          {
            full_name: full_names[0],
            income_cents: incomes[0]
          },
          {
            full_name: full_names[1],
            income_cents: incomes[1]
          }
        ]
      }
    end

    def post_request
      @response = RestClient.post 'http://localhost:3001/reckoner', build_request
    end

    def parse_response_body
      JSON.parse(response.body)
    end
  end
end

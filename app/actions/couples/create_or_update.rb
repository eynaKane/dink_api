module Couples
  class CreateOrUpdate
    attr_reader :couple_params

    def initialize(couple_params)
      @couple_params = couple_params
    end

    def perform
      couple = Couple.find_by(username: couple_params['username'])

      if couple
        couple.update!(couple_params)
      else
        couple = Couple.create!(couple_params)
      end

      couple
    end
  end
end

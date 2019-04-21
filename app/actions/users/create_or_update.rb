module Users
  class CreateOrUpdate
    attr_reader :users_params

    def initialize(users_params)
      @users_params = users_params
    end

    def perform
      users_params.map do |user_params|
        user = User.find_by(email: user_params['email'])

        if user
          user.update!(user_params)
        else
          user = User.create!(user_params)
        end

        user
      end
    end
  end
end

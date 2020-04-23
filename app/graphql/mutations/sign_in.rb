# frozen_string_literal: true

module Mutations
  class SignIn < Mutations::BaseMutation
    graphql_name 'SignIn'

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      user = User.find_for_database_authentication(email: args[:email])

      unless user&.valid_password?(args[:password])
        return GraphQL::ExecutionError.new(I18n.t('invalid_credentials'))
      end

      context[:current_user] = user

      { user: user, success: true }
    end
  end
end

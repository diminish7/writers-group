# frozen_string_literal: true

module Mutations
  class Register < Mutations::BaseMutation
    graphql_name 'Register'

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: false

    def resolve(args)
      user = User.new(args)

      if user.save
        context[:current_user] = user

        { user: user, success: true }
      else
        user.errors.full_messages.map { |error| GraphQL::ExecutionError.new(error) }
      end
    end
  end
end

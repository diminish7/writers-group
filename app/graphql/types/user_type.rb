# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    graphql_name 'User'

    field :name, String, null: false
    field :email, String, null: false
    field :authentication_token, String, null: false

    def authentication_token
      return object.authentication_token if current_user?

      raise GraphQL::UnauthorizedFieldError, 'Cannot access authentication token for another user'
    end

    protected

    def current_user?
      object == context[:current_user]
    end
  end
end

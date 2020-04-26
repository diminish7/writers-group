# frozen_string_literal: true

module Mutations
  class SignOut < Mutations::BaseMutation
    graphql_name 'SignOut'

    def resolve
      user = context[:current_user]

      { success: user.update(authentication_token: nil) }
    end
  end
end

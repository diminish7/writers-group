# frozen_string_literal: true

module Mutations
  class SignOut < Mutations::BaseMutation
    graphql_name 'SignOut'

    def resolve
      { success: context[:current_user]&.update(authentication_token: nil) }
    end
  end
end

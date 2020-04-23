# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignIn
    # TODO: field :register, mutation: Mutations::Register
    # TODO: field :sign_out, mutation: Mutations::SignOut
  end
end

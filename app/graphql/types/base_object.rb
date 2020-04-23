# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    global_id_field :id

    def id
      object.uuid
    end
  end
end

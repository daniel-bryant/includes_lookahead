module Types
  class StudioRelationType < Types::BaseObject
    field :class_name, String, null: false
    field :includes_values, GraphQL::Types::JSON, null: false
    field :studios, [Types::StudioType], null: false
  end
end

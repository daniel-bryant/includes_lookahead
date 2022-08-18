module Types
  class FilmType < Types::BaseObject
    field :id, ID, null: false
    field :studio, Types::StudioType, null: false
    field :name, String, null: false
    field :release_date, GraphQL::Types::ISO8601Date, null: false
    field :appearances, [Types::AppearanceType], null: false
  end
end

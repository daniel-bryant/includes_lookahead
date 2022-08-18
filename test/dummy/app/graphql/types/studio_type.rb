# frozen_string_literal: true

module Types
  class StudioType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :films, [Types::FilmType], null: false
  end
end

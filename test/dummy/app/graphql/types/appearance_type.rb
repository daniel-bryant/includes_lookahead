# frozen_string_literal: true

module Types
  class AppearanceType < Types::BaseObject
    field :id, ID, null: false
    field :film, Types::FilmType, null: false
    field :role, Types::RoleType, null: false
    field :actor, Types::ActorType, null: false
    field :position, Integer, null: false
  end
end

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :studios, [Types::StudioType], null: false, extras: [:lookahead],
      description: "Lists all studios in name order"

    field :studio_relation, Types::StudioRelationType, null: false, extras: [:lookahead],
      description: "Provides a way to inspect the relation returned by Studio.includes_lookahead"

    def studios(lookahead:)
      Studio.includes_lookahead(lookahead).order(:name)
    end

    def studio_relation(lookahead:)
      relation = Studio.includes_lookahead(lookahead.selection(:studios))

      {
        class_name: relation.class.name,
        includes_values: relation.includes_values,
        studios: [],
      }
    end
  end
end

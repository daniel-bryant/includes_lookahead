require "test_helper"

class StudioRelationTest < ActiveSupport::TestCase
  test "studio_relation with no selections" do
    query = <<~GRAPHQL
      query StudioRelation {
        studioRelation {
          className
          includesValues
          studios {
            name
          }
        }
      }
    GRAPHQL

    result = DummySchema.execute(query, variables: {})

    assert_equal(
      {
        "data" => {
          "studioRelation" => {
            "className" => "ActiveRecord::Relation",
            "includesValues" => [],
            "studios" => [],
          },
        },
      },
      result.to_hash,
    )
  end

  test "studio_relation with selections" do
    query = <<~GRAPHQL
      query StudioRelation {
        studioRelation {
          className
          includesValues
          studios {
            name
            films {
              name
              releaseDate
              appearances {
                position
                role {
                  name
                }
                actor {
                  name
                }
              }
            }
          }
        }
      }
    GRAPHQL

    result = DummySchema.execute(query, variables: {})

    assert_equal(
      {
        "data" => {
          "studioRelation" => {
            "className" => "ActiveRecord::Relation",
            "includesValues" => [{ films: { appearances: { role: {}, actor: {} } } }],
            "studios" => [],
          },
        },
      },
      result.to_hash,
    )
  end
end

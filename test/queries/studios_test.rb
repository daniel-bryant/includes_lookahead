require "test_helper"

class StudiosTest < ActiveSupport::TestCase
  class SelectSubscriber < ActiveSupport::LogSubscriber
    @@count = 0

    def self.count
      @@count
    end

    def sql(event)
      if event.payload[:sql].match?(/SELECT/)
        @@count += 1
      end
    end
  end

  test "studios with no selections" do
    query = <<~GRAPHQL
      query Studios {
        studios {
          name
        }
      }
    GRAPHQL

    SelectSubscriber.attach_to :active_record

    assert_difference -> { SelectSubscriber.count }, 1 do
      result = DummySchema.execute(query, variables: {})
      assert result["data"]
    end

    SelectSubscriber.detach_from :active_record
  end

  test "studios with selections" do
    query = <<~GRAPHQL
      query Studios {
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
    GRAPHQL

    SelectSubscriber.attach_to :active_record

    assert_difference -> { SelectSubscriber.count }, 5 do
      result = DummySchema.execute(query, variables: {})
      assert result["data"]
    end

    SelectSubscriber.detach_from :active_record
  end
end

class Appearance < ApplicationRecord
  belongs_to :film
  belongs_to :role
  belongs_to :actor
end
